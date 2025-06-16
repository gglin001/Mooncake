###############################################################################

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PWD/build/mooncake-common/etcd
bash ./scripts/build_wheel.sh "3.10" dist

###############################################################################

# pip uninstall mooncake-transfer-engine
# pip install mooncake-transfer-engine

###############################################################################
