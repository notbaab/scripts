function fram_create
    echo creating
end

function fram_cmake
    cmake $DRAM_CMAKE_FLAGS $argv[2..-1]
end

function fram_use
    if not test -d $DRAM_ROOT/$argv[1]
        echo "fram $DRAM_ROOT/$argv[1] doesn't exits"
        return
    end

    set -gx dram_path $DRAM_ROOT/$argv[1]
    set -gx PATH $PATH $dram_path/bin
    set -gx DRAM_CMAKE_FLAGS -DCMAKE_PREFIX_PATH=$dram_path -DCMAKE_INSTALL_PREFIX=$dram_path
    set -gx DRAM_CONFIGURE_FLAGS "--prefix=$dram_path"
    source $dram_path/pyenv/bin/activate.fish
    set -gx LD_LIBRARY_PATH $dram_path/lib:$dram_path/pyenv/lib
    cd $dram_path/source
end

function fram
    switch $argv[1];
    case use;
        if fram_use $argv[2]
            title fram $argv[2]
        end
    case create;
        fram_create
    case cmake;
        fram_cmake $argv
    end
end

complete -c fram -n "__fish_use_subcommand" -x -a "use"
complete -c fram -n "__fish_seen_subcommand_from use" -x -a "(ls $DRAM_ROOT)"
