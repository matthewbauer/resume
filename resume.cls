\ProvidesClass{resume}[2017/08/01 Resume Class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage{upquote}
\RequirePackage{setspace}
\RequirePackage{array}
\RequirePackage{enumitem}
\RequirePackage{ragged2e}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{xcolor}
\RequirePackage{ifxetex}
\RequirePackage{xifthen}
\RequirePackage{etoolbox}
\RequirePackage{setspace}
\RequirePackage[quiet]{fontspec}
\RequirePackage{unicode-math}
\RequirePackage[skins]{tcolorbox}
\RequirePackage{parskip}
\RequirePackage[hidelinks,unicode]{hyperref}

\geometry{left=4.0cm, top=2.0cm, right=4.0cm, bottom=2.0cm, footskip=.5cm}

\hypersetup{
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={}
}

\fancyhfoffset{0em}
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\pagestyle{fancy}

\defaultfontfeatures{Ligatures=TeX}

\newfontfamily\headerfontspaced{FiraSans}[
  Path            =   fonts/,
  UprightFont     =   *-Regular,
  BoldFont        =   *-Bold,
  ItalicFont      =   *-Italic,
  BoldItalicFont  =   *-BoldItalic,
  LetterSpace     =   15
]

\newfontfamily\headerfont{FiraSans}[
  Path            =   fonts/,
  UprightFont     =   *-Regular,
  BoldFont        =   *-Bold,
  ItalicFont      =   *-Italic,
  BoldItalicFont  =   *-BoldItalic
]

\newfontfamily\footerfont{FiraSans}[
  Path            =   fonts/,
  UprightFont     =   *-Regular,
  BoldFont        =   *-Bold,
  ItalicFont      =   *-Italic,
  BoldItalicFont  =   *-BoldItalic
]

\newfontfamily\bodyfont{Charter}[
  Path            =   fonts/,
  UprightFont     =   * Regular,
  BoldFont        =   * Bold,
  ItalicFont      =   * Italic,
  BoldItalicFont  =   * Bold Italic
]

\newcommand*{\headerfirstnamestyle}[1]{
  {\fontsize{24pt}{1em}\headerfontspaced\MakeUppercase{#1} }
}
\newcommand*{\headerlastnamestyle}[1]{
  {\fontsize{24pt}{1em}\headerfontspaced\MakeUppercase{#1} }
}

\newcommand*{\headerpositionstyle}[1]{
  {\fontsize{7.6pt}{1em}\bodyfont\scshape #1}
}
\newcommand*{\headeraddressstyle}[1]{
  {\fontsize{10pt}{1em}\headerfontspaced #1}
}
\newcommand*{\headersocialstyle}[1]{
  {\fontsize{8pt}{1em}\headerfont #1}
}
\newcommand*{\headerquotestyle}[1]{
  {\fontsize{9pt}{1em}\bodyfont\itshape #1}
}
\newcommand*{\footerstyle}[1]{
  {\fontsize{8pt}{1em}\footerfont\scshape #1}
}
\newcommand*{\sectionstyle}[1]{
  {\fontsize{8pt}{1em}\headerfont\bfseries\MakeUppercase{#1}}
}
\newcommand*{\subsectionstyle}[1]{
  {\fontsize{8pt}{1em}\headerfont\scshape}
}
\newcommand*{\paragraphstyle}{
  \fontsize{9pt}{1em}\bodyfont\upshape
}

\newcommand*{\entrytitlestyle}[1]{
  {\fontsize{11pt}{1em}\headerfont\bfseries #1}
}
\newcommand*{\entrypositionstyle}[1]{
  {\fontsize{8pt}{1em}\bodyfont\itshape #1}}
\newcommand*{\entrydatestyle}[1]{
  {\fontsize{8pt}{1em}\bodyfont\slshape #1}
}
\newcommand*{\entrylocationstyle}[1]{
  {\fontsize{9pt}{1em}\bodyfont\slshape #1}
}
\newcommand*{\descriptionstyle}[1]{
  {\fontsize{9pt}{1em}\bodyfont\upshape #1}
}

\newcommand*{\subentrytitlestyle}[1]{
  {\fontsize{8pt}{1em}\bodyfont\mdseries #1}
}
\newcommand*{\subentrypositionstyle}[1]{
  {\fontsize{7pt}{1em}\bodyfont\scshape #1}
}
\newcommand*{\subentrydatestyle}[1]{
  {\fontsize{7pt}{1em}\bodyfont\slshape #1}
}
\newcommand*{\subentrylocationstyle}[1]{
  {\fontsize{7pt}{1em}\bodyfont\slshape #1}
}
\newcommand*{\subdescriptionstyle}[1]{
  {\fontsize{8pt}{1em}\bodyfont\upshape #1}
}

\newcommand*{\honortitlestyle}[1]{
  {\fontsize{9pt}{1em}\bodyfont #1}
}
\newcommand*{\honorpositionstyle}[1]{
  {\fontsize{9pt}{1em}\bodyfont\bfseries #1}
}
\newcommand*{\honordatestyle}[1]{
  {\fontsize{9pt}{1em}\bodyfont #1}
}
\newcommand*{\honorlocationstyle}[1]{
  {\fontsize{9pt}{1em}\bodyfont\slshape #1}
}

\newcommand*{\skilltypestyle}[1]{
  {\fontsize{10pt}{1em}\bodyfont\bfseries #1}
}
\newcommand*{\skillsetstyle}[1]{
  {\fontsize{9pt}{1em}\bodyfont #1}
}

\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}

\newcommand*{\address}[1]{\def\@address{#1}}
\newcommand*{\position}[1]{\def\@position{#1}}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}
\renewcommand*{\quote}[1]{\def\@quote{#1}}

\newcommand{\acvHeaderNameDelim}{\space}
\newcommand{\acvHeaderAfterNameSkip}{.4mm}
\newcommand{\acvHeaderAfterPositionSkip}{.4mm}
\newcommand{\acvHeaderAfterAddressSkip}{-.5mm}
\newcommand{\acvHeaderIconSep}{\space}
\newcommand{\acvHeaderSocialSep}{\quad\textbar\quad}
\newcommand{\acvHeaderAfterSocialSkip}{6mm}
\newcommand{\acvHeaderAfterQuoteSkip}{5mm}

\newcommand{\acvSectionTopSkip}{3mm}
\newcommand{\acvSectionContentTopSkip}{2.5mm}

\newcolumntype{L}[1]{
  >{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}
}
\newcolumntype{C}[1]{
  >{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}
}
\newcolumntype{R}[1]{
  >{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}
}

\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}

\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}

\newcommand*{\makecvheader}[1][C]{
  \newlength{\headertextwidth}
  \newlength{\headerphotowidth}
  \ifthenelse{\isundefined{\@photo}}{
    \setlength{\headertextwidth}{\textwidth}
    \setlength{\headerphotowidth}{0cm}
  }{
    \setlength{\headertextwidth}{0.76\textwidth}
    \setlength{\headerphotowidth}{0.24\textwidth}
  }
  \begin{minipage}[c]{\headertextwidth}

    \ifthenelse{\equal{#1}{L}}
      {\raggedright}
      {\ifthenelse{\equal{#1}{R}}{\raggedleft}{\centering}}
    \headerfirstnamestyle{\@firstname}
    \headerlastnamestyle{{}\acvHeaderNameDelim\@lastname}
    \\[\acvHeaderAfterNameSkip]

    \ifthenelse{\isundefined{\@position}}
    {}
    {\headerpositionstyle{\@position\\[\acvHeaderAfterPositionSkip]}}

    \ifthenelse{\isundefined{\@address}}
    {}
    {\headeraddressstyle{\@address\\[\acvHeaderAfterAddressSkip]}}

    \headersocialstyle{
      \newbool{isstart}
      \setbool{isstart}{true}
      \ifthenelse{\isundefined{\@mobile}}
      {}
      {
        \acvHeaderIconSep\@mobile
        \setbool{isstart}{false}
      }
      \ifthenelse{\isundefined{\@homepage}}
      {}
      {
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}
        \href{http://\@homepage}{\acvHeaderIconSep\@homepage}
      }
      \ifthenelse{\isundefined{\@email}}
      {}
      {
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}
        \href{mailto:\@email}{\acvHeaderIconSep\@email}
      }
    } \\[\acvHeaderAfterSocialSkip]
    \ifthenelse{\isundefined{\@quote}}
    {}
    {\headerquotestyle{\@quote\\}\vspace{\acvHeaderAfterQuoteSkip}}
  \end{minipage}
}

\newcommand*{\makecvfooter}[3]{
  \fancyfoot[C]{\footerstyle{#1 RÉSUMÉ — PAGE #2 of #3}}
}

\newcommand{\cvsection}[1]{
  \vspace{\acvSectionTopSkip}
  \hrule
  \sectionstyle{#1}
  \phantomsection{}
}

\newcommand{\cvsubsection}[1]{
  \vspace{\acvSectionContentTopSkip}
  \vspace{-3mm}
  \subsectionstyle{#1}
  \phantomsection{}
}

\newenvironment{cvparagraph}{
  \vspace{\acvSectionContentTopSkip}
  \vspace{-3mm}
  \paragraphstyle{}
}{
  \par
  \vspace{2mm}
}

\newenvironment{cventries}{
  \vspace{\acvSectionContentTopSkip}
  \begin{center}
}{
  \end{center}
}

\newcommand*{\cventry}[5]{
  \vspace{-2.0mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}
    {\textwidth}
    {@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \entrytitlestyle{#1} & \entrylocationstyle{#2} \\
    \entrypositionstyle{#3} & \entrydatestyle{#4} \\
    \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#5}}
  \end{tabular*}
}

\newenvironment{cvsubentries}{
  \begin{center}
}{
  \end{center}
}

\newcommand*{\cvsubentry}[4]{
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}
    {@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \setlength\leftskip{0.2cm}
    \subentrytitlestyle{#2} & \ifthenelse{\equal{#1}{}}
                              {\subentrydatestyle{#3}}{}
                              \ifthenelse{\equal{#1}{}}
                              {}
                              {\subentrypositionstyle{#1} & 
                               \subentrydatestyle{#3} \\}
    \ifthenelse{\equal{#4}{}}
    {}
    {\multicolumn{2}{L{17.0cm}}{\subdescriptionstyle{#4}} \\}
  \end{tabular*}
}

\newenvironment{cvhonors}{
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2mm}
  \begin{center}
    \def\arraystretch{1.5}
    \setlength\tabcolsep{0pt}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}
      {@{\extracolsep{\fill}} C{1.5cm} L{\textwidth - 6.0cm} R{4.5cm}}
}{
    \end{tabular*}
  \end{center}
}

\newcommand*{\cvhonor}[4]{
  \honordatestyle{#4} & \honorpositionstyle{#1}, \honortitlestyle{#2} &   
    \honorlocationstyle{#3} \\
}

\newenvironment{cvskills}{
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2.0mm}
  \begin{center}
    \setlength\tabcolsep{1ex}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}
      {@{\extracolsep{\fill}} r L{\textwidth * \real{0.9}}}
}{
    \end{tabular*}
  \end{center}
}

\newcommand*{\cvskill}[2]{
  \skilltypestyle{#1} & \skillsetstyle{#2} \\
}

\newenvironment{cvitems}{
  \vspace{-4.0mm}
  \begin{itemize}[leftmargin=2ex, rightmargin=4.5cm, nosep, noitemsep]
    \setlength\itemsep{0.5em}
    \setlength{\parskip}{0pt}
    \renewcommand{\labelitemi}{\bullet}
}{
  \end{itemize}
  \vspace{-4.0mm}
}
