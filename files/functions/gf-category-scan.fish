# Managed by Ansible, please don't edit manually
function gf-category-scan --description="Scans directories or files with gf category patterns."
    # Description: Call process-patterns for every file or directly if a single file is provided.
    # Usage: gf-category-search <file or directory> <secrets|vulns> [-v|-vv]

    # Check for minimum number of arguments
    if test (count $argv) -lt 2
        echo "Usage: gf-category-search <file or directory> <secrets|vulns> [-v|-vv]"
        return 1
    end

    # Extract and verify category
    set category $argv[2]
    if not contains $category secrets vulns
        echo "Invalid category: $category. Use 'secrets' or 'vulns'."
        return 1
    end

    # Check for verbose flags
    set verbose_level 0
    if set -q argv[3]
        switch $argv[3]
            case -v
                set verbose_level 1
            case -vv
                set verbose_level 2
        end
    end

    # Determine if the argument is a file or directory
    set target $argv[1]
    if test -d $target
        # It's a directory, apply gf-categories to each file in it
        for file in $target/*
            if test -f $file
                # Print the current file if verbose is on
                if test $verbose_level -ge 1
                    echo "Processing file: $file"
                end
                # Call gf-categories with verbose if double verbose is on
                if test $verbose_level -eq 2
                    cat $file | gf-categories $category -v
                else
                    cat $file | gf-categories $category
                end
            end
        end
    else if test -f $target
        # It's a file, directly apply gf-categories
        if test $verbose_level -ge 1
            echo "Processing file: $target"
        end
        if test $verbose_level -eq 2
            cat $target | gf-categories $category -v
        else
            cat $target | gf-categories $category
        end
    else
        echo "The specified path is not valid: $target"
        return 1
    end
end
