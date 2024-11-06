# https://www.revsys.com/tidbits/shell-alias-to-git-repo-root/
# requires git-extras
function rd -a pattern
    set -l root (jj root)
    if test $status -ne 0
        set -l root (git root)
    end

    fd "$pattern" $root
end
