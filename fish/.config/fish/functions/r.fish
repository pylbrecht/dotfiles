# https://www.revsys.com/tidbits/shell-alias-to-git-repo-root/
# requires git-extras
function r
    set -l root (jj root)
    if test $status -ne 0
        set -l root (git root)
    end

    cd $root
end
