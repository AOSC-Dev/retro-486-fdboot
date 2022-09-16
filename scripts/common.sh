set -ex
export OLDPWD="$PWD"
export PATH="$PATH:$PWD/toolchain/bin"

function c()
{
	git clone --depth 1 "$1"
}

