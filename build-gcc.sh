if [[ -z "$FRANCIUM_ARCH" || -z "$FRANCIUM_SYSROOT" ]]; then
  echo "Please source an architecture env file!"
  exit
fi

mkdir -p build-dirs/build-gcc-${FRANCIUM_ARCH}; cd build-dirs/build-gcc-${FRANCIUM_ARCH}
../../gcc/configure --target=${FRANCIUM_ARCH}-unknown-francium --prefix="${FRANCIUM_SYSROOT}" --with-sysroot="${FRANCIUM_SYSROOT}" --enable-languages=c,c++
make -j16 all-gcc all-target-libgcc
make install-gcc install-target-libgcc
