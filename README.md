# conf

*conf* is my *dotfiles* repository, i.e., where I have my
configuration (more or less) up to date.

If you are interested on trying any of my configurations, feel free to
do it. Even more, I'll be happy to hear feedback from it! Be aware
that configurations are matter of personal taste though.

Currently I have configurations for:

- Bash
- Emacs (own profile and newbie profile)
- Vim

Emacs configurations are a bit more serious, so inside
[emacs](./emacs) directory I have another [README](./emacs/README.md)
explaining some more details about it.


## Installation

I use `GNU stow` for my personal configurations. To install it, use
the Makefile as:

```
make install-all
```

If you want more details, use
```
make help
```
or read the Makefile.

Installation of newbie Emacs configuration only requires:
```
make install-emacs-newbie
```


## Synchronization

When there's an update in this repository, you may need to do a
sync. There are `sync-` targets for all.


## Uninstall

To uninstall, use the `uninstall-` targets.
