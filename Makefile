# Installation path. Override on command line if a different location
# is wanted
home := $(HOME)

help:
	@echo -e 'Usage:'
	@echo -e ' help                   \t Show this help message'
	@echo -e ' show-install-path      \t Show installation path. Customizizable via "home" variable'
	@echo
	@echo -e ' All:'
	@echo -e '  install-all           \t Install all my configurations (bash, emacs, vim)'
	@echo -e '  sync-all              \t Sync all config files with this repository'
	@echo -e '  uninstall-all         \t Uninstall a previous "install"'
	@echo
	@echo -e ' Bash:'
	@echo -e '  install-bash          \t Install bash configuration'
	@echo -e '  sync-bash             \t Sync bash config files with this repository'
	@echo -e '  uninstall-bash        \t Uninstall a previous "install"'
	@echo
	@echo -e ' Emacs (personal profile):'
	@echo -e '  install-emacs         \t Install personal emacs profile (using GNU Stow)'
	@echo -e '  sync-emacs            \t Sync personal emacs config (using GNU Stow)'
	@echo -e '  uninstall-emacs       \t Uninstall a previous "install" (using GNU Stow)'
	@echo
	@echo -e ' Emacs (newbie profile):'
	@echo -e '  install-newbie-emacs  \t Install newbie emacs profile configuration'
	@echo -e '  sync-newbie-emacs     \t Sync newbie emacs config files with this repository'
	@echo -e '  uninstall-newbie-emacs\t Uninstall a previous "install"'
	@echo
	@echo -e ' Vim:'
	@echo -e '  install-vim           \t Install vim configuration'
	@echo -e '  sync-vim              \t Sync vim config files with this repository'
	@echo -e '  uninstall-vim         \t Uninstall a previous "install"'

show-install-path:
	@echo "Install path:" $(home)


# All

install-all: install-bash install-emacs install-vim

sync-all: sync-bash sync-emacs sync-vim

uninstall-all: uninstall-bash uninstall-emacs uninstall-vim


# Emacs personal profile

install-emacs:
	@stow --dir=./emacs --target=$(home) -S profile

sync-emacs: install-emacs-full

uninstall-emacs:
	@stow --dir=./emacs --target=$(home) -D profile


# Emacs for newbies

NEWBIE_INIT_FILE_SRC := emacs/newbie/init.el
NEWBIE_INIT_FILE_DEST := $(home)/.emacs

install-newbie-emacs:
	@cp -i $(NEWBIE_INIT_FILE_SRC) $(NEWBIE_INIT_FILE_DEST)

sync-newbie-emacs:
	@cp $(NEWBIE_INIT_FILE_SRC) $(NEWBIE_INIT_FILE_DEST)
	@echo "File $(NEWBIE_INIT_FILE_DEST) is now up to date"

uninstall-newbie-emacs:
	@rm -rf $(NEWBIE_INIT_FILE_DEST)
	@echo "File $(NEWBIE_INIT_FILE_DEST) successfully removed"


# Bash


install-bash:
	@stow --target=$(home) -S bash

sync-bash: install-bash

uninstall-bash:
	@stow --target=$(home) -D bash


# Vim


install-vim:
	@stow --target=$(home) -S vim

sync-vim: install-vim

uninstall-vim:
	@stow --target=$(home) -D vim
