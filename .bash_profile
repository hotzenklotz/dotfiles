# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"
export ANDROID_HOME=/usr/local/Cellar/android-sdk/23.0.2

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

# z Script
# https://github.com/rupa/z
. $HOME/z.sh

# sbt
export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:PermSize=256M -XX:MaxPermSize=512M"

#increase open file limit / process limit
ulimit -n 10000
ulimit -u 1024

export RSTUDIO_WHICH_R="/usr/local/bin/r"
export PATH=/usr/local/opt/depot_tools:"$PATH"

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# homebrew auto complete
source $(brew --repository)/Library/Contributions/brew_bash_completion.sh

# CUDA / Caffe
export DYLD_FALLBACK_LIBRARY_PATH=/usr/local/lib:/usr/lib:/Developer/NVIDIA/CUDA-7.0/lib:$DYLD_FALLBACK_LIBRARY_PATH
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:/usr/local/opt/caffe/python:$PYTHONPATH

eval "$(thefuck --alias fuck)"

