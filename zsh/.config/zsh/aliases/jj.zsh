# https://gist.github.com/tdaron/f5d0985687d8aed06714c8901dfb5fcb
_jj_change_id() {
    local change_id=$(jj log --no-graph -T 'change_id.shortest() ++ "\t" ++ description.first_line() ++ " "  ++ branches.join("  ") ++ "\n"' --color always | fzf --ansi | cut -f1)
}
_jj_change_id_widget() _jj_change_id
zle -N _jj_change_id_widget
bindkey '\C-j' _jj_change_id_widget
