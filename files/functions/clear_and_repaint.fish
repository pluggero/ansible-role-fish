# Managed by Ansible, please don't edit manually
# This function is a workaround for the clear-screen issue on remote hosts.
function clear_and_repaint
    # Clear the terminal
    clear
    # Redraw the prompt
    commandline -f repaint
end
