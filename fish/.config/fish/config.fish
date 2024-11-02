if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_config theme choose "Rosé Pine Moon"

fish_vi_key_bindings
fish_vi_cursor
set -g fish_vi_force_cursor 1
# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursors to an underscore
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
# Set the external cursor to a line. The external cursor appears when a command is started.
# The cursor shape takes the value of fish_cursor_default when fish_cursor_external is not specified.
set fish_cursor_external line
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block

function fish_prompt
    set_color blue
    echo
    echo (prompt_pwd)
    set_color normal
    echo '% '
end
set fish_prompt_pwd_dir_length 0

bind \cg --mode insert 'command tmux-session'
bind \cg --mode default 'command tmux-session'
