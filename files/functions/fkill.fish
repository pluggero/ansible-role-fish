# Managed by Ansible, please don't edit manually
function fkill
    # List processes, pipe to fzf, extract PID, and kill the selected process
    set pid (ps aux | fzf | awk '{print $2}')
    if test -n "$pid"
        kill -9 $pid
    end
end
