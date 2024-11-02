if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_config theme choose "Rosé Pine Moon"

function fish_prompt
    set_color blue
    echo
    echo (prompt_pwd)
    set_color normal
    echo '% '
end
set fish_prompt_pwd_dir_length 0
