# Managed by Ansible, please don't edit manually
function take --description="Creates the specified directory and switches into it."
    mkdir -p -- "$argv" && cd -- "$argv"
end
