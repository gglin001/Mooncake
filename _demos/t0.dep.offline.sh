###############################################################################

pushd _demos
git clone git@github.com:alibaba/yalantinglibs.git deps/yalantinglibs --depth 1
git clone git@github.com:pybind/pybind11.git deps/pybind11 --branch stable --depth 1
tar czf deps.tgz deps/
popd

pushd _demos
tar xf deps.tgz
popd
# rm extern/pybind11
mkdir -p extern
mkdir -p thirdparties
cp -r _demos/deps/pybind11 extern/
cp -r _demos/deps/yalantinglibs thirdparties/

bash -x dependencies.sh -y

###############################################################################

pushd _demos
curl -LO https://go.dev/dl/go1.23.8.linux-amd64.tar.gz
popd

pushd _demos
tar -C /usr/local -xzf go1.23.8.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >>~/.bashrc
popd

###############################################################################
