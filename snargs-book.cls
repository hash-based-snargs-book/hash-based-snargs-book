\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{snargs-book}[2024/05/09 LuaTeX Snargs Book Class]

\RequirePackage{ifthen}

% processing of options

\newif\ifdt@later
\newif\ifdt@done

\newcommand*{\twoside}{true}
\newcommand*{\notesoption}{false}
\newcommand*{\lateroption}{false}
\newcommand*{\doneoption}{false}
\newcommand*{\lightoption}{false}
\newcommand*{\ultralightoption}{false}

\DeclareOption{bookview}{}
\DeclareOption{singlepageview}{%
    \renewcommand*{\twoside}{false}%
}
\DeclareOption{notes}{
    \renewcommand*{\notesoption}{true}%
}
\makeatletter
\DeclareOption{later}{%
    \renewcommand*{\lateroption}{true}%
    \dt@latertrue%
}
\DeclareOption{done}{%
    \renewcommand*{\doneoption}{true}%
    \dt@donetrue%
}
\makeatother
\DeclareOption{lightweight}{
    \renewcommand*{\lightoption}{true}%
}
\DeclareOption{ultralightweight}{
    \renewcommand*{\lightoption}{true}%
    \renewcommand*{\ultralightoption}{true}%
}
\ProcessOptions\relax

\def\true{true}

\LoadClass[
    fontsize=11pt,%
    bibliography=totoc,%
    listof=totoc,%
    listof=nochaptergap,%
    numbers=noenddot,%
    headings=optiontotoc,%
    toc=nonumberline,%
]{scrbook} % KOMA-Script book class

\RequirePackage[a4paper,scale=0.75,marginratio={1:1,4:3},head=76.5pt,twoside=\twoside]{geometry}
\ifx\ultralightoption\true
\else
    \RequirePackage{babel}
\fi
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{array}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{mathtools}
\ifx\lightoption\true
    \RequirePackage[draft]{graphicx}
\else
    \RequirePackage{graphicx}
\fi
\ifx\ultralightoption\true
\else
    \RequirePackage{tcolorbox}
      \tcbuselibrary{skins}
      \tcbuselibrary{theorems}
      \tcbuselibrary{breakable}
    \RequirePackage{microtype}
\fi
\RequirePackage{braket}
\RequirePackage{bm}
\RequirePackage{bbm}
\RequirePackage{xspace}
\RequirePackage{float}
\RequirePackage{multirow}
\RequirePackage{mathrsfs}
\ifx\ultralightoption\true
\else
    \RequirePackage{adjustbox}
    \RequirePackage{breakcites}
\fi
\RequirePackage{booktabs}
\RequirePackage{verbatim}
\RequirePackage{verbatimbox}
\RequirePackage{xfrac}
\RequirePackage{mathdots}
\RequirePackage{xpatch}
\RequirePackage{xcolor}
\ifx\ultralightoption\true
    \newcommand*{\fullref}[1]{}
\else
    \RequirePackage{bookmark}
    \RequirePackage{afterpage}
    \RequirePackage{pagecolor}
    \RequirePackage[type={CC},modifier={by-sa},version={4.0}]{doclicense}
    \RequirePackage[nameinlink]{cleveref}
      \creflabelformat{equation}{#2\textup{#1}#3}
      \newcommand*{\fullref}[1]{\hyperref[{#1}]{\autoref*{#1}: \nameref*{#1}}}
\fi
\RequirePackage[classfont=sanserif,langfont=roman]{complexity}
\RequirePackage{paralist}
\RequirePackage{enumitem}
  \setlist[itemize]{leftmargin=2em}
  \setlist[enumerate]{leftmargin=2em}
\RequirePackage{mathabx}
\RequirePackage{centernot}
\setcounter{secnumdepth}{3}
\RequirePackage{chngcntr}
\RequirePackage{epigraph}
\ifx\ultralightoption\true
\else
    \RequirePackage{etoc}
    \RequirePackage{fontspec}
    \RequirePackage[backend=biber,style=alphabetic,maxnames=99,maxalphanames=99,sorting=anyt,backref=true,url=true]{biblatex}
    \RequirePackage{scrlayer-scrpage}
\fi
\RequirePackage{ifpdf}
\RequirePackage{url}
\RequirePackage{etoolbox}
\RequirePackage{pifont}
\RequirePackage{relsize}
\RequirePackage[quiet]{marginnote}
\RequirePackage{morefloats}
\ifx\ultralightoption\true
    \renewcommand*{\tableofcontents}{}
    \newcommand*{\maketitlepage}{}
    \newcommand*{\doclicenseThis}{}
    \newcommand*{\printbibliography}{}
    \newcommand*{\Cref}[1]{}
    \renewcommand*{\thispagestyle}[1]{}
    \newcommand*{\phantomsection}{}
    \newcommand*{\bookmark}{}
    \newcommand*{\hypersetup}{}
    \newcommand*{\etocsetlocaltop}{}
    \newcommand*{\bookmarksetup}{}
\else
\fi


%%%%% black-box rewinding access

\ifx\lightoption\true
    \newcommand{\BlackBox}[1]{#1}
\else
    \RequirePackage{tikz}
    \definecolor{lightpink}{rgb}{1.0, 0.71, 0.76}
    \makeatletter
    \newcommand{\BlackBox}[1]{%
    \begingroup
    \setlength{\fboxsep}{1pt}%
    \tikzstyle{mybox} = [fill=lightpink!50, rounded corners=2pt, inner sep=1pt]
    \tikz[baseline=(box.base)] \node[mybox](box) {\m@th$\displaystyle#1$};
    \endgroup
    }
    \makeatother
\fi


\setlength\epigraphwidth{.6\textwidth}

\ifx\ultralightoption\true
\else
    \hypersetup{% setup for pdf bookmarks
        pdflang=en-US,%
        unicode=true,%
        pdfborder={0 0 0},%
        bookmarksopen=true,%
        bookmarksopenlevel=0,%
        bookmarksnumbered=true,%
        linktoc=all,%
    }
\fi

\allowdisplaybreaks

\vfuzz=100pt
\hfuzz=10pt

% "descending" rule for consistent line depth in colored boxes
\newcommand*{\descrule}[1][extralightgrey]{%
    {\color{#1}\rule[-.2\baselineskip]{.1pt}{.9\baselineskip}}%
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% COLORS

\ifx\ultralightoption\true
    \newcommand*{\opacitybg}{}
    \newcommand*{\opacitytitle}{}

    \newcommand{\Paint}[1]{#1}
\else
    \definecolor{darkgrey}{HTML}{333333}
    \definecolor{lightmidgrey}{HTML}{aaaaaa}
    \definecolor{extralightgrey}{HTML}{eeeeee}

    \definecolor{darkblue}{rgb}{0, 0, 0.8}
    \definecolor{overviewbg}{HTML}{dfefdf}

    % "Important" environments
    \definecolor{specialgreen}{HTML}{4b764b}
    \newcommand*{\opacitybg}{0.15}
    \newcommand*{\opacitytitle}{0.55}

    \newcommand{\Paint}[1]{\textcolor{darkblue}{#1}}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% FONTS

\ifx\ultralightoption\true
\else
    \setmainfont[%
        Path=./fonts/,%
        ItalicFont = lmroman10-italic.otf,%
        SmallCapsFont = lmromancaps10-regular,%
        BoldFont = lmroman10-bold.otf,%
        BoldItalicFont = lmroman10-bolditalic.otf,%
        Ligatures = {Common, Discretionary, TeX}
    ]{lmroman10-regular.otf}

    \setsansfont[%
        Path=./fonts/,%
        ItalicFont = lmsans10-oblique.otf,%
        BoldFont = lmsans10-bold.otf,%
        BoldItalicFont = lmsans10-boldoblique.otf,%
        Ligatures = {Common, Discretionary, TeX}
    ]{lmsans10-regular.otf}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% ADDITIONAL FONT SIZES

\makeatletter
\providecommand\@xxxpt{29.86}
\providecommand\@xi{10.95}
\providecommand\@xixpt{18.93}
\def\HUGE{%
    \@setfontsize%
    \HUGE%
    \@xxxpt{36}%
}
\def\supernormalsize{%
    \@setfontsize%
    \supernormalsize%
    \@xi{13}%
}
\def\superLARGE{%
    \@setfontsize%
    \superLARGE%
    \@xixpt{23}%
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

\newcommand{\FigureFolder}{./figs/} % fig location

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% TITLE PAGE

\ifx\lightoption\true
\else
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
\fi

\ifx\ultralightoption\true
\else
    \newcommand*{\maketitlepage}{%
        \begin{titlepage}%
            \centering%
            \sffamily%
            \vspace*{1cm}%
            \ifx\lightoption\true
            \else
                \begin{tcolorbox}[%
                    headingstyle,%
                    left*=0mm,%
                    right*=0mm,%
                    grow to left by=10mm,%
                    grow to right by=10mm,%
                ]%
            \fi
            {\HUGE\textbf{Building\hspace*{.35em}Cryptographic\hspace*{.35em}Proofs}\descrule[overviewbg]}\par%
            \addvspace{.75\baselineskip}%
            {\HUGE\textbf{from\hspace*{.35em}Hash\hspace*{.35em}Functions}{\color{overviewbg}\rule[-.15\baselineskip]{.1pt}{.85\baselineskip}}}\par%
            \ifx\lightoption\true
            \else
                \end{tcolorbox}%
            \fi
            \vspace{2cm}%
            {\LARGE Alessandro Chiesa}\par%
            \vspace{1cm}%
            {\LARGE Eylon Yogev}\par%
            \vfill%
            {\Large \today}%
        \end{titlepage}%
        \bookmark[page=1]{Cover Page}%
    }
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% PART PAGES

\ifx\ultralightoption\true
    \newcommand{\PartAbstract}[1]{#1}
\else
    \renewcommand*{\partpagestyle}{empty} % No page number and running head on part pages

    % part page style with green box
    \renewcommand*{\partlineswithprefixformat}[3]{%
        \ifx\lightoption\true
        \else
            \begin{tcolorbox}[%
                headingstyle,%
                bottom=-7.5mm,%
            ]%
        \fi
        \sffamily%
        \bfseries%
        \huge%
        \centering
        #2%
        \par%
        \Huge%
        \addvspace{.65\baselineskip}%
        #3%
        \descrule[overviewbg]%
        \ifx\lightoption\true
        \else
            \end{tcolorbox}%
        \fi
    }

    \renewcommand*{\partheademptypage}{} % remove empty page after part title page (book view)

    % Part "overview" pages
    \newcommand{\PartAbstract}[1]{
        \clearpage%
        \thispagestyle{empty} % No page number and running head on "overview" pages
        \setcounter{tocdepth}{1} % section-level toc
        \setlength{\tnwchapter}{1.85em} % toc num width for chapter level entries
        \setlength{\tnwsection}{\tnwchapter} % toc num width for section level entries
        \addtolength{\tnwsection}{.65em}
        \setlength{\tichapter}{0mm} % toc indent for chapter level entries
        \setlength{\tisection}{\tnwchapter} % toc indent for section level entries
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
        \newgeometry{% different page margins on "overview page"
            twoside=false,%
            hscale=0.675,%
            vscale=0.85,%
            marginratio={1:1,1:1},%
        }%
        \vspace*{2\baselineskip minus 2\baselineskip}
        \ifx\lightoption\true
        \else
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
        \fi
        {%
            \sffamily
            #1
            \etocsettocstyle{%
                \vspace*{-.3\baselineskip}%
                \rule[-10pt]{\textwidth}{.5pt}\par%
                \vspace*{-.3\baselineskip}\par%
            }{}%
            \localtableofcontents%
        }
        \ifx\lightoption\true
        \else
            \end{tcolorbox}
        \fi
        \vspace*{4\baselineskip minus 3\baselineskip}
        \clearpage%
        \restoregeometry%
    }
\fi

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
\theoremstyle{definition} % non-italics
\newtheorem{remark}[theorem]{Remark}
\newtheorem{construction}[theorem]{Construction}
\ifx\ultralightoption\true
    \newenvironment{ImportantTheorem}[2]{
        \begin{theorem}
    }{%
        \end{theorem}
    }
    \newenvironment{ImportantDefinition}[2]{
        \begin{definition}
    }{%
        \end{definition}
    }
    \newenvironment{ImportantConstruction}[2]{
        \begin{construction}
    }{%
        \end{construction}
    }
\else
    \definecolor{theorembackgroundcolor}{HTML}{e0f3e0}
    \definecolor{theoremlinecolor}{HTML}{707a70}
    \definecolor{constructioncolor}{HTML}{e0f3e0}
    \crefname{ImportantTheorem}{theorem}{theorems}
    \crefname{ImportantDefinition}{definition}{definitions}
    \crefname{ImportantConstruction}{construction}{constructions}
\fi

\ifx\ultralightoption\true
\else
    % general "Important" theorem style
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
        }%
    }

    \NewTcbTheorem[number within=section,use counter=theorem,crefname={definition}{definitions}]{ImportantDefinition}{Definition}{%
        theostyle,%
        fontupper=\itshape,% italics in definition env
    }{definition}

    \NewTcbTheorem[number within=section,use counter=theorem,crefname={theorem}{theorems}]{ImportantTheorem}{Theorem}{%
        theostyle,%
        fontupper=\itshape,% italics in theorem env
    }{theorem}

    \NewTcbTheorem[number within=section,use counter=theorem,crefname={construction}{constructions}]{ImportantConstruction}{Construction}{%
        theostyle,%
    }{construction}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% GLOSSARY

\newcommand{\GlossarySeparator}{\;\;\;}
\newcommand{\GlossaryEntry}[2]{#1{\GlossarySeparator}#2}

% reduced after skip for glossary entries
\RedeclareSectionCommand[%
    afterskip=1ex plus .2ex%
]%
{subsubsection}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% BIBLIOGRAPHY

\ifx\ultralightoption\true
\else
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
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% HEADER %%%%%

\ifx\ultralightoption\true
\else
    \automark[chapter]{chapter} % in single page layout show chapter title on all pages
    \automark*[section]{} % in book view layout show section title on odd pages

    \ifx\lightoption\true
        \lehead[%
            \descrule%
            \bfseries%
            \upshape%
            \sffamily%
            \addfontfeature{Scale=1}%
            \thepage% page number
        ]{%
            \descrule%
            \bfseries%
            \upshape%
            \sffamily%
            \addfontfeature{Scale=1}%
            \thepage% page number
            \descrule%
            \hspace*{\fill}%
            \color{darkgrey}%
            \bfseries%
            \upshape%
            \sffamily%
            \addfontfeature{Scale=.95}%
            \headmark% running head
        }
    \else
        \tcbset{
            headerstyle/.style={% styles for all header color boxes
                boxsep=0mm,%
                sharp corners,%
            },%
            allplainandframe/.style={% all frame boxes and those for "plain" page style (no running head)
                height=12.5mm,%
                boxrule=.1mm,%
            },%
            upperlower/.style={% boxes within the frame box
                enhanced,%
                height=12mm,%
                width=20mm,%
                boxrule=0mm,%
                colframe=extralightgrey,%
                valign=center,%
                colback=extralightgrey,%
            },%
            plainframe/.style={% frame boxes on "plain" page style pages
                skin=bicolor,%
                colframe=white,%
                top=0mm,%
                bottom=0mm,%
                valign=center,%
            },%
            frameandplainupper/.style={% frame boxes and left box on "plain" page style pages
                colframe=lightmidgrey,%
                valign=center,%
                colback=extralightgrey,%
                fuzzy shadow={0mm}{-.5mm}{.1mm}{.2mm}{black!50!white},%
            },%
            plainupper/.style={% left box on "plain" page style pages
                enhanced,%
                width=45mm,%
            },%
            frame/.style={% frame boxes
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

        % boxes on the left side on even pages

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

        % boxes on the right side on odd pages

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

        % left side of the header on even pages

        \lehead[%
            \begin{leplainframe}%
                \leplainupper{%
                    \descrule%
                    \bfseries%
                    \upshape%
                    \sffamily%
                    \addfontfeature{Scale=1}%
                    \thepage% page number
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
                \thepage% page number
            }%
            \tcblower%
            \lelower{%
                \descrule%
                \color{darkgrey}%
                \bfseries%
                \upshape%
                \sffamily%
                \addfontfeature{Scale=.95}%
                \headmark% running head
            }%
        \end{leframe}%
        }
    \fi

    \cehead*{} % center of the header on even pages
    \rehead*{} % right side of the header on even pages
    \lohead*{} % left side of the header on odd pages
    \cohead*{} % center of the header on odd pages

    \ifx\lightoption\true
        \rohead[%
            \descrule%
            \bfseries%
            \upshape%
            \sffamily%
            \addfontfeature{Scale=1}%
            \thepage% page number
        ]{%
            \descrule%
            \color{darkgrey}%
            \bfseries%
            \upshape%
            \sffamily%
            \addfontfeature{Scale=.95}%
            \headmark% running head
            \hspace*{\fill}%
            \descrule%
            \bfseries%
            \upshape%
            \sffamily%
            \addfontfeature{Scale=1}%
            \thepage% page number
        }
    \else
        % right side of the header on odd pages

        \rohead[%
            \begin{roplainframe}%
                \roplainupper{%
                    \descrule%
                    \bfseries%
                    \upshape%
                    \sffamily%
                    \addfontfeature{Scale=1}%
                    \thepage% page number
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
                \headmark% running head
            }%
            \tcblower%
            \rolower{%
                \descrule%
                \bfseries%
                \upshape%
                \sffamily%
                \addfontfeature{Scale=1}%
                \thepage% page number
            }%
        \end{roframe}%
        }
    \fi

    \setlength{\headsep}{16pt}% vertical white space between header and textarea

    \lefoot*{} % left side of the footer on even pages
    \cefoot*{} % center of the footer on even pages
    \refoot*{} % right side of the footer on even pages
    \lofoot*{} % left side of the footer on odd pages
    \cofoot*{} % center of the footer on odd pages
    \rofoot*{} % right side of the footer on odd pages
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% TOC %%%%%

\ifx\ultralightoption\true
\else
    \addto\captionsamerican{% change headings to lowercase "figures" and "tables" lettering
        \renewcommand{\listfigurename}{List of figures}
        \renewcommand{\listtablename}{List of tables}
    }

    \AfterTOCHead[toc]{% additional vertical white space after toc heading
        \vspace*{1\baselineskip plus \baselineskip minus \baselineskip}%
    }

    \newlength{\tnwpart} % toc num width of part entries
    \newlength{\tnwchapter} % toc num width of chapter entries
    \newlength{\tnwsection} % toc num width of section entries
    \newlength{\tipart} % toc indent of part entries
    \newlength{\tichapter} % toc indent of chapter entries
    \newlength{\tisection} % toc indent of section entries

    \setlength{\tnwpart}{1.85em}
    \setlength{\tnwchapter}{\tnwpart}
    \setlength{\tnwsection}{\tnwchapter}
    \addtolength{\tnwsection}{1em}

    \setlength{\tipart}{\dimexpr-1.85em + 5mm\relax} % adjustment to colored boxes
    \setlength{\tichapter}{\dimexpr5mm + 1.85em\relax} % adjustment to colored boxes
    \setlength{\tisection}{5em}

    \RedeclareSectionCommands[%
        tocraggedentrytext=true,% no hyphenation in toc entries
        tocpagenumberwidth+=.08em,%
        tocpagenumberformat=\normalfont\normalsize%
    ]%
    {chapter,section,subsection,subsubsection}

    \DeclareTOCStyleEntry[linefill]{tocline}{chapter}% dotted lines for chapter level entries

    \newcommand*{\specialparttocentryformat}[1]{%
        \supernormalsize%
        \bfseries%
        \sffamily%
        \ifx\lightoption\true
            #1%
        \else
            \tcbox[% part entries in green boxes
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
        \fi
    }

    \makeatletter
    \RedeclareSectionCommand[%
        tocentryformat=\specialparttocentryformat,%
        tocpagenumberbox=\@gobble,% remove page number
        tocpagenumberwidth=0pt,%
        toclevel=-1,%
        tocnumwidth=\tnwpart,%
        tocindent=\tipart,%
    ]%
    {part}
    \makeatother

    \ifx\lightoption\true
    \else
        \RedeclareSectionCommand[%
            tocbeforeskip=-.05\baselineskip,%
        ]%
        {part}
    \fi

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

    % list of figures and list of tables
    \DeclareTOCStyleEntries[%
        entryformat=\normalfont\normalsize\sffamily,%
        pagenumberformat=\normalfont\normalsize\sffamily,%
        raggedentrytext=true,% no hyphenation
        pagenumberwidth+=.08em,%
        indent=\tichapter,%
        numwidth=\tnwsection,%
        level=0,%
        beforeskip=.45\baselineskip%
    ]{tocline}{figure,table}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% FLOATS %%%%%

\addtokomafont{caption}{\normalfont\sffamily}
\addtokomafont{captionlabel}{\normalfont\sffamily\bfseries}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% AUTHOR NOTES AND MARKING OF BROKEN REFERENCES %%%%%

% Code snippets taken from "dtrt.sty" (https://github.com/leisec/dtrt), written by Eran Tromer <eran@tromer.org> except where noted otherwise. Distributed under the LaTeX Project Public License v1.3a or later; see http://www.latex-project.org/lppl.txt for details and (lack of) warranty.

\def\true{true}

\makeatletter

\definecolor{dt@notecolor}{rgb}{0.7,0,0}
\newcommand{\dt@colorize}[1][dt@notecolor]{\color{#1}}

% Are we in a footnote?
\newbool{dt@infootnote}\boolfalse{dt@infootnote}
\let\dt@old@footnote=\footnote
\renewcommand{\footnote}[1]{{\booltrue{dt@infootnote}\dt@old@footnote{#1}\boolfalse{dt@infootnote}}}

% Are we in a tabular?
\newbool{dt@intabular}\boolfalse{dt@intabular}
\BeforeBeginEnvironment{tabular}{\booltrue{dt@intabular}}
\AfterEndEnvironment{tabular}{\boolfalse{dt@intabular}}

% Are we in a minipage?
\newbool{dt@inminipage}\boolfalse{dt@inminipage}
\BeforeBeginEnvironment{minipage}{\booltrue{dt@inminipage}}
\AfterEndEnvironment{minipage}{\boolfalse{dt@inminipage}}

% Are we in a @float or @dblfloat environment? (This usually includes figure and table environments, but we keep them explicitly below, in case they're redefined to not use @float/@dblfloat)
\newbool{dt@in@float}\boolfalse{dt@in@float}
\xpretocmd{\@xfloat}{\booltrue{dt@in@float}}{}{}
\xapptocmd{\end@float}{\boolfalse{dt@in@float}}{}{}

\newbool{dt@in@dblfloat}\boolfalse{dt@in@dblfloat}

% Are we in a figure or figure*?
\newbool{dt@infigure}\boolfalse{dt@infigure}


% Are we in a table?
\newbool{dt@intable}\boolfalse{dt@intable}

% Are we in a \maketitle{}?
\newbool{dt@inmaketitle}\boolfalse{dt@inmaketitle}
\xpretocmd{\maketitle}{\booltrue{dt@inmaketitle}}{}{}
\xapptocmd{\maketitle}{\boolfalse{dt@inmaketitle}}{}{}

% Are we in a top float or a bottom float? (Based on code from fancyhdr)
\let\dt@old@makecol\@makecol
\def\@makecol{\let\dt@topfloat\@toplist\let\dt@botfloat\@botlist\dt@old@makecol}
\def\ifdt@intopfloat#1#2{\ifx\dt@topfloat\empty #2\else #1\fi}
\def\ifdt@inbotfloat#1#2{\ifx\dt@botfloat\empty #2\else #1\fi}

% Are we in a 'framed' environment of the 'framed' package?
\newbool{dt@inframed}\boolfalse{dt@inframed}
\AtBeginDocument{%
\xpretocmd{\MakeFramed}{\booltrue{dt@inframed}}{}{}%
\xapptocmd{\endMakeFramed}{\boolfalse{dt@inframed}}{}{}%
}

\newcommand{\sidenote}{%
% Convert top/bottom float detection to regular "if" so it will work reliably in the following.
\newif\ifdt@xinbotfloat \ifdt@inbotfloat\dt@xinbotfloatfalse\dt@xinbotfloattrue%
\newif\ifdt@xintopfloat \ifdt@intopfloat\dt@xintopfloatfalse\dt@xintopfloattrue%
%
% Create either a \marginpar if it will work, otherwise a \marginnote
\ifthenelse{\boolean{mmode} \OR \boolean{inner} \OR \boolean{dt@infootnote} \OR \boolean{dt@intabular} \OR \boolean{dt@in@float} \OR \boolean{dt@in@dblfloat} \OR \boolean{dt@infigure} \OR \boolean{dt@intable} \OR \boolean{dt@inmaketitle} \OR \boolean{dt@inminipage} \OR \boolean{dt@xintopfloat} \OR \boolean{dt@xinbotfloat} \OR \boolean{dt@inframed}}%
    {\marginnote}% \marginnote will then consume the [left-text]{right-text} arguments that follow \sidenote
    {\marginpar}%  \marginpar  will then consume the [left-text]{right-text} arguments that follow \sidenote
}

\newcommand{\dt@brokenrefmark}[1]{%
% \smash{\rlap{\dt@colorize\LARGE$\bigcirc$}}%    % hard to place this right, since \G@refundefinedtrue is invoked after the "?"
\marginnote[\dt@colorize\normalfont\smash{\large$\not\curvearrowleft $}\newline\baselineskip=0.5\baselineskip{\tiny{#1}}]
           {\dt@colorize\normalfont\smash{\large$\not\curvearrowright$}\newline\baselineskip=0.5\baselineskip{\tiny{#1}}}%
  % force a \marginnote, even though \sidenote renders nicer, because many broken citations with \sidenote can cause `"Too many unprocessed floats" errors.
}

\newbool{dt@markundef} \booltrue{dt@markundef}
\xpretocmd{\G@refundefinedtrue}{\ifbool{dt@markundef}{\dt@brokenrefmark{\@ifundefined{@citeb}{}{\@citeb}}}{}}{}{}

\let\dt@old@setref=\@setref
\renewcommand{\@setref}[3]{%
\ifx#1\relax \dt@brokenrefmark{#3}\fi%
\dt@markundeffalse%
\dt@old@setref{#1}{#2}{#3}%
\dt@markundeftrue%
}

\newcommand{\dt@rendernote}[2]{% \dt@rendernote{color}{text} -- render inline note in designated style
  { \dt@colorize[#1]\smaller\sffamily\bfseries\boldmath[#2] }%
}

\ifx\true\notesoption
  \newbool{dt@nextnoteislater} % Is the next \dtcolornote preceded by a \later?
  \boolfalse{dt@nextnoteislater}
  \newcommand{\later}{\booltrue{dt@nextnoteislater}\ignorespaces}

  \newbool{dt@nextnoteisdone} % Is the next \dtcolornote preceded by a \done?
  \boolfalse{dt@nextnoteisdone}
  \newcommand{\done}{\booltrue{dt@nextnoteisdone}\ignorespaces}

  \newbool{dt@inlinenote}
  \newcommand{\dtcolornote}[3][]{% \dtcolornote[authorname]{color}{text} -- add an inline note with mark at margin
%   \noindent%
    \ifthenelse{ \( \boolean{dt@later} \OR \NOT \boolean{dt@nextnoteislater} \) \AND \( \boolean{dt@done} \OR \NOT \boolean{dt@nextnoteisdone} \) }{\booltrue{dt@inlinenote}}{\boolfalse{dt@inlinenote}}%
    \ifbool{dt@inlinenote}{ \mbox{} }{}%
    \sidenote{\dt@colorize[#2]\centering\normalfont\footnotesize%
      \ifthenelse{\boolean{dt@nextnoteislater}}{$\diamondsuit$}{%  diamondsuit in margin for later
      \ifthenelse{\boolean{dt@nextnoteisdone}} {\ding{51}}{%       vee checkmark for done
                                               $\bigstar$}}}%      star for regular notes
    \ifbool{dt@inlinenote}{%
      \ifmmode\expandafter\mbox\fi{%
        \ifthenelse{\equal{#1}{}}{%
          \dt@rendernote{#2}{\ignorespaces #3}% anonymous author comment
        }{%
          \dt@rendernote{#2}{\ignorespaces #3{\mdseries\itshape~---\ignorespaces#1}}% named author comment
        }%
      }%
    }{}%
    \boolfalse{dt@nextnoteislater}%
    \boolfalse{dt@nextnoteisdone}%
    \ifbool{dt@inlinenote}{}{\ignorespaces}%
  }

  \newcommand{\dtnote}[2][]{%  \dtnote[authorname]{text}   (color is fixed)
    \dtcolornote[#1]{dt@notecolor}{#2}%
  }
\else
  % Define empty versions of note commands.
  % We use \ignorespaces to avoid extended spaces in "before \dtcolornote{red}{note} after" rendered as "before  after"
  \newcommand{\dtcolornote}[3][]{\ignorespaces}
  \newcommand{\dtnote}[2][]{\ignorespaces}
  \newcommand{\later}{\ignorespaces}
  \newcommand{\done}{\ignorespaces}
\fi%dt@notes

\ifx\true\notesoption
  \newcommand{\XXX}[1][XXX]{% \XXX or \XXX[text] -- a note that cannot be ignored by setting notes=false
    \sidenote[\mbox{\dt@colorize\centering\normalfont\Large$\rhd$\hskip-0.6em$\blacktriangleright$}]% triangle in margin
             {\mbox{\dt@colorize\centering\normalfont\Large$\lhd$\hskip-0.6em$\blacktriangleleft $}}%
    \ifmmode%
      \;\mbox{\dt@rendernote{dt@notecolor}{#1}}\;%
    \else
      \mbox{}{\dt@rendernote{dt@notecolor}{#1}}%
    \fi
  }
\else
  % Don't let \XXX be silently turned off.
  \newcommand{\XXX}[1][XXX]{%
    \@latex@error{You have an "\\XXX" command but you said "notes=false" to dtrt. This won't end well, aborting. Use "notes=xxx" instead to override.}\@ehd%
  }
\fi

\newcommand{\ale}[1]{\dtcolornote[Ale]{blue}{#1}}
\newcommand{\eylon}[1]{\dtcolornote[Eylon]{orange}{#1}}
\newcommand{\parhead}[1]{\paragraph{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
