# Add `~/bin` to the `$PATH`
PROMPT_COMMAND='update_terminal_cwd; echo -ne "\033]0; ${PWD##*/}\007"'
export PATH="$HOME/bin:$PATH"
export fourxe=http://dev.zenoss.com/svnint/branches/zenoss-4.x
export fourx=http://dev.zenoss.com/svnint/branches/core/zenoss-4.x
export sandbox=http://dev.zenoss.com/svnint/sandboxen/core/akasim
export sandboxe=http://dev.zenoss.com/svnint/sandboxen/akasim
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
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

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# Autocomplete Grunt commands
which grunt &> /dev/null && eval "$(grunt --completion=bash)"

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

# Virtualenvwrapper
#source $(which virtualenvwrapper.sh)
. ~/.powerline/powerline/bindings/bash/powerline.sh
#. ~/Library/Python/2.7/lib/python/site-packages/powerline//bindings/bash/powerline.sh
# Add Homebrew to PATH
export PATH="/usr/local/bin:$PATH"
export M3_HOME="/Library/Maven/apache-maven-3.1.1"
export ZENHOME=~/dev/zenoss

if [ -n "$(which brew 2>/dev/null)" ]; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
fi
# Powerline
#. /Users/arif_zenoss//Library/Python/2.7/lib/python/site-packages/powerline -name powerline.sh
#export TMUX_POWERLINE_CONF=$(find $(python -c "import site; print site.getsitepackages()[0]")/powerline/bindings/tmux -name powerline.conf)
