\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{snargs-book}[2024/05/09 LuaTeX Snargs Book Class]

\newcommand*{\twoside}{true}

\DeclareOption{bookview}{}
\DeclareOption{singlepageview}{%
    \renewcommand*{\twoside}{false}%
}
\ProcessOptions\relax

\LoadClass[
    fontsize=11pt,%
    bibliography=totoc,%
    listof=totoc,%
    listof=nochaptergap,%
    numbers=noenddot,%
    headings=optiontotoc,%
    toc=nonumberline,%
]{scrbook}

\RequirePackage[a4paper,scale=0.75,marginratio={1:1,4:3},head=76.5pt,twoside=\twoside]{geometry}
\RequirePackage{babel}
\RequirePackage[later=false,notes=false]{dtrt}
  % https://github.com/leisec/dtrt/blob/master/dtrt.sty
  \newcommand{\ale}[1]{\dtcolornote[Ale]{blue}{#1}}
  \newcommand{\eylon}[1]{\dtcolornote[Eylon]{orange}{#1}}
  \newcommand{\parhead}[1]{\paragraph{#1}}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{array}
\RequirePackage{microtype}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{mathtools}
\RequirePackage{graphicx}
\RequirePackage{braket}
\RequirePackage{bm}
\RequirePackage{bbm}
\RequirePackage{xspace}
\RequirePackage{float}
\RequirePackage{multirow}
\RequirePackage{mathrsfs}
\RequirePackage{adjustbox}
\RequirePackage{breakcites}
\RequirePackage{booktabs}
\RequirePackage{verbatim}
\RequirePackage{verbatimbox}
\RequirePackage{xfrac}
\RequirePackage{mathdots}
\RequirePackage{xpatch}
\RequirePackage{bookmark}
\RequirePackage{xcolor}
\RequirePackage{afterpage}
\RequirePackage{pagecolor}
\RequirePackage[type={CC},modifier={by-sa},version={4.0}]{doclicense}
\RequirePackage[classfont=sanserif,langfont=roman]{complexity}
\RequirePackage{paralist}
\RequirePackage[nameinlink]{cleveref}
  \creflabelformat{equation}{#2\textup{#1}#3}
  \newcommand*{\fullref}[1]{\hyperref[{#1}]{\autoref*{#1}: \nameref*{#1}}}
\RequirePackage{enumitem}
  \setlist[itemize]{leftmargin=2em}
  \setlist[enumerate]{leftmargin=2em}
\RequirePackage{mathabx}
\RequirePackage{centernot}
\setcounter{secnumdepth}{3}
\RequirePackage{chngcntr}
\RequirePackage{epigraph}
\RequirePackage{ifthen}
\RequirePackage{etoc}
\RequirePackage{fontspec}
\RequirePackage[backend=biber,style=alphabetic,maxnames=99,maxalphanames=99,sorting=anyt,backref=true,url=true]{biblatex}
\RequirePackage{tcolorbox}
  \tcbuselibrary{skins}
  \tcbuselibrary{theorems}
  \tcbuselibrary{breakable}
\RequirePackage{scrlayer-scrpage}

\setlength\epigraphwidth{.6\textwidth}

\hypersetup{%
    pdflang=en-US,%
    unicode=true,%
	pdfborder={0 0 0},%
	bookmarksopen=true,%
    bookmarksopenlevel=0,%
	bookmarksnumbered=true,%
    linktoc=all,%
}

\allowdisplaybreaks

\vfuzz=100pt
\hfuzz=10pt

\newcommand*{\descrule}[1][extralightgrey]{%
    {\color{#1}\rule[-.2\baselineskip]{.1pt}{.9\baselineskip}}%
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% COLORS

\definecolor{darkgrey}{HTML}{333333}
\definecolor{lightdarkgrey}{HTML}{666666}
\definecolor{midgrey}{HTML}{888888}
\definecolor{lightmidgrey}{HTML}{aaaaaa}
\definecolor{grey}{HTML}{cccccc}
\definecolor{extragrey}{HTML}{d4d4d4}
\definecolor{lightgrey}{HTML}{dddddd}
\definecolor{extralightgrey}{HTML}{eeeeee}
\definecolor{almostwhite}{HTML}{f8f8f8}
\definecolor{white}{HTML}{ffffff}
\definecolor{anthrazite}{HTML}{5f5961}

\definecolor{darkblue}{rgb}{0, 0, 0.8}
%\definecolor{partcolor}{HTML}{ccebcc}
\definecolor{partcolor}{HTML}{ffffff}
\definecolor{overviewbg}{HTML}{dfefdf}
\definecolor{definitionbg}{HTML}{c5d3c5}
\definecolor{definitionframe}{HTML}{4a5a4a}
\definecolor{theorembg}{HTML}{e0f1e0}
\definecolor{theoremframe}{HTML}{5a785a}
\definecolor{constructionbg}{HTML}{ccebcc}
\definecolor{constructionframe}{HTML}{407440}

\definecolor{specialgreen}{HTML}{4b764b}
\newcommand*{\opacitybg}{0.15}
\newcommand*{\opacitytitle}{0.55}

\newcommand{\Paint}[1]{\textcolor{darkblue}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% FONTS

\setmainfont[%
    Path=./fonts/,%
    ItalicFont = lmroman10-italic.otf,%
    BoldFont = lmroman10-bold.otf,%
    BoldItalicFont = lmroman10-bolditalic.otf,%
]{lmroman10-regular.otf}

\setsansfont[%
    Path=./fonts/,%
    ItalicFont = lmsans10-oblique.otf,%
    BoldFont = lmsans10-bold.otf,%
    BoldItalicFont = lmsans10-boldoblique.otf,%
]{lmsans10-regular.otf}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% ADDITIONAL FONT SIZES

\makeatletter
\providecommand\@xxxpt{29.86}
\providecommand\@xxxvipt{35.83}
\providecommand\@xi{10.95}
\providecommand\@xiii{13.15}
\providecommand\@xixpt{18.93}
\providecommand\@xxpt{19.81}
\def\scriptsmall{%
    \@setfontsize%
    \scriptsmall%
    \@vipt%
    \@viipt%
}
\def\HUGE{%
    \@setfontsize%
    \HUGE%
    \@xxxpt{36}%
}
\def\superhuge{%
    \@setfontsize%
    \superhuge%
    \@xxxvipt{43}%
}
\def\supernormalsize{%
    \@setfontsize%
    \supernormalsize%
    \@xi{13}%
}
\def\superlarge{%
    \@setfontsize%
    \superlarge%
    \@xiii{16}%
}
\def\superLARGE{%
    \@setfontsize%
    \superLARGE%
    \@xixpt{23}%
}
\def\hugesmall{%
    \@setfontsize%
    \hugesmall%
    \@xxpt{24}%
}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% for inparaenum without labels

%\newcounter{emptycounter}
\newcommand{\emptylabel}{\phantom{}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% FIGURES

\newcommand{\FigureFolder}{./figs/low-res/} % fig location

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% TITLE PAGE

\tcbset{
    headingstyle/.style={%
        colback=overviewbg,%
        boxrule=0mm,%
        colframe=overviewbg,%
        arc=5mm,%
        boxsep=10mm,%
        sharp corners,%
        rounded corners,%
        halign=center,%
    }%
}

\newcommand*{\maketitlepage}{%
    \begin{titlepage}%
        \centering%
        \sffamily%
        \vspace*{1cm}%
        \begin{tcolorbox}[%
            headingstyle,%
            left*=0mm,%
            right*=0mm,%
            grow to left by=10mm,%
            grow to right by=10mm,%
        ]%
            {\HUGE\textbf{Building\hspace*{.35em}Cryptographic\hspace*{.35em}Proofs}\descrule[overviewbg]}\par%
            \addvspace{.75\baselineskip}%
            {\HUGE\textbf{from\hspace*{.35em}Hash\hspace*{.35em}Functions}{\color{overviewbg}\rule[-.15\baselineskip]{.1pt}{.85\baselineskip}}}\par%
        \end{tcolorbox}%
        \vspace{2cm}%
        {\LARGE Alessandro Chiesa}\par%
        \vspace{1cm}%
        {\LARGE Eylon Yogev}\par%
        \vfill%
        {\Large \today}%
        \newpagecolor{partcolor}\afterpage{\restorepagecolor}%
    \end{titlepage}%
    \bookmark[page=1]{Cover Page}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% PART PAGES

% color for part page
\newcommand{\PartColor}{\thispagestyle{empty}\newpagecolor{partcolor}\afterpage{\restorepagecolor}}

\renewcommand*{\partformat}{%
    \PartColor%
    \partname%
    \space%
    \thepart%
}

\renewcommand*{\partpagestyle}{empty}

\newcommand{\PartAbstract}[1]{
    \clearpage%
    \setcounter{tocdepth}{1} % section-level toc
    \setlength{\tnwchapter}{1.85em}
    \setlength{\tnwsection}{\tnwchapter}
    \addtolength{\tnwsection}{.65em}
    \setlength{\tichapter}{0mm}
    \setlength{\tisection}{\tnwchapter}
    \RedeclareSectionCommand[%
        tocentryformat=\normalfont\normalsize\sffamily\bfseries,%
        tocpagenumberformat=\normalfont\normalsize\sffamily\bfseries,%
        tocindent=\tichapter,%
        tocnumwidth=\tnwchapter,%
        toclevel=0,%
        tocbeforeskip=.45\baselineskip,%
        toconstarthigherlevel=\vspace{-.15\baselineskip}%
    ]%
    {chapter}
    \RedeclareSectionCommand[%
        tocentryformat=\normalfont\normalsize\sffamily,%
        tocpagenumberformat=\normalfont\normalsize\sffamily,%
        tocindent=\tisection,%
        tocnumwidth=\tnwsection,%
        toclevel=1,%
        tocbeforeskip=.1\baselineskip,%
    ]%
    {section}
    \newgeometry{
        twoside=false,%
        hscale=0.675,%
        vscale=0.85,%
        marginratio={1:1,1:1},%
    }%
    \PartColor
    \vspace*{2\baselineskip minus 2\baselineskip}
    \begin{tcolorbox}[%
        title=Overview,%
        coltitle=black,%
        toptitle=10mm,%
        colbacktitle=overviewbg,%
        fonttitle=\sffamily\bfseries\superLARGE,%
        colback=overviewbg,%
        boxrule=0mm,%
        colframe=overviewbg,%
        arc=5mm,%
        top=4.5mm,%
        bottom=2mm,%
        left*=9.5mm,%
        right*=9.5mm,%
        sharp corners,%
        rounded corners,%
        grow to left by=5mm,%
        grow to right by=5mm,%
    ]
        \sffamily
        #1
        \etocsettocstyle{%
            \vspace*{-.3\baselineskip}%
            \rule[-10pt]{\textwidth}{.5pt}\par%
            \vspace*{-.3\baselineskip}\par%
        }{}%
        \localtableofcontents
    \end{tcolorbox}
    \vspace*{4\baselineskip minus 3\baselineskip}
    \clearpage%
    \restoregeometry%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% ENVIRONMENTS

\newenvironment{smallerequation*}{%
    \begingroup
    \small
    \[ \displaystyle
}{%
    \]%
    \endgroup
}
\newtheorem{theorem}{Theorem}[section]
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{claim}[theorem]{Claim}
\definecolor{theorembackgroundcolor}{HTML}{e0f3e0}
\definecolor{theoremlinecolor}{HTML}{707a70}
\theoremstyle{definition} % non-italics
\newtheorem{remark}[theorem]{Remark}
\newtheorem{construction}[theorem]{Construction}
\definecolor{constructioncolor}{HTML}{e0f3e0}
\crefname{ImportantTheorem}{theorem}{theorems}
\crefname{ImportantDefinition}{definition}{definitions}
\crefname{ImportantConstruction}{construction}{constructions}

\tcbset{
    theostyle/.style={%
        enhanced jigsaw,%
        before skip balanced=\baselineskip,%
        after skip balanced=1.2\baselineskip,%
        fonttitle=\bfseries,%
        boxrule=0mm,%
        titlerule=0mm,%
        toprule=0mm,%
        toptitle=-.3mm,%
        bottomtitle=-.3mm,%
        bottomrule=0mm,%
        boxsep=.65\baselineskip,%
        arc=5mm,%
        rounded corners,%
        breakable,%
        colback=specialgreen,%
        colframe=specialgreen,%
        after title=\descrule[specialgreen],%
        opacityback=\opacitybg,%
        opacityframe=\opacitytitle,%
        %opacitybacktitle=0.5,%
    }%
}

\NewTcbTheorem[number within=section,crefname={definition}{definitions}]{ImportantDefinition}{Definition}{%
    theostyle,%
    fontupper=\itshape,%
}{definition}

\NewTcbTheorem[number within=section,crefname={theorem}{theorems}]{ImportantTheorem}{Theorem}{%
    theostyle,%
    fontupper=\itshape,%
}{theorem}

\NewTcbTheorem[number within=section,crefname={construction}{constructions}]{ImportantConstruction}{Construction}{%
    theostyle,%
}{construction}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% GLOSSARY

\newcommand{\GlossarySeparator}{\;\;\;}
\newcommand{\GlossaryEntry}[2]{#1{\GlossarySeparator}#2}

\RedeclareSectionCommand[%
    afterskip=1ex plus .2ex%
]%
{subsubsection}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% BIBLIOGRAPHY

\bibliography{references}
\renewcommand*{\bibfont}{\small}

\DefineBibliographyStrings{english}{%
    backrefpage={\unskip{}Cited on page},%
    backrefpages={\unskip{}Cited on pages}%
}

\AtEveryBibitem{%
  \ifentrytype{inproceedings}{%
    \clearfield{year}%
    \clearfield{series}%
  }{}%
}

% newline after authors
\DeclareDelimFormat[bib]{nametitledelim}{\newline\bibsentence}

% newline after title
\makeatletter
\def\do#1{
  \ifcsdef{blx@bbx@#1}
    {\xpatchbibdriver{#1}
       {\printlist{language}%
        \newunit\newblock}
       {\printlist{language}%
        \printunit{\newline\bibsentence}}
       {}{}}
    {}}
\abx@doentrytypes
\makeatother

% url on its own line
\DeclareFieldFormat{url}{\newline\textsc{url}: \url{#1}.}

% addendum field on new line
\renewbibmacro*{addendum+pubstate}{%
\setunit{\newline}%
\printfield{addendum}%
\newunit\newblock
\printfield{pubstate}}

% no colons after "In"
\renewcommand*{\intitlepunct}{\addspace}
\DeclareFieldFormat*{title}{\mkbibitalic{#1}}
\DeclareFieldFormat*{booktitle}{#1}
\DeclareFieldFormat*{journaltitle}{#1}
%\DeclareFieldFormat[article,inbook,incollection,inproceedings,thesis,misc]{titlecase:title}{\MakeSentenceCase*{#1}}
\renewcommand*{\finentrypunct}{}
\renewbibmacro*{pageref}{%
\addperiod
\iflistundef{pageref}
  {}
  {\newline\footnotesize\printtext[parens]{
    \ifnumgreater{\value{pageref}}{1}
    {\bibstring{backrefpages}\ppspace}
    {\bibstring{backrefpage}\ppspace}\printlist[pageref][-\value{listtotal}]{pageref}\addperiod
    }
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% HEADER %%%%%

\automark[chapter]{chapter}
\automark*[section]{}

\tcbset{
    headerstyle/.style={%
        boxsep=0mm,%
        sharp corners,%
    },%
    allplainandframe/.style={%
        height=12.5mm,%
        boxrule=.1mm,%
    },%
    upperlower/.style={%
        enhanced,%
        height=12mm,%
        width=20mm,%
        boxrule=0mm,%
        colframe=extralightgrey,%
        valign=center,%
        colback=extralightgrey,%
    },%
    plainframe/.style={%
        skin=bicolor,%
        colframe=white,%
        top=0mm,%
        bottom=0mm,%
        valign=center,%
    },%
    frameandplainupper/.style={%
        colframe=lightmidgrey,%
        valign=center,%
        colback=extralightgrey,%
        fuzzy shadow={0mm}{-.5mm}{.1mm}{.2mm}{black!50!white},%
    },%
    plainupper/.style={%
        enhanced,%
        width=45mm,%
    },%
    frame/.style={%
        skin=enhanced,%
        colbacklower=extralightgrey,%
        left*=0mm,%
        right*=0mm,%
        grow to left by=26.5mm,%
        grow to right by=26.5mm,%
        sidebyside,%
        segmentation hidden,%
        top=0mm,%
        bottom=0mm,%
        valign lower=center,%
        sidebyside gap=0mm,%
        lower separated=true,%
        sidebyside align=center seam,%
        halign lower=right,%
    },%
}

\newtcolorbox{leplainframe}{%
    headerstyle,%
    allplainandframe,%
    plainframe,%
    colback=extralightgrey,%
    colbacklower=white,%
    right*=0mm,%
    halign=left,%
}

\newtcbox{\leplainupper}{%
    headerstyle,%
    allplainandframe,%
    frameandplainupper,%
    plainupper,%
    tcbox width=minimum left,%
    left*=0mm,%
    grow to left by=26.5mm,%
}

\newtcolorbox{leframe}{
    headerstyle,%
    allplainandframe,%
    frameandplainupper,%
    frame,%
    lefthand width=20mm,%
}

\newtcbox{\leupper}{%
    headerstyle,%
    upperlower,%
    tcbox width=minimum left,%
    left*=0mm,%
}

\newtcbox{\lelower}{%
    headerstyle,%
    upperlower,%
    right*=0mm,%
}

\newtcolorbox{roplainframe}{%
    headerstyle,%
    allplainandframe,%
    plainframe,%
    colback=white,%
    colbacklower=extralightgrey,%
    right*=0mm,%
    halign=right,%
}

\newtcbox{\roplainupper}{%
    headerstyle,%
    allplainandframe,%
    frameandplainupper,%
    plainupper,%
    tcbox width=minimum right,%
    right*=0mm,%
    grow to right by=26.5mm,%
}

\newtcolorbox{roframe}{
    headerstyle,%
    allplainandframe,%
    frameandplainupper,%
    frame,%
    righthand width=20mm,%
}

\newtcbox{\roupper}{%
    headerstyle,%
    upperlower,%
    left*=0mm,%
}

\newtcbox{\rolower}{%
    headerstyle,%
    upperlower,%
    tcbox width=minimum right,%
    right*=0mm,%
}

\lehead[%
    \begin{leplainframe}%
        \leplainupper{%
            \descrule%
            \bfseries%
            \upshape%
            \sffamily%
            \addfontfeature{Scale=1}%
            \thepage%
        }%
    \end{leplainframe}%
]{%
\begin{leframe}%
    \leupper{%
        \descrule%
        \bfseries%
        \upshape%
        \sffamily%
        \addfontfeature{Scale=1}%
        \thepage%
    }%
    \tcblower%
    \lelower{%
        \descrule%
        \color{darkgrey}%
        \bfseries%
        \upshape%
        \sffamily%
        \addfontfeature{Scale=.95}%
        \headmark%
    }%
\end{leframe}%
}

\cehead*{}
\rehead*{}
\lohead*{}
\cohead*{}

\rohead[%
    \begin{roplainframe}%
        \roplainupper{%
            \descrule%
            \bfseries%
            \upshape%
            \sffamily%
            \addfontfeature{Scale=1}%
            \thepage%
        }%
    \end{roplainframe}
]{%
\begin{roframe}%
    \roupper{%
        \descrule%
        \color{darkgrey}%
        \bfseries%
        \upshape%
        \sffamily%
        \addfontfeature{Scale=.95}%
        \headmark%
    }%
    \tcblower%
    \rolower{%
        \descrule%
        \bfseries%
        \upshape%
        \sffamily%
        \addfontfeature{Scale=1}%
        \thepage%
    }%
\end{roframe}%
}

\setlength{\headsep}{16pt}% 54

\lefoot*{}
\cefoot*{}
\refoot*{}
\lofoot*{}
\cofoot*{}
\rofoot*{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% TOC %%%%%

\addto\captionsamerican{%
    \renewcommand{\listfigurename}{List of figures}
    \renewcommand{\listtablename}{List of tables}
}

\AfterTOCHead[toc]{%
    \vspace*{1\baselineskip plus \baselineskip minus \baselineskip}%
}

\newlength{\tnwpart}
\newlength{\tnwchapter}
\newlength{\tnwsection}
\newlength{\tipart}
\newlength{\tichapter}
\newlength{\tisection}

\setlength{\tnwpart}{1.85em}
\setlength{\tnwchapter}{1.85em}
\setlength{\tnwsection}{\tnwchapter}
\addtolength{\tnwsection}{1em}

\setlength{\tipart}{\dimexpr-1.85em + 5mm\relax}
\setlength{\tichapter}{\dimexpr5mm + 1.85em\relax}
\setlength{\tisection}{5em}

\RedeclareSectionCommands[%
    tocraggedentrytext=true,%
    tocpagenumberwidth+=.08em,%
    tocpagenumberformat=\normalfont\normalsize%
]%
{chapter,section,subsection,subsubsection}

\DeclareTOCStyleEntry[linefill]{tocline}{chapter}

\renewcommand*{\addchaptertocentry}[2]{%
    \IfArgIsEmpty{#1}{%
        \addtocentrydefault{chapter}{}{%
            #2%
        }%
    }{%
        \addtocentrydefault{chapter}{}{%
            \texorpdfstring{\makebox[\tnwchapter][l]}{}{#1}\texorpdfstring{}{ }#2%
        }%
    }%
}

\newcommand*{\specialparttocentryformat}[1]{%
    \supernormalsize%
    \bfseries%
    \sffamily%
    \tcbox[%
        boxrule=0mm,%
        colframe=overviewbg,%
        colback=overviewbg,%
        arc=2mm,%
        sharp corners,%
        rounded corners,%
        boxsep=.8mm,%
        left*=0mm,%
        extrude left by=5mm,%
    ]{%
        \descrule[overviewbg]%
        #1%
    }%
}

\makeatletter
\RedeclareSectionCommand[%
    tocentryformat=\specialparttocentryformat,%
    tocpagenumberbox=\@gobble,%
    tocpagenumberwidth=0pt,%
    toclevel=-1,%
    tocbeforeskip=-.05\baselineskip,%
    tocnumwidth=\tnwpart,%
    tocindent=\tipart,%
    tocpagenumberwidth+=1em%
]%
{part}
\makeatother

\RedeclareSectionCommand[%
    tocentryformat=\normalfont\normalsize\sffamily,%
    tocpagenumberformat=\normalfont\normalsize\sffamily,%
    tocindent=\tichapter,%
    tocnumwidth=\tnwchapter,%
    toclevel=0,%
    tocbeforeskip=.45\baselineskip,%
    toconstarthigherlevel=\vspace{-.15\baselineskip}%
]%
{chapter}

\DeclareTOCStyleEntries[%
    entryformat=\normalfont\normalsize\sffamily,%
    pagenumberformat=\normalfont\normalsize\sffamily,%
    raggedentrytext=true,%
    pagenumberwidth+=.08em,%
    indent=\tichapter,%
    numwidth=\tnwsection,%
    level=0,%
    beforeskip=.45\baselineskip%
]{tocline}{figure,table}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% LANDSCAPE PAGES %%%%%

\newcommand*{\landscapestart}{%
    \clearpage%
    \KOMAoptions{paper=landscape,pagesize}%
    \recalctypearea%
    \newgeometry{
        layoutsize={297mm,210mm},%
        marginratio={1:1,4:3},%
        twoside=\twoside,%
        head=76.5pt,%
        top=37.125mm,%
        bottom=26.25mm,%
        left=26.25mm,%
        right=26.25mm,%
    }%
}

\newcommand*{\landscapestop}{
    \clearpage%
    \KOMAoptions{paper=portrait,pagesize}%
    \recalctypearea%
    \restoregeometry%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% FLOATS %%%%%

\addtokomafont{caption}{\normalfont\sffamily}
\addtokomafont{captionlabel}{\normalfont\sffamily\bfseries}

%\setlength{\floatsep}{20.0pt plus 2.0pt minus 4.0pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\renewcommand*{\part}[1]{%
    \stepcounter{part}%
    \cleardoubleoddpage%
    \phantomsection%
    \addcontentsline{toc}{part}{\protect\numberline{\thepart}#1}%
    %\vspace*{13.1\baselineskip}%
    \vspace*{11.1\baselineskip}%
    {%
        \begin{tcolorbox}[%
            headingstyle,%
        ]%
            \sffamily%
            \bfseries%
            \huge%
            \centering
            \partformat%
            \par%
            \Huge%
            \addvspace{.65\baselineskip}%
            #1%
            \descrule[overviewbg]%
            \par%
        \end{tcolorbox}%
    }%
}
