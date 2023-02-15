if [[ -z "$FRANCIUM_ARCH" || -z "$FRANCIUM_SYSROOT" ]]; then
  echo "Please source an architecture env file !"
  exit
fi
cd mlibc
rm -r buildresults
meson buildresults -Ddefault_library=static -Ddisable_linux_option=true -Dheaders_only=true --cross-file ../cross-francium-${FRANCIUM_ARCH}.txt --prefix ${FRANCIUM_SYSROOT}
ninja -C buildresults install
