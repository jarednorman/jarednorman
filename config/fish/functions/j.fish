function j
    if test (count $argv) -gt 0
        jj $argv
    else
        clear; jj st; echo \n―――――\n; jj
    end
end
