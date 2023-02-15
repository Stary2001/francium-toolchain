if [[ -z "$FRANCIUM_ARCH" || -z "$FRANCIUM_SYSROOT" ]]; then
  echo "Please source an architecture env file!"
  exit
fi
 
mkdir -p build-dirs/build-binutils-${FRANCIUM_ARCH}; cd build-dirs/build-binutils-${FRANCIUM_ARCH}
../../binutils-gdb/configure --target=${FRANCIUM_ARCH}-unknown-francium --prefix=${FRANCIUM_SYSROOT} -with-sysroot=${FRANCIUM_SYSROOT}
make -j16
make install
