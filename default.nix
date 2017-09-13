{nixpkgs ? import <nixpkgs> {}}: with nixpkgs;
let

README = stdenv.mkDerivation {
  name = "README";
  unpackPhase = "true";
  buildInputs = [ emacs ];
  installPhase = ''
    mkdir -p $out
    cd $out
    cp -r ${./fonts} fonts
    cp ${./README.org} README.org
    emacs --batch -l ob-tangle --eval "(org-babel-tangle-file \"README.org\")"
  '';
};

in stdenv.mkDerivation {

  name = "ifd";
  unpackPhase = "true";

  buildInputs = [ nixStable ];

  buildPhase = ''
    export NIX_REMOTE=${builtins.getEnv "NIX_REMOTE"}
    export NIX_PATH=${builtins.getEnv "NIX_PATH"}

    nix-build ${README}/build.nix
  '';

  installPhase = ''
    cp result $out
  '';

}
