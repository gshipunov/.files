# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export EDITOR=nvim

if [ -e /home/0xa/.nix-profile/etc/profile.d/nix.sh ]; then . /home/0xa/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
