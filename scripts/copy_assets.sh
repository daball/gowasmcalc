#!/bin/sh
JQUERY_VERSION=3.4.1
BOOTSTRAP_VERSION=4.4.1
# and, GO...
echo "Make directory ./dist"
mkdir "./dist"
#The old-school way:
#echo "Copy recursive ./assets/**/* to ./dist"
#cp -R "./assets/*" "./dist/"
if [[ -d "assets" ]]
then
  echo "Make directory structure like ./assets/**/* to ./dist"
  for ASSETDIR in $(find -L ./assets -type d)
  do
    DISTDIR=$(echo $ASSETDIR | awk 'sub(/.\/assets\//, "./dist/")')
    echo "Make subdirectory like $ASSETDIR at $DISTDIR"
    mkdir "${DISTDIR}"
  done
  echo "Make hard link recusively ./assets/**/* to ./dist"
  for ASSET in $(find -L ./assets -type f)
  do
    DIST=$(echo $ASSET | awk 'sub(/.\/assets\//, "./dist/")')
    echo "Link $ASSET to $DIST"
    ln "${ASSET}" "${DIST}"
  done
fi
if [[ ! -d "./dist/js" ]]
then
  echo "Make subdirectory ./dist/js"
  mkdir ./dist/js
fi
#The old-school way:
#echo "Copy $(go env GOROOT)/misc/wasm/wasm_exec.js to ./dist/js/wasm_exec.js"
#cp "$(go env GOROOT)/misc/wasm/wasm_exec.js" ./dist/js
echo "Link $(go env GOROOT)/misc/wasm/wasm_exec.js to ./dist/js/wasm_exec.js"
ln "$(go env GOROOT)/misc/wasm/wasm_exec.js" "./dist/js/wasm_exec.js"
if [[ ! -d ".cache" ]]
then
  echo "Make directory ./.cache"
  mkdir ./.cache
fi
if [[ ! -f ".cache/jquery-${JQUERY_VERSION}.min.js" ]]
then
  echo "Download https://code.jquery.com/jquery-${JQUERY_VERSION}.min.js to ./.cache/jquery-${JQUERY_VERSION}.min.js"
  curl -o "./.cache/jquery-3.4.1.min.js" "https://code.jquery.com/jquery-${JQUERY_VERSION}.min.js"
fi
#The old-school way:
#echo "Copy .cache/jquery-${JQUERY_VERSION}.min.js to ./.cache/jquery.min.js"
#cp "./.cache/jquery-${JQUERY_VERSION}.min.js" "./dist/js/jquery.min.js"
echo "Link .cache/jquery-${JQUERY_VERSION}.min.js to ./.cache/jquery.min.js"
ln "./.cache/jquery-${JQUERY_VERSION}.min.js" "./dist/js/jquery.min.js"
if [[ ! -f ".cache/bootstrap-${BOOTSTRAP_VERSION}.min.css" ]]
then
  echo "Download https://stackpath.bootstrapcdn.com/bootstrap/${BOOTSTRAP_VERSION}/css/bootstrap.min.css to ./.cache/boostrap-${JQUERY_VERSION}.min.css"
  curl -o "./.cache/bootstrap-${BOOTSTRAP_VERSION}.min.css" "https://stackpath.bootstrapcdn.com/bootstrap/${BOOTSTRAP_VERSION}/css/bootstrap.min.css"
fi
#The old-school way:
#echo "Copy .cache/bootstrap-${BOOTSTRAP_VERSION}.min.css to ./.cache/boostrap.min.css"
#cp "./.cache/bootstrap-${BOOTSTRAP_VERSION}.min.css" "./dist/css/bootstrap.min.css"
echo "Link .cache/bootstrap-${BOOTSTRAP_VERSION}.min.css to ./.cache/boostrap.min.css"
ln "./.cache/bootstrap-${BOOTSTRAP_VERSION}.min.css" "./dist/css/bootstrap.min.css"
if [[ ! -d "./dist/wasm" ]]
then
  echo "Make subdirectory ./dist/wasm"
  mkdir ./dist/wasm
fi
#The old-school way:
#echo "Copy build/lib.wasm to ./dist/wasm/lib.wasm"
#cp "./build/lib.wasm" "./dist/wasm/lib.wasm"
echo "Link build/lib.wasm to ./dist/wasm/lib.wasm"
ln "./build/lib.wasm" "./dist/wasm/lib.wasm"
