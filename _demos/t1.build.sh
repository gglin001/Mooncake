###############################################################################

args=(
  -DCMAKE_BUILD_TYPE="Release"
  # -DCMAKE_BUILD_TYPE="Debug"
  #
  -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  -DCMAKE_INSTALL_PREFIX="build/install"
  #
  -DUSE_HTTP=ON
  -DUSE_REDIS=OFF
  #
  -DUSE_CUDA=OFF
  # -DUSE_NVMEOF=ON
  #
  -DUSE_ETCD=OFF
  -DWITH_STORE=OFF
  #
  -S.
  -Bbuild
  -GNinja
)
cmake "${args[@]}"

cmake --build build -t all
# cmake --build build -t install

###############################################################################

rm ./transfer_engine_bench
ln -s build/mooncake-transfer-engine/example/transfer_engine_bench ./transfer_engine_bench

###############################################################################
