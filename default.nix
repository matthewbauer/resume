{nixpkgs ? <nixpkgs>}: with import nixpkgs {};
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
    cp resume.nix default.nix
  '';
};

in import README {inherit nixpkgs;}
