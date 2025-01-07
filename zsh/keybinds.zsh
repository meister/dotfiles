# Home / End keys on Mac
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Word navigation (Alt + Right/Left)
bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word

# Accept autosuggestion
bindkey '^ ' autosuggest-accept
