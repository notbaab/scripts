
function copy_to_clipboard
    echo $argv | pbcopy
end

function confirm_prompt
    echo "Select which one? "
end

function locate_copy
    echo $argv
    set value (locate $argv)
    set idx 1

    for val in $value
        echo $idx $val
        set idx (math $idx+1)
    end

    read -l -p confirm_prompt idx

    copy_to_clipboard $value[$idx]
end
