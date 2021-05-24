bindkey '\C-o' accept-line-and-down-history
bindkey '^?' backward-delete-char
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^h' backward-delete-char
bindkey '^n' history-search-forward
bindkey '^p' history-search-backward
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward
bindkey '^w' backward-kill-word
bindkey -M menuselect '\C-o' accept-and-menu-complete
bindkey -M menuselect '\e' accept-line
bindkey -M menuselect '^M' .accept-line
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'q' send-break
bindkey -M vicmd '\C-o' accept-line-and-down-history
bindkey -M vicmd '^e' edit-command-line
bindkey -M vicmd '^r' history-incremental-search-backward
