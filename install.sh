DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# Headers
mkdir -p /usr/local/lib
ln -sf ${DIR}/libRootAna.a /usr/local/lib/libRootAna.a

mkdir -p /usr/local/include/RootAna
cp *.h /usr/local/include/RootAna/