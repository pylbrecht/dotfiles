_Z_DATA_DIR="$HOME/.cache/zsh/plugins/z"

if [ ! -d $_Z_DATA_DIR ] ; then
    mkdir -p `dirname $_Z_DATA`
    touch $_Z_DATA
fi

_Z_DATA="${_Z_DATA_DIR}/z_data"
if [ ! -f $_Z_DATA ] ; then
    touch $_Z_DATA
fi

source "${0:h}/z/z.sh"
