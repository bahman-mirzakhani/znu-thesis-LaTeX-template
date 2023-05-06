% !TeX root = ../thesis.tex
% E-mail: bmirzakhani.en@gmail.com
% v1.9 (Release name: Mohaddeseh Bakhtiyari)
% ===========================================================
\NeedsTeXFormat{LaTeX2e}
\def\znuThesis@releaseName{Mohaddeseh Bakhtiyari}
\def\znuThesis@persian@releaseName{محدّثه بختیاری}
\newcommand*{\znuThesisRname}{%
	\if@RTL
		\znuThesis@persian@releaseName
	\else
		\znuThesis@releaseName
	\fi
}
\ProvidesClass{znuThesis}[2023/05/06 v1.9 (Release name: \znuThesis@releaseName) ZNU Thesis]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[12pt,a4paper]{report}
% ===========================================================
% آپشن‌ها
\newif\ifznuFinal
\DeclareOption{Final}{\znuFinaltrue}
\newif\ifznuMscThesis
\DeclareOption{msc}{\znuMscThesistrue}
\newif\ifznuBscThesis
\DeclareOption{bsc}{\znuBscThesistrue}
\newif\ifznuDigitFa
\DeclareOption{digitFa}{\znuDigitFatrue}
\newif\ifznuUseIndex
\DeclareOption{idx}{\znuUseIndextrue}
\newif\ifznuUseGlossaries
\newif\ifznuUseDicts
\DeclareOption{dict}{\znuUseDictstrue\znuUseGlossariestrue}
\newif\ifznuUseAcronyms
\DeclareOption{acr}{\znuUseAcronymstrue\znuUseGlossariestrue}
\newif\ifznuUseSymb
\DeclareOption{smbl}{\znuUseSymbtrue}
\newif\ifznuUseRefNum
\DeclareOption{refNumber}{\znuUseRefNumtrue}
\ProcessOptions\relax
% ===========================================================
% بسته‌ها
% تنظیم حاشیه:
\RequirePackage{geometry}
\geometry{%
	left=2.5cm,%
	right=3cm,%
	bottom=2.8cm,%
	top=2.7cm,%
	includefoot,%
	includehead,%
%	showframe
}
% ===========================================================
% تنظیمات سربرگ و ته‌برگ:
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\small\nouppercase{\rightmark}}
\fancyhead[R]{\small\nouppercase{\leftmark}}
\fancyfoot[C]{\small\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\setlength{\headheight}{22pt}
\fancypagestyle{refpage}{%
	\fancyhf{}
	\fancyhead[R]{\small\nouppercase{\leftmark}}
	\fancyfoot[C]{\small\thepage}
}
% ===========================================================
% حروف‌چینی چندستونی:
\RequirePackage{multicol}
% ===========================================================
% اصلاح سایز فونت cm و lm:
\RequirePackage{fix-cm}
\RequirePackage{lmodern}
% ===========================================================
\RequirePackage{etoolbox}
\RequirePackage{newfloat}
\RequirePackage{tocloft}
\AfterPreamble{%
% دستوراتی برای ایجاد فهرست روابط ریاضی:
	\newcommand{\listequationsname}{فهرست روابط ریاضی}
	\newlistof{myequations}{equ}{\listequationsname} % from tocloft
	\newcommand{\myequation}[1]{% we use this command after numbered equation
		\addcontentsline{equ}{myequations}{%
			\protect\numberline{\theequation}#1%
		}%
	}
% دستوراتی برای ایجاد محیط و فهرست کدها:
	\newcommand{\listcodename}{فهرست کدها}
	\newlistof{code}{loc}{\listcodename} % from tocloft
	\DeclareFloatingEnvironment[% from newfloat
		name=کد,%
		within=chapter,%
		fileext=loc%
	]{code}
% دستوراتی برای ایجاد محیط و فهرست نمودارها:
	\newcommand{\listdiagname}{فهرست نمودارها}
	\newlistof{diag}{lod}{\listdiagname} % from tocloft
	\DeclareFloatingEnvironment[% from newfloat
	name=نمودار,%
	within=chapter,%
	fileext=lod%
	]{diag}
}
% ===========================================================
% دستوراتی برای عکس‌شدن ترتیب صفحات چکیدهٔ انگلیسی:
\RequirePackage{atbegshi}
\newif\ifRP
\newbox\RPbox
\setbox\RPbox\vbox{\vskip1pt}
\AtBeginShipout{%
	\ifRP
	\AtBeginShipoutDiscard%
	\global\setbox\RPbox\vbox{\unvbox\RPbox
		\box\AtBeginShipoutBox\kern\c@page sp}%
	\fi
}
\renewcommand{\RPtrue}{%
	\clearpage
	\ifRP\RPfalse\fi
	\global\RenewCommandCopy{\ifRP}{\iftrue}
}
\renewcommand{\RPfalse}{%
	\clearpage
	\global\RenewCommandCopy{\ifRP}{\iffalse}
	\setbox\RPbox\vbox{\unvbox\RPbox
		\def\protect{\noexpand\protect\noexpand}%
		\@whilesw\ifdim0pt=\lastskip\fi
		{\c@page\lastkern\unkern\shipout\lastbox}%
	}%
}
% ===========================================================
% بسته‌ای برای تنظیم اندازه فونت فصل، بخش و…:
\RequirePackage{titlesec}
\AfterPreamble{%
	\titleformat{\chapter}[display]%
		{\filcenter\normalfont\fontsize{16}{19}\selectfont\bfseries}%
		{\chaptertitlename\ \arabic{chapter}}%
		{0pt}%
		{\normalfont\fontsize{16}{19}\selectfont\bfseries}
	\apptocmd{\appendix}{%
		\titleformat{\chapter}[display]%
			{\filcenter\normalfont\fontsize{16}{19}\selectfont\bfseries}%
			{\chaptertitlename\ \Abjad{chapter}}%
			{0pt}%
			{\normalfont\fontsize{16}{19}\selectfont\bfseries}
	}{}{}
	\titleformat{\section}%
		{\normalfont
			\ifznuBscThesis\IRZar\else\fontsize{13.5}{16.2}\selectfont\fi
		\bfseries}%
		{\thesection}%
		{1em}%
		{}
	\titlespacing*{\section}{0pt}{1.5ex plus .5ex minus .2ex}{0ex plus .2ex}
	\titleformat{\subsection}
		{\normalfont
			\ifznuBscThesis\IRZar\else\fontsize{12.7}{15}\selectfont\fi
		\bfseries}%
		{\thesubsection}%
		{1em}%
		{}
	\titlespacing*{\subsection}{0pt}{1.25ex plus .5ex minus .2ex}{0ex plus .2ex}
	\titleformat{\subsubsection}
		{\normalfont\ifznuBscThesis\IRZar\else\normalsize\fi\bfseries}%
		{\thesubsubsection}%
		{1em}%
		{}
	\titlespacing*{\subsubsection}{0pt}{1.25ex plus .5ex minus .2ex}{0ex plus .2ex}
}
% ===========================================================
% تنظیم اندازه عنوان فهرست‌ها:
\AfterPreamble{%
% toc title
	\renewcommand{\cfttoctitlefont}{\hspace*{\fill}%
		\normalfont\fontsize{16}{19}\selectfont\bfseries}
	\renewcommand{\cftaftertoctitle}{\hspace*{\fill}}
% lof title
	\renewcommand{\cftloftitlefont}{\hspace*{\fill}%
		\normalfont\fontsize{16}{19}\selectfont\bfseries}
	\renewcommand{\cftafterloftitle}{\hspace*{\fill}}
% lot title
	\renewcommand{\cftlottitlefont}{\hspace*{\fill}%
		\normalfont\fontsize{16}{19}\selectfont\bfseries}
	\renewcommand{\cftafterlottitle}{\hspace*{\fill}}
% equ title
	\renewcommand{\cftequtitlefont}{\hspace*{\fill}%
		\normalfont\fontsize{16}{19}\selectfont\bfseries}
	\renewcommand{\cftafterequtitle}{\hspace*{\fill}}
% loc title
	\renewcommand{\cftloctitlefont}{\hspace*{\fill}%
		\normalfont\fontsize{16}{19}\selectfont\bfseries}
	\renewcommand{\cftafterloctitle}{\hspace*{\fill}}
% lod title
	\renewcommand{\cftlodtitlefont}{\hspace*{\fill}%
		\normalfont\fontsize{16}{19}\selectfont\bfseries}
	\renewcommand{\cftafterlodtitle}{\hspace*{\fill}}
}
% تنظیم تورفتگی در فهرست‌ها:
\edef\fixedsecnumwidth{\the\cftsecnumwidth}
\edef\fixedsubsecnumwidth{\the\cftsubsecnumwidth}
\edef\fixedsubsubsecnumwidth{\the\cftsubsubsecnumwidth}
 \setlength{\cftsecindent}{1em}
 \setlength{\cftsecnumwidth}{2.5em}
 \setlength{\cftsubsecindent}{2em}
 \setlength{\cftsubsecnumwidth}{3.5em}
 \setlength{\cftsubsubsecindent}{3em}
 \setlength{\cftsubsubsecnumwidth}{4.5em}
 % ===========================================================
 % حذف تورفتگی شکل و جدول در فهرست‌های مربوطه:
 \setlength{\cftfigindent}{0pt}
 \setlength{\cfttabindent}{0pt}
 \AfterPreamble{\patchcmd{\listof}{1.5em}{0pt}{}{}}
% ===========================================================
% اضافه‌کردن کلمهٔ فصل، پیوست، شکل و جدول به آیتم‌های فهرست مطالب، شکل‌ها و جدول‌ها:
\RequirePackage{calc}
\AfterPreamble{%
% فصل:
	\edef\fixedchapnumwidth{\the\cftchapnumwidth}
	\renewcommand{\chaptername}{فصل}
	\renewcommand{\cftchappresnum}{\chaptername~}
	\renewcommand{\cftchapaftersnum}{:}
	\newlength{\chaplen}
	\settowidth{\chaplen}{\chaptername~\cftchapaftersnum}
	\addtolength{\cftchapnumwidth}{\chaplen}
% پیوست:
	\newcommand{\setupchapname}[1]{%
		\addtocontents{toc}{%
			\unexpanded{\unexpanded{%
					\renewcommand{\cftchappresnum}{#1\ }%
					\setlength{\cftchapnumwidth}{\widthof{\bfseries #1\ }}%
					\addtolength{\cftchapnumwidth}{\dimexpr\fixedchapnumwidth+.7em}%
			}}%
		}%
	}
	\apptocmd{\appendix}{%
		\addtocontents{toc}{%
			\unexpanded{\unexpanded{%
					\setlength{\cftsecnumwidth}{\widthof{الف-9-1}}%
			}}%
		}%
		\addtocontents{toc}{%
			\unexpanded{\unexpanded{%
					\setlength{\cftsubsecnumwidth}{\widthof{الف-9-9-}}%
			}}%
		}%
		\addtocontents{toc}{%
			\unexpanded{\unexpanded{%
					\setlength{\cftsubsubsecnumwidth}{\widthof{الف-9-9-9-}}%
			}}%
		}%
		\setupchapname{\appendixname}%
% تنظیم عرض شماره‌های الگوریتم در لیست مربوطه (برای پیوست):
		\addtocontents{loa}{%
			\protect\renewcommand{\protect\l@algorithm}%
			{\protect\@dottedtocline{1}{0em}{3em}}}%
	}{}{}
% شکل:
	\edef\fixedfignumwidth{\the\cftfignumwidth}
	\renewcommand{\figurename}{شکل}
	\renewcommand{\cftfigpresnum}{\figurename~}
	\renewcommand{\cftfigaftersnum}{:}
	\newlength{\figlen}
	\settowidth{\figlen}{\cftfigpresnum\cftfigaftersnum}
	\addtolength{\cftfignumwidth}{\figlen}

	\newcommand{\setupfigname}[1]{%
		\addtocontents{lof}{%
			\unexpanded{\unexpanded{%
					\renewcommand{\cftfigpresnum}{#1\ }%
					\setlength{\cftfignumwidth}{\widthof{\bfseries #1\ }}%
					\addtolength{\cftfignumwidth}{\dimexpr\fixedfignumwidth+.8em}%
			}}%
		}%
	}
	\apptocmd{\appendix}{%
		\addtocontents{lof}{%
			\unexpanded{\unexpanded{%
					\setlength{\cftfignumwidth}{\widthof{الف-9-}}%
			}}%
		}%
		\setupfigname{\figurename}%
	}{}{}
% جدول:
	\edef\fixedtabnumwidth{\the\cfttabnumwidth}
	\renewcommand{\tablename}{جدول}
	\renewcommand{\cfttabpresnum}{\tablename~}
	\renewcommand{\cfttabaftersnum}{:}
	\newlength{\tablen}
	\settowidth{\tablen}{\cfttabpresnum\cfttabaftersnum}
	\addtolength{\cfttabnumwidth}{\tablen}

	\newcommand{\setuptabname}[1]{%
		\addtocontents{lot}{%
			\unexpanded{\unexpanded{%
					\renewcommand{\cfttabpresnum}{#1\ }%
					\setlength{\cfttabnumwidth}{\widthof{\bfseries #1\ }}%
					\addtolength{\cfttabnumwidth}{\dimexpr\fixedtabnumwidth+.8em}%
			}}%
		}%
	}
	\apptocmd{\appendix}{%
		\addtocontents{lot}{%
			\unexpanded{\unexpanded{%
					\setlength{\cfttabnumwidth}{\widthof{الف-9-}}%
			}}%
		}%
		\setuptabname{\tablename}%
	}{}{}
% روابط ریاضی:
	\edef\fixedequnumwidth{\the\cftmyequationsnumwidth}
	\renewcommand{\cftmyequationspresnum}{رابطهٔ~}
	\renewcommand{\cftmyequationsaftersnum}{:}
	\newlength{\equlen}
	\settowidth{\equlen}{\cftmyequationspresnum\cftmyequationsaftersnum}
	\addtolength{\cftmyequationsnumwidth}{\dimexpr\equlen+.5em}

	\newcommand{\setupequname}[1]{%
		\addtocontents{equ}{%
			\unexpanded{\unexpanded{%
					\renewcommand{\cftmyequationspresnum}{#1\ }%
					\setlength{\cftmyequationsnumwidth}{\widthof{\bfseries #1\ }}%
					\addtolength{\cftmyequationsnumwidth}{\dimexpr\fixedequnumwidth+1.2em}%
			}}%
		}%
	}
	\apptocmd{\appendix}{%
		\addtocontents{equ}{%
			\unexpanded{\unexpanded{%
					\setlength{\cftmyequationsnumwidth}{\widthof{الف-9-}}%
			}}%
		}%
		\setupequname{رابطهٔ}%
	}{}{}
% کد:
	\edef\fixedcodenumwidth{\the\cftcodenumwidth}
	\renewcommand{\codename}{کد}
	\renewcommand{\cftcodepresnum}{\codename~}
	\renewcommand{\cftcodeaftersnum}{:}
	\newlength{\codelen}
	\settowidth{\codelen}{\cftcodepresnum\cftcodeaftersnum}
	\addtolength{\cftcodenumwidth}{\dimexpr\codelen+.5em}

	\newcommand{\setupcodename}[1]{%
		\addtocontents{loc}{%
			\unexpanded{\unexpanded{%
					\renewcommand{\cftcodepresnum}{#1\ }%
					\setlength{\cftcodenumwidth}{\widthof{\bfseries #1\ }}%
					\addtolength{\cftcodenumwidth}{\dimexpr\fixedcodenumwidth+1.2em}%
			}}%
		}%
	}
	\apptocmd{\appendix}{%
		\addtocontents{loc}{%
			\unexpanded{\unexpanded{%
					\setlength{\cftcodenumwidth}{\widthof{الف-9-}}%
			}}%
		}%
		\setupcodename{\codename}%
	}{}{}
% نمودار:
	\edef\fixeddiagnumwidth{\the\cftdiagnumwidth}
	\renewcommand{\diagname}{نمودار}
	\renewcommand{\cftdiagpresnum}{\diagname~}
	\renewcommand{\cftdiagaftersnum}{:}
	\newlength{\diaglen}
	\settowidth{\diaglen}{\cftdiagpresnum\cftdiagaftersnum}
	\addtolength{\cftdiagnumwidth}{\dimexpr\diaglen+.5em}

	\newcommand{\setupdiagname}[1]{%
		\addtocontents{lod}{%
			\unexpanded{\unexpanded{%
					\renewcommand{\cftdiagpresnum}{#1\ }%
					\setlength{\cftdiagnumwidth}{\widthof{\bfseries #1\ }}%
					\addtolength{\cftdiagnumwidth}{\dimexpr\fixeddiagnumwidth+1.2em}%
			}}%
		}%
	}
	\apptocmd{\appendix}{%
		\addtocontents{lod}{%
			\unexpanded{\unexpanded{%
					\setlength{\cftdiagnumwidth}{\widthof{الف-9-}}%
			}}%
		}%
		\setupdiagname{\diagname}%
	}{}{}
% الگوریتم:
	\NewCommandCopy{\oldlistofalgorithms}{\listofalgorithms}
	\renewcommand{\listofalgorithms}{%
		\begingroup
		\NewCommandCopy{\oldnumberline}{\numberline}%
		\renewcommand{\numberline}[1]{الگوریتم~\oldnumberline{##1:}}%
		\oldlistofalgorithms
		\endgroup}
% اضافه‌کردن «عنوان» و «صفحه» به فهرست‌ها:
	\addtocontents{toc}{\textbf{عنوان} \hfill{}
		\textbf{صفحه}\newline\rule{\linewidth}{0.4pt}\par}
	\addtocontents{lof}{\textbf{عنوان}\hfill{}
		\textbf{صفحه}\newline\rule{\linewidth}{0.4pt}\par}
	\addtocontents{lot}{\textbf{عنوان} \hfill{}
		\textbf{صفحه}\newline\rule{\linewidth}{0.4pt}\par}
	\addtocontents{equ}{\textbf{عنوان} \hfill{}
	\textbf{صفحه}\newline\rule{\linewidth}{0.4pt}\par}
	\addtocontents{loc}{\textbf{عنوان} \hfill{}
		\textbf{صفحه}\newline\rule{\linewidth}{0.4pt}\par}
	\addtocontents{lod}{\textbf{عنوان} \hfill{}
		\textbf{صفحه}\newline\rule{\linewidth}{0.4pt}\par}
	\addtocontents{loa}{\textbf{عنوان} \hfill{}
		\textbf{صفحه}\newline\rule{\linewidth}{0.4pt}\par}
}
% ===========================================================
% بسته‌ای برای تنظیم فاصلهٔ خطوط:
\RequirePackage{setspace}
% ===========================================================
% بسته‌ای برای آوردن منابع، نمایه، فهرست جدول‌ها و شکل‌ها به فهرست مطالب:
\RequirePackage[nottoc]{tocbibind}
% ===========================================================
% تعریف شمارنده ابجد و ترکیب آن‌ها:
\RequirePackage{alphalph}
\AfterPreamble{%
	\newcommand*{\abjadSingle}[1]{%
		\ifcase#1‌\or الف‌\or ب‌\or ج‌\or د%
		‌\or ه‌\or و‌\or ز‌\or ح‌\or ط%
		‌\or ی‌\or ک‌\or ل‌\or م‌\or ن%
		‌\or س‌\or ع‌\or ف‌\or ص%
		‌\or ق‌\or ر‌\or ش‌\or ت‌\or ث%
		‌\or خ‌\or ذ‌\or ض‌\or ظ‌\or غ%
		\else\@ctrerr\fi
	}
	\newalphalph{\abjadMult}[alph]{\abjadSingle}{}
}
% ===========================================================
% تنظیمات محیط برای متلب، پایتون، R و GAMS:
\RequirePackage{listings}
\RequirePackage{xcolor}
\definecolor{mygreen}{RGB}{28,172,0} 
\definecolor{mylilas}{RGB}{170,55,241}
\lstset{inputpath=./codes/}
\lstdefinestyle{MATLABshort}{%
	language=Matlab,
	breaklines=true,
	basicstyle=\setLTR\ttfamily\small\setstretch{1},
	morekeywords={matlab2tikz},
	keywordstyle=\color{blue},
	morekeywords=[2]{1},
	keywordstyle=[2]{\color{black}},
	identifierstyle=\color{black},
	stringstyle=\color{mylilas},
	commentstyle=\color{mygreen},
	showstringspaces=false,
	frame=single,
	rulecolor=\color{magenta},
	numbers=left,
	numberstyle=\scriptsize,
	numberblanklines=false,
	xleftmargin=17pt,
	xrightmargin=3.4pt
}
\lstdefinestyle{MATLABlong}{%
	language=Matlab,
	breaklines=true,
	basicstyle=\setLTR\ttfamily\small\setstretch{1},
	morekeywords={matlab2tikz},
	keywordstyle=\color{blue},
	morekeywords=[2]{1},
	keywordstyle=[2]{\color{black}},
	identifierstyle=\color{black},
	stringstyle=\color{mylilas},
	commentstyle=\color{mygreen},
	showstringspaces=false,
	frame=single,
	rulecolor=\color{magenta},
	xleftmargin=3.4pt,
	xrightmargin=3.4pt
}
\definecolor{deepblue}{rgb}{0,0,0.5}
\definecolor{deepred}{rgb}{0.6,0,0}
\definecolor{deepgreen}{rgb}{0,0.5,0}
\lstdefinestyle{PythonShort}{%
	language=Python,
	basicstyle=\setLTR\ttfamily\small\setstretch{1},
	otherkeywords={self}, % Add keywords here
	keywordstyle=\ttfamily\small\bfseries\color{deepblue},
	emph={__init__}, % Custom highlighting
	emphstyle=\ttfamily\small\bfseries\color{deepred}, % Custom highlighting style
	stringstyle=\color{deepgreen},
	showstringspaces=false,
	breaklines=true,
	frame=single,
	rulecolor=\color{cyan},
	numbers=left,
	numberstyle=\scriptsize,
	numberblanklines=false,
	xleftmargin=17pt,
	xrightmargin=3.4pt
}
\lstdefinestyle{PythonLong}{%
	language=Python,
	basicstyle=\setLTR\ttfamily\small\setstretch{1},
	otherkeywords={self}, % Add keywords here
	keywordstyle=\ttfamily\small\bfseries\color{deepblue},
	emph={__init__}, % Custom highlighting
	emphstyle=\ttfamily\small\bfseries\color{deepred}, % Custom highlighting style
	stringstyle=\color{deepgreen},
	showstringspaces=false,
	breaklines=true,
	frame=single,
	rulecolor=\color{cyan},
	xleftmargin=3.4pt,
	xrightmargin=3.4pt
}
\lstdefinestyle{Rshort}{%
	language=R,
	basicstyle=\setLTR\ttfamily\small\setstretch{1},
	stringstyle=\color{darkgreen},
	otherkeywords={0,1,2,3,4,5,6,7,8,9},
	morekeywords={TRUE,FALSE},
	deletekeywords={data,frame,length,as,character},
	keywordstyle=\color{blue},
	commentstyle=\color{darkgreen},
	tabsize=4,
	breaklines=true,
	showstringspaces=false,
	frame=single,
	rulecolor=\color{green},
	numbers=left,
	numberstyle=\scriptsize,
	numberblanklines=false,
	xleftmargin=17pt,
	xrightmargin=3.4pt
}
\definecolor{darkgreen}{rgb}{0.0, 0.2, 0.13}
\lstdefinestyle{Rlong}{%
	language=R,
	basicstyle=\setLTR\ttfamily\small\setstretch{1},
	stringstyle=\color{darkgreen},
	otherkeywords={0,1,2,3,4,5,6,7,8,9},
	morekeywords={TRUE,FALSE},
	deletekeywords={data,frame,length,as,character},
	keywordstyle=\color{blue},
	commentstyle=\color{darkgreen},
	tabsize=4,
	breaklines=true,
	showstringspaces=false,
	frame=single,
	rulecolor=\color{green},
	xleftmargin=3.4pt,
	xrightmargin=3.4pt
}
\lstdefinelanguage{GAMS}{
	morekeywords={
		ABORT , ACRONYM , ACRONYMS , ALIAS , ALL , AND , ASSIGN , BINARY , CARD , DISPLAY , EPS , EQ , EQUATION , EQUATIONS , GE , GT , INF , INTEGER , LE , LOOP , LT , MAXIMIZING , MINIMIZING , MODEL , MODELS , NA , NE , NEGATIVE , NOT , OPTION , OPTIONS , OR , ORD , PARAMETER , PARAMETERS , POSITIVE , PROD , SCALAR , SCALARS , SET , SETS , SMAX , SMIN , SOS1 , SOS2 , SUM , SYSTEM , TABLE , USING , VARIABLE , VARIABLES , XOR , YES , REPEAT , UNTIL , WHILE , IF , THEN , ELSE , SEMICONT , SEMIINT , FILE , FILES , PUT , PUTPAGE , PUTTL , PUTCLOSE , FREE , NO , SOLVE , FOR , ELSEIF , ABS , ARCTAN , CEIL , COS , ERROR , EXP , FLOOR , LOG , LOG10 , MAP , MAPVAL , MAX , MIN , MOD , NORMAL , POWER , ROUND , SIGN , SIN , SQR , SQRT , TRUNC , UNIFORM , LO , UP , FX , SCALE , PRIOR , PC , PS , PW , TM , BM , CASE , DATE , IFILE , OFILE , PAGE , RDATE , RFILE , RTIME , SFILE , TIME , TITLE , TS , TL , TE , TF , LJ , NJ , SJ , TJ , LW , NW , SW , TW , ND , NR , NZ , CC , HDCC , TLCC , LL , HDLL , TLLL , LP , WS , /,PROD: },
	sensitive = false,
	morecomment=[f]*,%
	morecomment=[s]{$ontext}{$offtext},
	morecomment=[s][\color{green!75!black}]{/}{/},
	morestring=[b]“,
	morestring=[b]‘
}
\lstdefinestyle{GAMSshort}{%
	language=GAMS,
	basicstyle=\setLTR\ttfamily\small\setstretch{1},
	commentstyle=\color{gray}\itshape,
	keywordstyle=\color{blue}\bfseries,
	stringstyle=\color[rgb]{0.5,0,0.5}\itshape,
	showstringspaces=false,
	numbers=left,
	numberstyle=\scriptsize,
	numberblanklines=false,
	showlines=false,
	breaklines=true,
	tabsize=4,
	frame=single,
	xleftmargin=17pt,
	xrightmargin=3.4pt
}
\lstdefinestyle{GAMSlong}{%
	language=GAMS,
	basicstyle=\setLTR\ttfamily\small\setstretch{1},
	commentstyle=\color{gray}\itshape,
	keywordstyle=\color{blue}\bfseries,
	stringstyle=\color[rgb]{0.5,0,0.5}\itshape,
	showstringspaces=false,
	showlines=false,
	breaklines=true,
	tabsize=4,
	frame=single,
	xleftmargin=3.4pt,
	xrightmargin=3.4pt
}
% ===========================================================
% اطلاعات دانشجو، اساتید و پایان‌نامه:
\newcommand*{\fullNameFa}[1]{\newcommand*{\@fullNameFa}{#1}}
\newcommand*{\fullNameEn}[1]{\newcommand*{\@fullNameEn}{#1}}
\newcommand*{\titleFa}[1]{\newcommand*{\@titleFa}{#1}}
\newcommand*{\titleEn}[1]{\newcommand*{\@titleEn}{#1}}
\newcommand*{\majorFa}[1]{\newcommand*{\@majorFa}{#1}}
\newcommand*{\majorEn}[1]{\newcommand*{\@majorEn}{#1}}
\newcommand*{\fieldFa}[1]{\newcommand*{\@fieldFa}{#1}}
\newcommand*{\fieldEn}[1]{\newcommand*{\@fieldEn}{#1}}
\newcommand*{\departmentFa}[1]{\newcommand*{\@departmentFa}{#1}}
\newcommand*{\departmentEn}[1]{\newcommand*{\@departmentEn}{#1}}
\newcommand*{\groupFa}[1]{\newcommand*{\@groupFa}{#1}}
\newcommand*{\groupEn}[1]{\newcommand*{\@groupEn}{#1}}
\newcommand*{\firstSupervisorFa}[1]{\newcommand*{\@firstSupervisorFa}{#1}}
\newcommand*{\firstSupervisorEn}[1]{\newcommand*{\@firstSupervisorEn}{#1}}
\newcommand*{\secondSupervisorFa}[1]{\newcommand*{\@secondSupervisorFa}{#1}}
\newcommand*{\secondSupervisorEn}[1]{\newcommand*{\@secondSupervisorEn}{#1}}
\newcommand*{\firstAdvisorFa}[1]{\newcommand*{\@firstAdvisorFa}{#1}}
\newcommand*{\firstAdvisorEn}[1]{\newcommand*{\@firstAdvisorEn}{#1}}
\newcommand*{\secondAdvisorFa}[1]{\newcommand*{\@secondAdvisorFa}{#1}}
\newcommand*{\secondAdvisorEn}[1]{\newcommand*{\@secondAdvisorEn}{#1}}
\newcommand*{\defendDateFa}[1]{\newcommand*{\@defendDateFa}{#1}}
\newcommand*{\defendDateEn}[1]{\newcommand*{\@defendDateEn}{#1}}
% ===========================================================
% تنظیمات صفحات ابتدایی پایان‌نامه:
\newcommand{\titleInfoFa}{%
	\newgeometry{%
		left=2.5cm,%
		right=3cm,%
		bottom=2.5cm,%
		top=3cm%
	}
	\pagenumbering{adadi}
	\pagestyle{empty}
	{\centering
		\vspace*{\fill}
		\includegraphics[width=.8\linewidth]{besm.png}
		
		\vfill\clearpage
		
		\includegraphics[width=2cm]{znu-logo-fa.pdf}
			
		\vspace{1.5cm}
		{\large\textbf{تعهدنامهٔ اصالت اثر}}
		
		\vspace{1cm}
		\begin{minipage}{.6\linewidth}
			این‌جانب
			\textbf{\@fullNameFa}
			متعهد می‌شوم كه مطالب مندرج در این
			\ifznuBscThesis پایان‌نامه \else\ifznuMscThesis پایان‌نامه \else رساله \fi\fi
			با عنوان
			«{\bfseries\@titleFa}»،
			حاصل كار پژوهشی این‌جانب است و به دستاوردهای پژوهشی دیگران كه
			در این پژوهش از آن‌ها استفاده شده است، مطابق مقررات، ارجاع و در فهرست
			منابع و مآخذ ذكر گردیده است.
			این
			\ifznuBscThesis پایان‌نامه \else\ifznuMscThesis پایان‌نامه \else رساله \fi\fi
			قبلاً برای احراز هیچ مدرک هم‌سطح یا بالاتر ارائه نشده است.
			در صورت اثبات تخلف (در هر زمان)، مدرک تحصیلی صادرشده توسط دانشگاه
			از اعتبار ساقط خواهد شد.
			كلیۀ حقوق مادی و معنوی این اثر متعلق به  دانشگاه زنجان می‌باشد.
		\end{minipage}
	
		\vspace{1cm}
		نام و نام‌خانوادگی دانشجو:
		\textbf{\@fullNameFa}\\
		امضا
		\clearpage
		
		\ifznuBscThesis\else\ifznuFinal
			\includegraphics[width=\linewidth, height=\textheight]{score}
			\clearpage
		\fi\fi
		
		\includegraphics[width=2cm]{znu-logo-fa.pdf}\\[1ex]
		\ifznuBscThesis{\titr
			دانشکدهٔ
			\@departmentFa\\
			گروه
			\@groupFa\\[3ex]}
			
			{\fontsize{13}{15}\selectfont\bfseries
			پایان‌نامهٔ کارشناسی
			\\[1ex]
			گرایش:
			\@fieldFa}
		\else
			دانشکدهٔ
			\@departmentFa\\
			{\fontsize{11}{13.2}\selectfont
				گروه
				\@groupFa\\[3ex]
				\ifznuMscThesis پایان‌نامه \else رساله \fi
				برای دریافت درجهٔ
				\ifznuMscThesis کارشناسی‌ارشد \else دکتری \fi\\
				در رشتهٔ
				\@majorFa{} \ifx\@fieldFa\undefined\else - \@fieldFa\fi
			}
		\fi
		
		\vfill
		{\fontsize{15}{18}\selectfont\titr\bfseries
			\begin{minipage}{0.8\linewidth}\centering
				\@titleFa
			\end{minipage}
		}
		
		\vfill
		تحقیق و نگارش\\
		\textbf{\@fullNameFa}
		
		\vfill
		\ifx\@secondSupervisorFa\undefined
			استاد راهنما\\
			\textbf{\@firstSupervisorFa}
		\else
			اساتید راهنما\\
			{\bfseries\@firstSupervisorFa\\\@secondSupervisorFa}
		\fi
		
		\vfill
		\ifx\@firstAdvisorFa\undefined\else
		\ifx\@secondAdvisorFa\undefined
			استاد مشاور\\
			\textbf{\@firstAdvisorFa}
		\else
			اساتید مشاور\\
			{\bfseries\@firstAdvisorFa\\\@secondAdvisorFa}
		\fi\fi
		
		\vfill
		\@defendDateFa\vskip0pt
		\clearpage
	}%
}
% ===========================================================
% تنظیمات صفحه عنوان انگلیسی:
\newcommand{\titleInfoEn}{%
	\newgeometry{%
		left=2.5cm,%
		right=3cm,%
		bottom=2.5cm,%
		top=3cm%
	}
	\pagestyle{empty}
	{\centering\latin
		\includegraphics[trim=0cm 7.3cm 0cm 0cm, clip,
			width=2cm]{znu-logo-fa.pdf}\\
		{\fontsize{13}{15.6}\selectfont University of Zanjan}\\
		Faculty of \@departmentEn\\
		{\fontsize{11}{13.2}\selectfont Department of \@groupEn}
		
		\vfill
		A thesis presented for the degree of\\
		\ifznuMscThesis M. Sc.\ \else Ph.D. \fi
		in \@majorEn{} \ifx\@fieldEn\undefined\else - \@fieldEn\fi
		
		\vfill
		{\fontsize{18}{21.6}\selectfont\bfseries
			\begin{minipage}{0.8\linewidth}\centering
				\@titleEn
			\end{minipage}
		}
		
		\vfill
		{\fontsize{13}{15.6}\selectfont By}\\
		{\fontsize{14}{16.8}\selectfont\textbf{\@fullNameEn}}
		
		\vfill
		\ifx\@secondSupervisorEn\undefined
			{\fontsize{13}{15.6}\selectfont Supervisor}\\
			{\fontsize{14}{16.8}\selectfont\textbf{\@firstSupervisorEn}}
		\else
			{\fontsize{13}{15.6}\selectfont Supervisors}\\
			{\fontsize{14}{16.8}\selectfont
				\bfseries\@firstSupervisorEn\\\@secondSupervisorEn
			}%
		\fi
		
		\vfill
		\ifx\@firstAdvisorEn\undefined\else
		\ifx\@secondAdvisorEn\undefined
			{\fontsize{13}{15.6}\selectfont Advisor}\\
			{\fontsize{14}{16.8}\selectfont\textbf{\@firstAdvisorEn}}
		\else
			{\fontsize{13}{15.6}\selectfont Advisors}\\
			{\fontsize{14}{16.8}\selectfont
				\bfseries\@firstAdvisorEn\\\@secondAdvisorEn
			}%
		\fi\fi
		
		\vfill
		\@defendDateEn
		
		\ifznuFinal
			\clearpage
			\includepdf[width=\textwidth, height=\textheight]{pdfReceipt}
		\fi
	}
}
% ===========================================================
% تعریف دستور علائم:
\newcommand{\symb}[2]{%
	\@ifnextchar\symb%{}{}
	{\noindent\parbox{.25\linewidth}{#1}\hspace{.05\linewidth}%
		\parbox{.7\linewidth}{#2}\\[1ex]}%
	{\noindent\parbox{.25\linewidth}{#1}\hspace{.05\linewidth}%
		\parbox{.7\linewidth}{#2}}%
}
% ===========================================================
% تغییر عمق بخش‌ها و فهرست مطالب:
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}
% ===========================================================
% تورفتگی پاراگراف‌ها:
\setlength{\parindent}{0.5cm}
\setlength{\parskip}{1.1ex plus .2ex minus .1ex}
% ===========================================================
% دوستونه کردن نمایه:
\ifznuUseIndex
\AfterPreamble{%
	\renewenvironment{theindex}
	{\if@twocolumn
			\@restonecolfalse
		\else
			\@restonecoltrue
		\fi
		\setlength{\columnseprule}{0.4pt}
%		\setlength{\columnsep}{10pt}
		\begin{multicols}{2}[\cleardoublepage
			\phantomsection
			\addcontentsline{toc}{chapter}{نمایه}
			\chapter*{\indexname}]		%Adjust the 2 for more columns
			\markboth{}{\MakeUppercase\indexname}%
			\thispagestyle{empty}
			\setlength{\parindent}{0pt}
			\setlength{\parskip}{0pt plus 0.3pt}
			\relax
			\RenewCommandCopy{\item}{\@idxitem}}%
		{\end{multicols}\if@restonecol\onecolumn\else\clearpage\fi
	}%
}\fi
% ===========================================================
% تنظیم سربرگ فهرست‌ها، منابع:
\newcommand{\chngNames}{%
	\renewcommand{\contentsname}{فهرست مطالب}%
	\renewcommand{\listtablename}{فهرست جدول‌ها}%
	\renewcommand{\listfigurename}{فهرست شکل‌ها}%
	\renewcommand{\bibname}{منابع}%
	\renewcommand{\listalgorithmname}{فهرست الگوریتم‌ها}%
}
\AtBeginDocument{%
	\chngNames
	\addtocontents{toc}{\protect\markboth{}{\contentsname}%
		\protect\thispagestyle{plain}}
	\addtocontents{lot}{\protect\markboth{}{\listtablename}%
		\protect\thispagestyle{plain}}
	\addtocontents{lof}{\protect\markboth{}{\listfigurename}%
		\protect\thispagestyle{plain}}
	\addtocontents{equ}{\protect\markboth{}{\listequationsname}%
		\protect\thispagestyle{plain}}
	\ifznuUseGlossaries
		\renewcommand{\glossarysection}[2][\theglstoctitle]{%
			\def\theglstoctitle{#2}%
			\chapter*{#2}%
			\phantomsection
			\addcontentsline{toc}{chapter}{#1}%
			\markboth{}{#1}%
		}%
	\fi
	\addtocontents{loc}{\protect\markboth{}{\listcodename}%
		\protect\thispagestyle{plain}}
	\addtocontents{lod}{\protect\markboth{}{\listdiagname}%
		\protect\thispagestyle{plain}}
	\addtocontents{loa}{\protect\markboth{}{\listalgorithmname}%
		\protect\thispagestyle{plain}}
}
\pretocmd{\bibliography}{%
	\pagestyle{refpage}%
}{}{}
\apptocmd{\bibliography}{%
	\markboth{\bibname}{}%
}{}{}
% ===========================================================
% تبدیل حروف فارسی:
\AfterPreamble{%
	\bidi@patchcmd{\@harfi}{ه}{ﻫ}
		{\typeout{Succeeded in changing `ه` into `ﻫ`}}
		{\typeout{Failed in changing `ه` into `ﻫ`}}
	\bidi@patchcmd{\@harfi}{آ}{الف}
		{\typeout{Succeeded in changing `آ` into `الف`}}
		{\typeout{Failed in changing `آ` into `الف`}}
	\bidi@patchcmd{\@abjad}{ه}{ﻫ}
		{\typeout{Succeeded in changing `ه` into `ﻫ`}}
		{\typeout{Failed in changing `ه` into `ﻫ`}}
	\bidi@patchcmd{\@abjad}{آ}{الف}
		{\typeout{Succeeded in changing `آ` into `الف`}}
		{\typeout{Failed in changing `آ` into `الف`}}
	\bidi@patchcmd{\@Abjad}{ه}{ﻫ}
		{\typeout{Succeeded in changing `ه` into `ﻫ`}}
		{\typeout{Failed in changing `ه` into `ﻫ`}}
	\bidi@patchcmd{\@Abjad}{آ}{الف}
		{\typeout{Succeeded in changing `آ` into `الف`}}
		{\typeout{Failed in changing `آ` into `الف`}}
	\bidi@patchcmd{\@alph}{ه}{ﻫ}
		{\typeout{Succeeded in changing `ه` into `ﻫ`}}
		{\typeout{Failed in changing `ه` into `ﻫ`}}
	\bidi@patchcmd{\@alph}{آ}{الف}
		{\typeout{Succeeded in changing `آ` into `الف`}}
		{\typeout{Failed in changing `آ` into `الف`}}
	\bidi@patchcmd{\abjadSingle}{ه}{ﻫ}
		{\typeout{Succeeded in changing `ه` into `ﻫ`}}
		{\typeout{Failed in changing `ه` into `ﻫ`}}
% ===========================================================
% پرکردن صفحه تا انتها:
	\flushbottom
% ===========================================================
% اضافه‌کردن برخی فهرست‌ها به فهرست مطالب:
	\pretocmd{\listofmyequations}{%
		\phantomsection
		\addcontentsline{toc}{chapter}{\listequationsname}
	}{}{}
	\pretocmd{\listofcodes}{%
		\phantomsection
		\addcontentsline{toc}{chapter}{\listcodename}
	}{}{}
	\pretocmd{\listofdiags}{%
		\phantomsection
		\addcontentsline{toc}{chapter}{\listdiagname}
	}{}{}
	\pretocmd{\listofalgorithms}{%
		\phantomsection
		\addcontentsline{toc}{chapter}{\listalgorithmname}
	}{}{}
% تغییر فاصله خطوط محیط latin:
	\AtBeginEnvironment{latin}{\vskip0pt\setstretch{1.1}}
	\AtBeginEnvironment{latin*}{\vskip0pt\setstretch{1.1}}
% تغییر نام autoref:
	\renewcommand{\sectionautorefname}{بخش}
	\renewcommand{\subsectionautorefname}{زیربخش}
	\renewcommand{\appendixautorefname}{\appendixname}
}
% ===========================================================
% فاصلهٔ خطوط:
\setstretch{1.6}
% ===========================================================
% تغییر italic به slanted:
\AtBeginDocument{\RenewCommandCopy{\itshape}{\slshape}}
% ===========================================================
% تغییر فاصلهٔ خطوط محیط cases و ارتفاع زیاد سلول‌های array:
\AfterPreamble{%
	\bidi@patchcmd{\env@cases}{1.2}{1}{}{}
	\everydisplay\expandafter{%
		\the\everydisplay
		\addtolength{\extrarowheight}{-3pt}%
	}
}
% ===========================================================
% برخی تنظیمات فاصله خطوط و استایل صفحه:
\newcommand{\setTOC}{%
	\restoregeometry
	\pagenumbering{abjad}%
	\renewcommand{\thepage}{\abjadMult{\value{page}}}%
	\pagestyle{fancy}%
	\chngNames
}
% ===========================================================
\newcommand{\setChapters}{%
	\setstretch{1.8}%
	\pagenumbering{arabic}%
% حذف شماره صفحه از اول فصل‌ها:
	\renewcommand{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi
		\thispagestyle{empty}% original style: plain
		\global\@topnum\z@
		\@afterindentfalse
		\secdef\@chapter\@schapter
	}%
}
% ===========================================================

\newcommand{\setLatinAbstract}{%
	\clearpage
	\setstretch{1}%
	\pagestyle{empty}%
}