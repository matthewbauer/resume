#!/usr/bin/env sh

result=$(nix-build)
dir=$(mktemp -d)

setup() {
  git clone ssh://git@github.com/matthewbauer/matthewbauer.github.io.git $dir
  pushd $dir
}

cleanup() {
  popd
  rm -rf $dir
}

setup
trap cleanup EXIT

cp -f $result resume.pdf
git add resume.pdf
git commit -m "Update resume"
git push
