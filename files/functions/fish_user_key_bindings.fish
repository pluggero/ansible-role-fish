# Managed by Ansible, please don't edit manually
function clear_and_repaint
    # Clear the terminal
    clear
    # Redraw the prompt
    commandline -f repaint
end

function fkill
    # List processes, pipe to fzf, extract PID, and kill the selected process
    set pid (ps aux | fzf | awk '{print $2}')
    if test -n "$pid"
        kill -9 $pid
    end
end

function fish_user_key_bindings
    bind \co 'clear_and_repaint'
end
