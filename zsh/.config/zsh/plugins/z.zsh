_Z_DATA="$HOME/.cache/zsh/plugins/z/z_data"
if [ ! -f $_Z_DATA ] ; then
    touch $_Z_DATA
fi
source "${0:h}/z/z.sh"
