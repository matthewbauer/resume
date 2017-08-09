{nixpkgs ? import <nixpkgs> {}}:

with nixpkgs;

stdenv.mkDerivation {
  name = "resume";
  src = ./.;
  buildInputs = [
    (texlive.combine {
      inherit (texlive) scheme-basic xetex xetex-def setspace fontspec
                        chktex enumitem xifthen ifmtarg filehook
                        upquote tools ms geometry graphics oberdiek
                        fancyhdr lastpage xcolor etoolbox unicode-math
                        ucharcat sourcesanspro tcolorbox pgf environ
                        trimspaces parskip hyperref url euenc
                        collection-fontsrecommended;
    })
  ];
  buildPhase = ''
    xelatex -file-line-error -interaction=nonstopmode "\input" resume.tex
  '';
  installPhase = ''
    cp resume.pdf $out
  '';
}
