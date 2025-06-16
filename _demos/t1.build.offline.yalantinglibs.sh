cd thirdparties

# Build and install yalantinglibs
cd yalantinglibs
check_success "Failed to change to yalantinglibs directory"

mkdir -p build
check_success "Failed to create build directory"

cd build
check_success "Failed to change to build directory"

echo "Configuring yalantinglibs..."
cmake .. -DBUILD_EXAMPLES=OFF -DBUILD_BENCHMARK=OFF -DBUILD_UNIT_TESTS=OFF
check_success "Failed to configure yalantinglibs"

echo "Building yalantinglibs (using $(nproc) cores)..."
cmake --build . -j$(nproc)
check_success "Failed to build yalantinglibs"

echo "Installing yalantinglibs..."
cmake --install .
