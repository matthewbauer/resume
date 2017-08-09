{nixpkgs ? import <nixpkgs> {}}:

with nixpkgs;

stdenv.mkDerivation {
  name = "resume";
  src = ./.;
  buildInputs = [
    (texlive.combine {
      inherit (texlive) scheme-full xetex setspace fontspec
                        chktex enumitem xifthen ifmtarg filehook;
    })
  ];
  buildPhase = ''
    xelatex -file-line-error -interaction=nonstopmode "\input" resume.tex
  '';
  installPhase = ''
    cp resume.pdf $out
  '';
}
