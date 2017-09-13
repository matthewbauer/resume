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
    nix-build ${README}/build.nix --arg nixpkgs "import ${nixpkgs} {}"
  '';

  installPhase = ''
    cp result $out
  '';

}
