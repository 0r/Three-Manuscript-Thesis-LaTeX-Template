% styles.cls

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{styles}[Three Manuscript Thesis Style]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

\LoadClass[letterpaper,12pt]{report}

\RequirePackage[
  backend=biber,
  style=numeric,
  sorting=nyt,
  sortcites=true,
  %bibencoding=utf8,
  maxnames=99,
  giveninits=false,
  uniquename=init,
  doi=false,
  natbib=true,
]{biblatex}


\RequirePackage{adjustbox}
\RequirePackage{algorithm}
\RequirePackage[noend]{algpseudocode}

\newcommand{\StatexIndent}[1][1]{\Statex\hspace{#1em}}
\newcommand{\StatexIndentComment}[2][1]{\Statex\hspace{#1em}$\triangleright$ #2}

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{array}
\RequirePackage{blindtext} % lipsum text
\RequirePackage{bm}
\RequirePackage{booktabs}
\RequirePackage{etoolbox}
\RequirePackage{float}
\RequirePackage[
  top=1in,
  right=1in,
  bottom=1in,
  left=1.5in,
  includefoot,
  footskip=0.5in,
  headheight=0pt,
  headsep=0pt
]{geometry}
\RequirePackage{graphicx}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{lmodern}
\RequirePackage{lineno}
\RequirePackage{listings}
\lstset{
  basicstyle=\ttfamily\small,
  breaklines=true,
  frame=single,
  numbers=left,
  numberstyle=\tiny\color{gray},
  commentstyle=\color{green!60!black},
  keywordstyle=\color{blue},
  stringstyle=\color{red},
  showstringspaces=false
}
\RequirePackage{makecell}
\RequirePackage{mathtools}
\RequirePackage{microtype}
\RequirePackage{multirow}
% \RequirePackage{pdflscape}
\RequirePackage{rotating}
\RequirePackage{sectsty}
\RequirePackage{setspace}
\RequirePackage{siunitx}
\RequirePackage{subcaption}
\RequirePackage[table]{xcolor} 
\RequirePackage{tabularx}
\RequirePackage{textcomp}
\RequirePackage{threeparttable}
\RequirePackage{tocloft}
\RequirePackage{url}

\RequirePackage{tikz}

\usetikzlibrary{arrows.meta,positioning,decorations.pathreplacing,calc,shapes.geometric,shapes.symbols,shapes.multipart,shapes.arrows,shapes.callouts,shapes.misc, fit}

\RequirePackage{pgfplots}
\pgfplotsset{
  compat=1.18,
  samples=50,
  samples y=25,
  unbounded coords=jump,
  % turn off the math parser when not needed
  plot coordinates/math parser=false,
  % surface plots benefit from flat shader
  shader=flat
}

\providecommand{\phantomsection}{}

\newcolumntype{d}[1]{D{.}{.}{#1}}
\newcommand{\CI}[2]{\,(#1\,--\,#2)} % 95% CI formatter with en-dash

\algdef{SE}[SUBALG]{Indent}{EndIndent}{}{\algorithmicend\ }%
\algtext*{Indent}
\algtext*{EndIndent}


\setlength{\emergencystretch}{3em}

% front matter helpers — margins and page counting
\newcommand{\TitlePageMargins}{\newgeometry{top=1.2in,bottom=1.2in,left=1.25in,right=1.25in}}

% counted front matter page
\newenvironment{frontmatterpage}
  {\TitlePageMargins}
  {\clearpage\restoregeometry}

% truly uncounted front matter page
\newenvironment{uncountedfrontpage}
  {\clearpage\TitlePageMargins\thispagestyle{empty}}
  {\clearpage\addtocounter{page}{-1}\restoregeometry}

% title page should also be uncounted
\newenvironment{titlefrontpage}
  {\TitlePageMargins\thispagestyle{empty}}
  {\clearpage\addtocounter{page}{-1}\restoregeometry}

% approval helpers
\newcommand{\sigline}[1]{% 
    \vspace{6mm}{\centering\makebox[90mm]{\hrulefill}\par #1\par}
    }
\newenvironment{approvalpage}{%
  \begin{uncountedfrontpage}\thispagestyle{empty}%
  \setlength{\parindent}{0pt}\setlength{\parskip}{0.6\baselineskip}\raggedbottom%
  \begin{spacing}{1.15}}%
  {\end{spacing}\end{uncountedfrontpage}}

% ToC and lists formatting
\renewcommand\contentsname{\makebox[\textwidth][c]{TABLE OF CONTENTS}}
\setlength{\cftbeforetoctitleskip}{0pt}
\renewcommand{\cfttoctitlefont}{\Large\bfseries}
\renewcommand{\cftaftertoctitle}{\par}

\renewcommand\listtablename{LIST OF TABLES}
\setlength{\cftbeforelottitleskip}{1in}
\setlength{\cftafterlottitleskip}{0.25in}
\renewcommand{\cftlottitlefont}{\hspace{\fill}\large\bfseries}
\renewcommand{\cftafterlottitle}{\hspace{\fill} \vskip 10mm {\large Table \hspace{\fill} Page}}

\renewcommand\listfigurename{LIST OF FIGURES}
\setlength{\cftbeforeloftitleskip}{1in}
\setlength{\cftafterloftitleskip}{0.25in}
\renewcommand{\cftloftitlefont}{\hspace{\fill}\large\bfseries}
\renewcommand{\cftafterloftitle}{\hspace{\fill} \vskip 10mm {\large Figure \hspace{\fill} Page}}

% Algorithm list formatting to match figures/tables
% Number algorithms by chapter (1.1, 1.2, etc.)
\counterwithin{algorithm}{chapter}

% Algorithm list formatting to match figures/tables
\makeatletter
\newcommand{\l@algorithm}{\@dottedtocline{1}{1.5em}{2.3em}}
\makeatother

% List of Algorithms formatting to match list of figures
\makeatletter
\renewcommand\listalgorithmname{LIST OF ALGORITHMS}
\renewcommand\listofalgorithms{%
   \vskip 1in%
  {\centering\large\bfseries\listalgorithmname\par}%
  \vskip 0.25in%
  {\large Algorithm \hspace{\fill} Page}%
  \vskip 0.25in%
  \@starttoc{loa}%
}
\makeatother

\renewcommand\cftpartdotsep{\cftdotsep}
\renewcommand\cftchapdotsep{\cftdotsep}
\renewcommand\cftsecdotsep{\cftdotsep}
\renewcommand\cftsubsecdotsep{\cftdotsep}
\renewcommand\cftsubsubsecdotsep{\cftdotsep}
\renewcommand\cftparadotsep{\cftdotsep}
\renewcommand\cftsubparadotsep{\cftdotsep}
\renewcommand\cftfigdotsep{\cftdotsep}
\renewcommand\cfttabdotsep{\cftdotsep}

\setlength{\cftbeforepartskip}{12pt}
\setlength{\cftbeforechapskip}{12pt}
\setlength{\cftbeforesecskip}{12pt}
\setlength{\cftbeforesubsecskip}{12pt}
\setlength{\cftbeforesubsubsecskip}{12pt}
\setlength{\cftbeforeparaskip}{12pt}
\setlength{\cftbeforesubparaskip}{12pt}

% headings — body 12pt, headings sized for thesis readability
\chapterfont{\singlespacing\fontsize{18}{19}\selectfont\bfseries}
\sectionfont{\singlespacing\fontsize{14}{17}\selectfont\bfseries}
\subsectionfont{\singlespacing\fontsize{12}{14}\selectfont\bfseries}
\subsubsectionfont{\singlespacing\normalsize\itshape}

% chapter header marker
\newcommand{\tocChapterHeader}{%
  \begingroup
  \phantomsection
  \addcontentsline{toc}{chapter}{CHAPTER}%
  \endgroup
}

% centered bibliography heading for biblatex
\makeatletter
\defbibheading{bibcenter}{%
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{BIBLIOGRAPHY}%
  {\centering\Large\bfseries BIBLIOGRAPHY\par}%
  \vspace{1.5\baselineskip}%
}
\makeatother

% default spacing
\AtBeginDocument{%
  \doublespacing
}

% BibLaTeX mods
\DeclareFieldFormat
  [article,inbook,incollection,inproceedings,patent,thesis,unpublished]
  {title}{#1}

\renewbibmacro{in:}{%
  \ifentrytype{article}{}{\printtext{\bibstring{in}\intitlepunct}}%
}

\DeclareFieldFormat{pages}{#1}
\DeclareFieldFormat[article]{number}{\mkbibparens{#1}}

\renewbibmacro*{volume+number+eid}{%
  \setunit{\addcomma\space}%
  \printfield{volume}%
  \printfield{number}%
  \setunit{\addcomma\space}%
  \printfield{eid}%
  \setunit{\addcolon}%
  \printfield{pages}%
}

\renewbibmacro*{issue+date}{%
  \setunit{\addcomma\space}%
  \iffieldundef{issue}
    {\usebibmacro{date}}
    {\printfield{issue}%
     \setunit*{\addspace}%
     \usebibmacro{date}}%
\newunit}

\renewbibmacro*{note+pages}{%
  \printfield{note}%
  \newunit
}


% End of styles.cls
