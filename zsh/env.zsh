export EDITOR=vim

# Locale settings
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Highlighted |less
if [ ! -z "`which pygmentize`" ]; then
  export LESS='-R'
  export LESSOPEN='|pygmentize -g %s'
fi

# Fall back zsh function for coloured output
pretty() { pygmentize -f terminal "$1" | less -R }