# Managed by Ansible, please don't edit manually
function cat_tree_files --description="Displays each file name followed by its content."
    function process_file_or_dir
        # Input argument: the file or directory to process
        set item $argv[1]

        # If the item is a file, print its name and content
        if test -f $item
            echo ""
            echo "--- $item ---:"
            cat $item
            # If the item is a directory, process its contents recursively
        else if test -d $item
            for subitem in $item/*
                if test -e $subitem
                    process_file_or_dir $subitem
                end
            end
        end
    end

    # Read piped input line by line
    while read file
        # Start processing each file or directory
        process_file_or_dir $file
    end
end
