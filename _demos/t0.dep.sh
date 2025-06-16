###############################################################################

apt install -y libhiredis-dev

###############################################################################

mkdir -p thirdparties
git clone git@github.com:alibaba/yalantinglibs.git thirdparties/yalantinglibs

rm -rf extern/pybind11
git clone git@github.com:pybind/pybind11.git extern/pybind11
pushd extern/pybind11 && git switch stable && popd

# apt update -y
bash -x dependencies.sh -y

curl -LO https://go.dev/dl/go1.23.8.linux-amd64.tar.gz

###############################################################################

# mkdir build
# cd build
# cmake .. -DUSE_HTTP=ON -DUSE_REDIS=ON
# make install -j

###############################################################################

PYTHON_VERSION="3.10" OUTPUT_DIR=dist bash ./scripts/build_wheel.sh

###############################################################################
