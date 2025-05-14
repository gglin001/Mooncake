apt install -y libhiredis-dev

###############################################################################

# mkdir -p thirdparties
# git clone git@github.com:alibaba/yalantinglibs.git thirdparties/yalantinglibs

# git clone git@github.com:pybind/pybind11.git
# cd pybind11
# git switch stable
# rm -rf extern/pybind11
# cp -r pybind11 extern/pybind11

# apt update -y
bash -x dependencies.sh -y

mkdir build
cd build

cmake .. -DUSE_HTTP=ON -DUSE_REDIS=ON

make install -j

###############################################################################

mkdir -p dist

PYTHON_VERSION="3.10" OUTPUT_DIR=dist bash ./scripts/build_wheel.sh
