set -x
set -o xtrace

if [[ $target_platform  == osx-64 ]]; then
  export NN_CXX_ORIG=$CXX
  export NN_CC_ORIG=$CC
  export CXX=$RECIPE_DIR/cxx_wrap.sh
  export CC=$RECIPE_DIR/cc_wrap.sh
  mkdir -p ~/.R
  echo CC=$RECIPE_DIR/cc_wrap.sh > ~/.R/Makevars
  echo CXX=$RECIPE_DIR/cxx_wrap.sh >> ~/.R/Makevars
  echo CXX17=$RECIPE_DIR/cxx_wrap.sh >> ~/.R/Makevars
fi

$R CMD INSTALL --configure-args=--with-tiledb=${CONDA_PREFIX} --install-tests --build . ${R_ARGS}
