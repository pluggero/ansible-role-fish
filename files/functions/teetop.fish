# Managed by Ansible, please don't edit manually
function teetop --description="Adds content on a top of a file."
    # Check if the correct number of arguments is provided
    if test (count $argv) -ne 1
        echo "Usage: prepend_to_file filename"
        return 1
    end

    # Assign argument to variable for clarity
    set filename $argv[1]

    # Check if the file is owned by root
    set file_owner (stat -c '%U' $filename)
    set file_permissions (stat -c '%a' $filename)
    set needs_sudo (test $file_owner = "root"; and echo "true"; or echo "false")


    if test $needs_sudo = true
        # Create unique temporary files
        set temp_file1 (sudo mktemp)
        set temp_file2 (sudo mktemp)

        # Read from stdin and write to the temporary file using sudo
        cat - | sudo tee $temp_file1

        # Concatenate the temporary file with the original file using sudo and overwrite the original file
        sudo sh -c "cat $temp_file1 $filename > $temp_file2 && mv $temp_file2 $filename && sudo chmod $file_permissions $filename && rm $temp_file1"
    else
        # Create unique temporary files
        set temp_file1 (mktemp)
        set temp_file2 (mktemp)

        # Read from stdin and write to the temporary file
        cat - >$temp_file1

        # Concatenate the temporary file with the original file and overwrite the original file
        sh -c "cat $temp_file1 $filename > $temp_file2 && mv $temp_file2 $filename && chmod $file_permissions $filename && rm $temp_file1"
    end
end
