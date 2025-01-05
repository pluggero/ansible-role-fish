# Managed by Ansible, please don't edit manually
function gf-categories --description="Search for pattern categories with gf."
    # Description: Process files matching either '_secrets' or '_vulns' pattern using gf command
    # Usage: gf-categories secrets|vulns [-v]

    if not set -q argv[1]
        echo "Usage: gf-categories secrets|vulns [-v]"
        return 1
    end

    set pattern_type $argv[1]
    set verbose 0

    if set -q argv[2]
        switch $argv[2]
            case -v --verbose
                set verbose 1
        end
    end

    switch $pattern_type
        case secrets
            set pattern "*_secrets*"
        case vulns
            set pattern "*_vulns*"
        case '*'
            echo "Invalid argument: $pattern_type. Use 'secrets' or 'vulns'."
            return 1
    end

    for item in (gf -list)
        if string match -q $pattern $item
            if test $verbose -eq 1
                echo "Processing item: $item"
            end
            gf $item
        end
    end
end
