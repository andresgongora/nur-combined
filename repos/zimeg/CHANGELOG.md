# Changelog

All notable changes to this project will be documented in this file.

Updates follow a [conventional commit][commits] style and the project is
versioned with [calendar versioning][calver]. Breaking changes sometimes happen
and are noted with a `!` in the message.

## Changes

- ci(feat): use the determinate systems installer for some flaked nix 2024-06-01
- ci(fix): set the github access token as input to the cachix install 2024-06-01
- build(ci): remove support of deprecated releases and track unstable 2024-06-01
- docs: direct link to the action job that builds and populates cache 2024-06-01
- docs: write references from recent learnings for future maintenance 2024-05-29
- fix(pkgs/zsh-wd): remove some unknown maintainers to pass ci checks 2024-05-26
- feat(pkgs/zsh-wd): initialize the zsh-wd package at a version 0.7.0 2024-05-26
- feat(build): target build support for aarch64 darwin flaked systems 2024-05-26
- feat: configure the nur packages template with replaced boilerplate 2024-05-26

[calver]: https://calver.org
[commits]: https://www.conventionalcommits.org/en/v1.0.0/
