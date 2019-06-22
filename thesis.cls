% !TeX spellcheck = en_GB
% !TeX encoding = UTF-8

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2018/09/19 LaTeX class for my thesis]

\LoadClass[12pt,a4paper,numbers=noendperiod]{scrbook}

\RequirePackage{libertine}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage[hyphens]{url}
\RequirePackage[backref=true,backrefstyle=three,citestyle=numeric-comp,backend=biber,sortcites=true]{biblatex}
\RequirePackage[colorlinks,allcolors=black]{hyperref}
\hypersetup{breaklinks=true}
\RequirePackage{listings}
\RequirePackage[dvipsnames,table]{xcolor}
\RequirePackage{tocbasic}
\RequirePackage{caption}
\RequirePackage{mathpartir}
\RequirePackage{subcaption}
\RequirePackage{suffix}
\RequirePackage{stmaryrd}
\RequirePackage{xifthen}
\RequirePackage{fancyvrb} % FIXME is this really needed?
\RequirePackage{tikz}
\RequirePackage{enumitem}
\RequirePackage{makeidx}
\RequirePackage{placeins}
\RequirePackage{framed}
\RequirePackage{fontawesome}
\RequirePackage{manfnt}
\RequirePackage{etoc}
\RequirePackage[capitalise,noabbrev]{cleveref}
\RequirePackage{microtype}
\RequirePackage{multirow}

\setmonofont[ % <https://tex.stackexchange.com/a/183220>
  Path=fonts/,
  UprightFont = *-regular,
  BoldFont = *-bold,
  AutoFakeSlant,
  BoldItalicFeatures={FakeSlant}
]{Inconsolata}
\usepackage{unicode-math}
\setmathfont[Scale=MatchUppercase]{libertinusmath-regular.otf}
% https://tex.stackexchange.com/a/324207
\setmathfont[range={\llparenthesis,\rrparenthesis}]{XITS Math}

\lstset{
  basicstyle=\ttfamily\small,
  keywordstyle=\sffamily\bfseries\normalsize\color{Blue},
  commentstyle=\itshape\color{black!70},
  stringstyle=\color{blue},
  mathescape=true,
  columns=fullflexible,
  keepspaces=true,
  showstringspaces=false
}

\lstdefinelanguage{Isabelle}{
  morekeywords={
    datatype, type_synonym, fun, where, definition, primrec,
    typedef, abbreviation, function, and, begin, end, theory,
    imports, class, fixes, lemma, infixl, for, overloaded,
    axiomatization, setup, morphisms, unfolding, apply, oops,
    assumes, inductive, instance, instantiation, by, shows,
    declassify, code_datatype, locale, interpretation, consts,
    overloading, theorem
  },
  moredelim=**[is][\rmfamily\itshape]{//}{//},
  moredelim=**[is][\rmfamily\bfseries]{||}{||},
  morecomment=[s]{(*}{*)}
}

\lstdefinelanguage{Scala}{
  alsoletter={@,=,>},
  morekeywords={abstract, case, catch, choose, class, def, do, else, extends, false, final, finally, for, if, implicit, import, match, new, null, object, lazy, let,
override, package, private, protected, requires, return, sealed, super, this, throw, trait, try, true, type, val, while, with, yield, domain,
postcondition, precondition, constraint, assert, forAll, return, ensure, require, ensuring, assuming, otherwise, asserting}
  sensitive=true,
  morecomment=[l]{//},
  morecomment=[s]{/*}{*/},
  morestring=[b]",
}

\lstset{language=Isabelle}

\usetikzlibrary{shapes}
\usetikzlibrary{arrows}
\usetikzlibrary{calc}
\usetikzlibrary{positioning}
\usetikzlibrary{patterns}

% TOC strictly speaking not necessary
\DeclareNewTOC[
  counterwithin=chapter,%
  float,%
  type=code,%
  name=Listing,%
  floatpos=t%
]{lop}
\DeclareCaptionSubType*{code}

\DeclareCaptionFormat{ruled}{#1#2#3\hrulefill}
\DeclareCaptionFormat{simple}{#1#2#3}
\captionsetup{format=ruled}
\captionsetup[subfigure]{format=simple}
\captionsetup[subcode]{format=simple}

\crefname{code}{Listing}{Listings}
\crefname{subcode}{Listing}{Listings}
\crefname{equation}{Axiom}{Axioms}
\creflabelformat{equation}{#2#1#3}

\definecolor{light-gray}{gray}{0.95}
\newcommand\commentbox[2]{%
  \noindent\vskip.2em%
  \begin{minipage}{.03\linewidth}%
    #1%
  \end{minipage}\quad%
  \begin{minipage}{.89\linewidth}%
    \small%
    \addtokomafont{footnote}{\fontsize{8pt}{9pt}\selectfont}%
    \setfootnoterule[0pt]{0pt}%
    #2%
  \end{minipage}%
\bigskip}

\newcommand\authorship[1]{\commentbox{\scalebox{1.3}{\faPencil}}{#1}}
\newcommand\remark[1]{\commentbox{\raisebox{0.5em}{\dbend}}{#1}}
\WithSuffix\newcommand\remark*[1]{\bigskip\remark{#1}}

\newcommand\cakesym{\includegraphics[height=1ex]{img/cake.pdf}}
\WithSuffix\newcommand\cakesym*{\includegraphics[height=1.3ex]{img/cake.pdf}}

\newcommand\R{\ensuremath{\textit{R}}}
\newcommand\C{\holconst{C}}
\newcommand\rs{\ensuremath{\textit{rs}}}
\newcommand\cs{\ensuremath{\textit{cs}}}
\newcommand\css{\ensuremath{\textit{css}}}
\newcommand\rewrite[3]{\ensuremath{#1 \vdash #2 \longrightarrow #3}}
\WithSuffix\newcommand\rewrite*[3]{\ensuremath{#1 \vdash #2 \longrightarrow^* #3}}
\newcommand\eval[4][]{\ifthenelse{\equal{#1}{}}{\ensuremath{#2 \vdash #3 \approx #4}}{\ensuremath{#2 \vdash #3 \approx_{#1} #4}}}
\newcommand\evalr[4][]{\ifthenelse{\equal{#1}{}}{\ensuremath{#2 \vdash #3 \downarrow #4}}{\ensuremath{#2 \vdash #3 \downarrow_{#1} #4}}}
\newcommand\seval[4]{\ensuremath{#1, #2 \vdash #3 \downarrow #4}}
\WithSuffix\newcommand\seval*[3]{\ensuremath{#1 \vdash #2 \downarrow #3}}
\newcommand\corrp[3][]{\ifthenelse{\equal{#1}{}}{\ensuremath{#2 \approx_\text{\normalfont p} #3}}{\ensuremath{#1 \vdash #2 \approx_\text{\normalfont p} #3}}}
\newcommand\corre[2]{\ensuremath{#1 \approx_\text{\normalfont e} #2}}
\newcommand\holconst[1]{\texttt{\textup{#1}}}
\newcommand\holtype[1]{\texttt{\textup{#1}}}
\newcommand\mltype[1]{\texttt{\textup{#1}}}
\newcommand\holclass[1]{\texttt{\textup{#1}}}
\newcommand\holthm[1]{\texttt{\textup{#1}}}
\newcommand\holmap{\ensuremath{\mathbin{\rightharpoonup}}}
\newcommand\holdoublecolon{\mathbin{:\!\!:}}
\newcommand\holtypejudgement[2]{\ensuremath{#1 \holdoublecolon #2}}
\newcommand\embed[1]{\ensuremath{\left\langle#1\right\rangle}}
\newcommand\holkeyword[1]{\ensuremath{\mathtt{\mathbf{#1}}}}
\newcommand\holdoubleplus{\mathbin{+\!\!+}}
\newcommand\envadd[2]{#1 \holdoubleplus #2}
\newcommand\cons{\mathbin{\mathtt{\#}}}
\newcommand\append{\mathbin{\mathtt{@}}}
\newcommand\app[2]{#1\mathbin{\$}#2}
\newcommand\listcomb[2]{#1\mathbin{\$\$}#2}
\newcommand\corrv[3][]{\ifthenelse{\equal{#1}{}}{\ensuremath{#2 \approx_\text{\normalfont v} #3}}{\ensuremath{#1 \vdash #2 \approx_\text{\normalfont v} #3}}}
\newcommand\cakerelexp[2]{#1 \approx_\text{\cakesym} #2}
\newcommand\cakerelval[2]{#1 \approx_\text{\cakesym} #2}
\newcommand\holcommand[1]{\textsf{\textbf{\color{Blue}#1}}}
\newcommand\dict[1]{\ensuremath{\llbracket#1\rrbracket}}
\newcommand\dictinst[1]{\ensuremath{\llparenthesis#1\rrparenthesis}}
\newcommand\biimplies\Longleftrightarrow

\newtheorem{theorem}[equation]{Theorem}
\newtheorem{lemma}[equation]{Lemma}
\newtheorem{corollary}[equation]{Corollary}
\newtheorem{definition}[equation]{Definition}

% <https://tex.stackexchange.com/a/455818/172786>

\newcommand\@thyref[1]{%
  \marginpar{\footnotesize\faFileTextO\\#1}%
}
\newcommand\thyrefdist[2]{\@thyref{\href{https://isabelle.in.tum.de/website-Isabelle2018/dist/library/HOL/#1/#2.html}{\texttt{\path{#2}}}}}
\newcommand\thyrefafp[2]{\@thyref{\href{https://www.isa-afp.org/browser_info/current/AFP/#1/#2.html}{\texttt{\path{#2}}}}}
\WithSuffix\newcommand\thyrefafp*[2]{\@thyref{\href{https://devel.isa-afp.org/browser_info/current/AFP/#1/#2.html}{\texttt{\path{#2}}}}}
\newcommand\thyrefmy[2]{\@thyref{\href{https://isabelle.hupel.info/browser_info/Codegen/#1/#2.html}{\texttt{\path{#2}}}}}

\makeatother

\newcommand\etal{et al.}

\setlist[enumerate]{itemsep=0mm}
\setlist[itemize]{itemsep=0mm}
\setlist[description]{itemsep=0mm}

\newlist{semantics}{description}{1}
\setlist[semantics]{
  font=\normalfont\scshape
}

\newlist{induction}{description}{1}
\setlist[induction]{
  font=\normalfont\scshape
}

\newcommand\isafor{\textsf{Isa\kern-0.15exF\kern-0.15exo\kern-0.15exR}}
\newcommand\ceta{\textsf{C\kern-0.15exe\kern-0.45exT\kern-0.45exA}}

\renewcommand*\dictumwidth{0.5\linewidth}

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{1}

\widowpenalty10000
\clubpenalty10000

\makeindex

\newcommand\keyword[1]{\emph{#1}\index{#1}}
\newcommand\holtypeindex[1]{\index{#1@\holtype{#1} (type)}}
\newcommand\holconstindex[1]{\index{#1@\holconst{#1} (constant)}}
\newcommand\holclassindex[1]{\index{#1@\holclass{#1} (class)}}
\newcommand\holcommandindex[1]{\index{#1@\holcommand{#1} (command)}}
\newcommand\holmlindex[1]{\index{#1@\texttt{#1} (ML identifier)}}

% <https://tex.stackexchange.com/a/36308>
\DefineBibliographyStrings{english}{%
  backrefpage = {cited on page},
  backrefpages = {cited on pages}
}

% at most one float per page
\setlength\floatsep{20cm}

% hyphenation
\hyphenation{Isa-belle}
\hyphenation{data-type}
\hyphenation{con-junc-tion}

% minitoc
\newcommand{\minitoc}{%
  \etocsettocstyle{\addsec*{Contents}}{}%
  \setcounter{tocdepth}{3}
  \localtableofcontents%
  \noindent
  \rule{\textwidth}{0.4pt}%
  \vskip1em
}

% TUM stuff
\RequirePackage{tumfront}
