###############################################################################

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PWD/build/mooncake-common/etcd
PYTHON_VERSION="3.10" OUTPUT_DIR=dist bash ./scripts/build_wheel.sh

###############################################################################

# pip uninstall mooncake-transfer-engine
# pip install mooncake-transfer-engine

###############################################################################
