function f
    set -l pattern $argv[1]
    set -l dirs $argv[2..-1]
    if test (count $dirs) -eq 0
        set dirs .
    end
    ag --nocolor -l -g $pattern $dirs
end
