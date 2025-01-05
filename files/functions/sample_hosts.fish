# Managed by Ansible, please don't edit manually
function sample_hosts

    set -l words $argv
    set -l count (count $words)
    set -l index (shuf -n 1 -i 1-$count)
    set -l chosen_word $words[$index]
    set -l words_str (string join ', ' $words)
    echo "| $chosen_word | $words_str |"

end
