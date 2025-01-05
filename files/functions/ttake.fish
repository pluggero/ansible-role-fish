# Managed by Ansible, please don't edit manually
function ttake --description="Creates a temporary directory and switches into it."
    cd $(mktemp -d)
end
