{ stdenv, fetchurl, fetchFromGitHub, cmake, pkgconfig, ncurses, zlib, xz, lzo, lz4, bzip2, snappy
, libiconv, openssl, pcre, boost, judy, bison, libxml2, libkrb5
, libaio, libevent, jemalloc, cracklib, systemd, numactl, perl
, fixDarwinDylibNames, cctools, CoreServices
, asio, buildEnv, check, scons
}:

with stdenv.lib;

let # in mariadb # spans the whole file

mariadb = everything // {
  inherit client; # libmysqlclient.so in .out, necessary headers in .dev and utils in .bin
  server = everything; # a full single-output build, including everything in `client` again
  inherit galera;
};

galeraLibs = buildEnv {
  name = "galera-lib-inputs-united";
  paths = [ openssl.out boost check ];
};

common = rec { # attributes common to both builds
  version = "10.3.11";

  src = fetchurl {
    urls = [
      "https://downloads.mariadb.org/f/mariadb-${version}/source/mariadb-${version}.tar.gz"
      "https://downloads.mariadb.com/MariaDB/mariadb-${version}/source/mariadb-${version}.tar.gz"
    ];
    sha256 = "1cpi52ippd4x4fcq49lnya1fh0mcgrrr0v5yldxkkmf9jjvma5i1";
    name   = "mariadb-${version}.tar.gz";
  };

  nativeBuildInputs = [ cmake pkgconfig ];

  buildInputs = [
    ncurses openssl zlib pcre jemalloc libiconv
  ] ++ stdenv.lib.optionals stdenv.isLinux [ libaio systemd libkrb5 ]
    ++ stdenv.lib.optionals stdenv.isDarwin [ perl fixDarwinDylibNames cctools CoreServices ];

  prePatch = ''
    sed -i 's,[^"]*/var/log,/var/log,g' storage/mroonga/vendor/groonga/CMakeLists.txt
  '';

  patches = [ ./cmake-includedir.patch ]
    ++ stdenv.lib.optional stdenv.cc.isClang ./clang-isfinite.patch;

  cmakeFlags = [
    "-DBUILD_CONFIG=mysql_release"
    "-DMANUFACTURER=NixOS.org"
    "-DDEFAULT_CHARSET=utf8mb4"
    "-DDEFAULT_COLLATION=utf8mb4_unicode_ci"
    "-DSECURITY_HARDENED=ON"

    "-DINSTALL_UNIX_ADDRDIR=/run/mysqld/mysqld.sock"
    "-DINSTALL_BINDIR=bin"
    "-DINSTALL_DOCDIR=share/doc/mysql"
    "-DINSTALL_DOCREADMEDIR=share/doc/mysql"
    "-DINSTALL_INCLUDEDIR=include/mysql"
    "-DINSTALL_INFODIR=share/mysql/docs"
    "-DINSTALL_MANDIR=share/man"
    "-DINSTALL_MYSQLSHAREDIR=share/mysql"
    "-DINSTALL_SCRIPTDIR=bin"
    "-DINSTALL_SUPPORTFILESDIR=share/doc/mysql"
    "-DINSTALL_MYSQLTESTDIR=OFF"
    "-DINSTALL_SQLBENCHDIR=OFF"

    "-DWITH_ZLIB=system"
    "-DWITH_SSL=system"
    "-DWITH_PCRE=system"
    "-DWITH_SAFEMALLOC=OFF"
    "-DEMBEDDED_LIBRARY=OFF"
  ] ++ optional stdenv.isDarwin [
    # On Darwin without sandbox, CMake will find the system java and attempt to build with java support, but
    # then it will fail during the actual build. Let's just disable the flag explicitly until someone decides
    # to pass in java explicitly.
    "-DCONNECT_WITH_JDBC=OFF"
    "-DCURSES_LIBRARY=${ncurses.out}/lib/libncurses.dylib"
  ] ++ optional stdenv.hostPlatform.isMusl [
    "-DWITHOUT_TOKUDB=1" # mariadb docs say disable this for musl
  ];

  passthru.mysqlVersion = "5.7";

  meta = with stdenv.lib; {
    description = "An enhanced, drop-in replacement for MySQL";
    homepage    = https://mariadb.org/;
    license     = licenses.gpl2;
    maintainers = with maintainers; [ thoughtpolice wkennington ];
    platforms   = platforms.all;
  };
};

client = stdenv.mkDerivation (common // {
  name = "mariadb-client-${common.version}";

  outputs = [ "out" "dev" "man" ];

  propagatedBuildInputs = [ openssl zlib ]; # required from mariadb.pc

  patches = [ ./cmake-plugin-includedir.patch ];

  cmakeFlags = common.cmakeFlags ++ [
    "-DWITHOUT_SERVER=ON"
    "-DWITH_WSREP=OFF"
  ];

  postInstall = ''
    rm -r "$out"/share/mysql
    rm -r "$out"/share/doc
    rm "$out"/bin/{msql2mysql,mysql_plugin,mytop,wsrep_sst_rsync_wan,mysql_config,mariadb_config}
    rm "$out"/lib/plugin/{daemon_example.ini,dialog.so,mysql_clear_password.so,sha256_password.so}
    rm "$out"/lib/{libmariadb.so,libmysqlclient.so,libmysqlclient_r.so}
    mv "$out"/lib/libmariadb.so.3 "$out"/lib/libmysqlclient.so
    ln -sv libmysqlclient.so "$out"/lib/libmysqlclient_r.so
    mkdir -p "$dev"/lib && mv "$out"/lib/{libmariadbclient.a,libmysqlclient.a,libmysqlclient_r.a,libmysqlservices.a} "$dev"/lib
  '';

  enableParallelBuilding = true; # the client should be OK
});

everything = stdenv.mkDerivation (common // {
  name = "mariadb-${common.version}";

  outputs = [ "out" "dev" "man" ];

  nativeBuildInputs = common.nativeBuildInputs ++ [ bison ];

  buildInputs = common.buildInputs ++ [
    xz lzo lz4 bzip2 snappy
    libxml2 boost judy libevent cracklib
  ] ++ optional (stdenv.isLinux && !stdenv.isAarch32) numactl;

  cmakeFlags = common.cmakeFlags ++ [
    "-DMYSQL_DATADIR=/var/lib/mysql"
    "-DINSTALL_PLUGINDIR=lib/mysql/plugin"
    "-DENABLED_LOCAL_INFILE=OFF"
    "-DWITH_READLINE=ON"
    "-DWITH_EXTRA_CHARSETS=all"
    "-DWITH_EMBEDDED_SERVER=OFF"
    "-DWITH_UNIT_TESTS=OFF"
    "-DWITH_WSREP=ON"
    "-DWITH_INNODB_DISALLOW_WRITES=ON"
    "-DWITHOUT_EXAMPLE=1"
    "-DWITHOUT_FEDERATED=1"
  ] ++ stdenv.lib.optionals stdenv.isDarwin [
    "-DWITHOUT_OQGRAPH=1"
    "-DWITHOUT_TOKUDB=1"
  ];

  preConfigure = ''
    cmakeFlags="$cmakeFlags \
      -DINSTALL_SHAREDIR=$dev/share/mysql
      -DINSTALL_SUPPORTFILESDIR=$dev/share/mysql"
  '';

  postInstall = ''
    chmod +x "$out"/bin/wsrep_sst_common
    rm -r "$out"/data # Don't need testing data
    rm "$out"/bin/{mysql_find_rows,mysql_waitpid,mysqlaccess,mysqladmin,mysqlbinlog,mysqlcheck}
    rm "$out"/bin/{mysqldump,mysqlhotcopy,mysqlimport,mysqlshow,mysqlslap,mysqltest}
    rm "$out"/lib/mysql/plugin/{auth_gssapi_client.so,client_ed25519.so,daemon_example.ini}
    rm "$out"/lib/{libmysqlclient.so,libmysqlclient_r.so}
    mv "$out"/share/{groonga,groonga-normalizer-mysql} "$out"/share/doc/mysql
    mkdir -p "$dev"/lib && mv "$out"/lib/{libmariadbclient.a,libmysqlclient.a,libmysqlclient_r.a,libmysqlservices.a} "$dev"/lib
  '' + optionalString (! stdenv.isDarwin) ''
    sed -i 's/-mariadb/-mysql/' "$out"/bin/galera_new_cluster
  '';

  CXXFLAGS = optionalString stdenv.isi686 "-fpermissive"
    + optionalString stdenv.isDarwin " -std=c++11";
});

galera = stdenv.mkDerivation rec {
  name = "mariadb-galera-${version}";
  version = "25.3.25";

  src = fetchFromGitHub {
    owner = "codership";
    repo = "galera";
    rev = "release_${version}";
    sha256 = "09h25jldr8a9wadhw14hfszcp7xpc9kwff49j5a5m33wjn1ljq9d";
    fetchSubmodules = true;
  };

  buildInputs = [ asio boost check openssl scons ];

  postPatch = ''
    substituteInPlace SConstruct \
      --replace "boost_library_path = '''" "boost_library_path = '${boost}/lib'"
  '';

  preConfigure = ''
    export CPPFLAGS="-I${asio}/include -I${boost.dev}/include -I${check}/include -I${openssl.dev}/include"
    export LIBPATH="${galeraLibs}/lib"
  '';

  sconsFlags = "ssl=1 system_asio=1 strict_build_flags=0";

  installPhase = ''
    # copied with modifications from scripts/packages/freebsd.sh
    GALERA_LICENSE_DIR="$share/licenses/${name}"
    install -d $out/{bin,lib/galera,share/doc/galera,$GALERA_LICENSE_DIR}
    install -m 555 "garb/garbd"                       "$out/bin/garbd"
    install -m 444 "libgalera_smm.so"                 "$out/lib/galera/libgalera_smm.so"
    install -m 444 "scripts/packages/README"          "$out/share/doc/galera/"
    install -m 444 "scripts/packages/README-MySQL"    "$out/share/doc/galera/"
    install -m 444 "scripts/packages/freebsd/LICENSE" "$out/$GALERA_LICENSE_DIR"
    install -m 444 "LICENSE"                          "$out/$GALERA_LICENSE_DIR/GPLv2"
    install -m 444 "asio/LICENSE_1_0.txt"             "$out/$GALERA_LICENSE_DIR/LICENSE.asio"
    install -m 444 "www.evanjones.ca/LICENSE"         "$out/$GALERA_LICENSE_DIR/LICENSE.crc32c"
    install -m 444 "chromium/LICENSE"                 "$out/$GALERA_LICENSE_DIR/LICENSE.chromium"
  '';

  meta = {
    description = "Galera 3 wsrep provider library";
    homepage = http://galeracluster.com/;
    license = licenses.lgpl2;
    maintainers = with maintainers; [ izorkin ];
    platforms = platforms.all;
  };
};
in mariadb
