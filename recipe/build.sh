set -x
set -o xtrace

if [[ $target_platform  == osx-64 ]]; then
  darwin_flag="CFLAGS=-mmacosx-version-min=10.14 CXXFLAGS=-mmacosx-version-min=10.14"
fi

$R CMD INSTALL --configure-args="--with-tiledb=${CONDA_PREFIX} ${darwin_flag}" --install-tests --build . ${R_ARGS}
