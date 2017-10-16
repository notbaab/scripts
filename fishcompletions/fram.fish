complete -c fram -n "__fish_use_subcommand" -x -a "use"
# This is wrong, try to use fish_complete_directories
complete -c fram -n "__fish_seen_subcommand_from use" -x -a "(ls $DRAM_ROOT)"

