# Managed by Ansible, please don't edit manually
function gc --description="fzf git checkout."
    git checkout (git branch -a --sort=-committerdate |
fzf --preview 'git log (echo {} | sed -E -e \'s/^(\+|\*)//\' | string trim) -- ' |
sed -E -e 's/^(\+|\*)//' |
xargs basename |
string trim)
end
