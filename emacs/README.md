# Emacs

This directory contains all my emacs configurations. In each
subdirectory, you can find a complete emacs configuration.

## profile

`profile` is my Emacs configuration, it my change a lot and it can be
unstable to use. I currently use `chemacs2` to be able to switch and
test different Emacs configurations and distributions.

Within it, you can find my own customized emacs from scratch, other
configurations from vanilla and full open source distributions like
Doom Emacs and Spacemacs. All available from the same Emacs.

The [profile](profile) directory is meant to be managed with GNU
`stow` and all files are supposed to go into your home directory.
You'll find the following layout:

- [.emacs-profiles.el](profile/.emacs-profiles.el) contains Chemacs2
  profile definitions
- [.emacs.d](profile/.emacs.d) is a git submodule containing
  [chemacs2](https://github.com/plexus/chemacs2) repository (to be
  able to update it if needed)
- [.emacs.d.shims](profile/.emacs.d.shims) is where I place sources
  and configurations for each shim. Inside it, you will find a similar
  structure:
  - `<profile-name>.d` for configurations
  - `sources/` for source files (git submodules for doom and spacemacs)

## doom

Doom Emacs

## newbie

Configuration for newbies. It's designed to be plug-and-play and it
has been created for iTIC newbies.

## spacemacs

Spacemacs with evil bindings
