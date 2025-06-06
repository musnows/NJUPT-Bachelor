\ProvidesClass{njupthesis}

% 正文大小 小四号 12pt 默认为宋体
\LoadClass[12pt, a4paper, openany, twoside]{book}

\RequirePackage{ifxetex}
\RequireXeTeX

\RequirePackage[usenames,dvipsnames,svgnames,table,xcdraw]{xcolor}
\RequirePackage{graphicx}
% 定制标题格式的包 五号
\RequirePackage[font={stretch=1.25, small}, labelsep=none, skip=0pt]{caption}

%连字符设置
\hyphenpenalty=5000
\tolerance=1000

\RequirePackage{tabularx} % 表格与页面等宽需要
\RequirePackage{array}
\RequirePackage{setspace}
\RequirePackage{multirow}
\RequirePackage[tbtags]{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{lmodern}
\RequirePackage{mathspec}
\RequirePackage{fontspec}
\RequirePackage{bm}

\RequirePackage{xeCJK}
\RequirePackage{ifplatform}

% 各个系统下字体的引入
\ifwindows
  \setallmainfonts{Times New Roman}
  \setCJKmainfont[AutoFakeBold=true]{SimSun}
  \newCJKfontfamily{\heiti}{SimHei}
  \newCJKfontfamily{\kaiti}{KaiTi}
\else
	\ifmacosx
	  \setallmainfonts{Times New Roman}
	  \setCJKmainfont[AutoFakeBold=true]{SimSun}
	  \newCJKfontfamily{\heiti}{SimHei}
	  \newCJKfontfamily{\kaiti}{KaiTi}
	\else
	  \setCJKmainfont[AutoFakeBold=true]{SimSun}
	  \newCJKfontfamily{\heiti}{SimHei}
	  \newCJKfontfamily{\kaiti}{KaiTi}
	  \setallmainfonts[
	    BoldFont=Times New Roman Bold,
	    ItalicFont=Times New Roman Italic,
	    BoldItalicFont=Times New Roman Bold Italic,
	  ]{Times New Roman}
	\fi
\fi

\RequirePackage{zhnumber}
\RequirePackage{pifont}

\RequirePackage[hyphens]{url}
\RequirePackage[hyperfootnotes=false,
    bookmarksnumbered,
    bookmarksdepth=4
]{hyperref}

% 超链接设置
\hypersetup{
  colorlinks=true,
  citecolor=black,
  linkcolor=black,
  urlcolor=black
}


\RequirePackage{indentfirst}
\RequirePackage{calc}
\RequirePackage{float}
\RequirePackage{fancyvrb}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}
% \RequirePackage{cite}
\RequirePackage[normalem]{ulem}
\RequirePackage{enumitem}
\RequirePackage{algorithm2e}
\RequirePackage{etoolbox}
\RequirePackage{newfloat}
\RequirePackage[nottoc]{tocbibind}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{everypage}
\RequirePackage{ifoddpage}
\RequirePackage{booktabs}
% 使用gbt7714
\usepackage{natbib}
\usepackage[sort&compress]{gbt7714}

% 这是啥？？？
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}

\let\algorithm\relax
\let\endalgorithm\relax
\expandafter\let\csname algorithm*\endcsname\relax
\expandafter\let\csname endalgorithm*\endcsname\relax
\let\listofalgorithms\relax

% Define the new algorithm environment
\DeclareFloatingEnvironment{algorithm}

\makeatletter
\renewcommand{\@endalgoln}{\@endalgocfline\hfill\strut\par}
\renewcommand{\;}{\ifmmode
  \@mathsemicolon
\else
  \@endalgoln
\fi
}

% Definition for the style ruled
% First add the rules enclosing the caption
\DeclareCaptionFormat{algrule}{%
  {\@hangfrom{#1#2}%
     \doublespacing
     \small
     \advance\caption@parindent\hangindent
     \advance\caption@hangindent\hangindent
     \caption@@par#3\par}%
}
\makeatother

% Apply the new format to the algorithm environment
\captionsetup[algorithm]{format=algrule}

\renewcommand{\algorithmname}{算法}
\renewcommand{\thealgorithm}{\arabic{chapter}.\arabic{algorithm}}
% 算法题注设置
\captionsetup[algorithm]{aboveskip=6pt}
\AtBeginEnvironment{algorithm}{\vspace{6pt}}

% 设置插入图片路径
\graphicspath{{./pic/}}

\RequirePackage[titles, subfigure]{tocloft}
\RequirePackage{subfigure}


\urlstyle{rm}
\raggedbottom

% 更改为对应部分的中文名
\renewcommand{\contentsname}{目\chinesespace\chinesespace 录}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
\renewcommand{\bibname}{参考文献}

% 页边距设置
\RequirePackage[a4paper,
  left=3cm, right=3cm, top=2cm, bottom=3cm,
  bindingoffset=0cm]{geometry}

% 风格
\pagestyle{fancy}

% 页眉与正文的距离
\setlength{\topskip}{0pt}

% 参考文献间距设置
\setlength{\bibsep}{0pt}

% 页眉页脚设置 *****要求页眉1.5cm，页脚1.75cm
\setlength{\headheight}{1.5cm}
\setlength{\footskip}{1.25cm}
\setlength{\headsep}{6pt}

% 页眉与正文之间的水平线粗细
\renewcommand{\headrulewidth}{1.0pt}

% 行距倍数 *****要求为1.25倍行距*****
\linespread{1.35} % 需要设置成1.35才和docx上的1.25倍行距对应（macos上测试，windows未测试）

% 设置段落首行缩进
% 12pt 是小四号，所以这里24pt=12*2正好是两个中文字符
\setlength\parindent{24pt}
\setlength\parskip{0pt}

% 公式格式设定
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}

% 图标题和表格标题格式设定 *****要求章节编号+序号******
\renewcommand {\thetable} {\arabic{chapter}.\arabic{table}}
\renewcommand {\thefigure} {\arabic{chapter}.\arabic{figure}}

% 图、表标题格式设置
\captionsetup{format=hang}
\DeclareCaptionLabelSeparator{custom}{\chinesespace} % 2025模板修改，图序号和图描述之间只有一个全角空格
\captionsetup{width=\textwidth - 42pt,labelsep=custom}
% 图注下方空行
\captionsetup[figure]{aboveskip=0pt,belowskip=6pt}
\captionsetup[table]{aboveskip=0pt,belowskip=0pt} % 表头是在表格上方的，所以不需要额外空隙
% 设置表格下方的空隙（与下方空一行）
\AtEndEnvironment{table}{\vspace{6pt}}

\setlength{\extrarowheight}{5pt}
\setlength{\subfigcapskip}{0pt}

% 文中浮动顶端与底端所留的距离（默认间距，图表公式都会采用这个间距）
\setlength{\intextsep}{4pt}

% 图标题居中设置
\makeatletter
\AtBeginEnvironment{figure}{
  \def\@floatboxreset{\centering}
}
\makeatother

% 表格标题居中设置
\makeatletter
\AtBeginEnvironment{table}{
  \def\@floatboxreset{\centering}
}
\makeatother

% 表格中的字体小一号（五号）
\AtBeginEnvironment{tabular}{\small}
\AtBeginEnvironment{tabularx}{\small}

% 新增一个居中的可伸缩列，命名为Y，表格与页面等宽需要使用这个Y列
\newcolumntype{Y}{>{\centering\arraybackslash}X}

% 子图图注设置
\makeatletter
\renewcommand{\p@subfigure}{\arabic{chapter}-\arabic{figure}}
\makeatother

% 中文符号定义
\newcommand{\chinesecolon}{\char"FF1A}
\newcommand{\chinesespace}{\char"3000}
\newcommand{\chineseperiod}{\char"3002}
\newcommand{\chinesequestion}{\char"FF1F}
\newcommand{\chineseexclamation}{\char"FF01}
\newcommand{\chinesecomma}{\char"FF0C}
\newcommand{\chinesesemicolon}{\char"FF1B}
\newcommand{\chineseleftparenthesis}{\char"FF08}
\newcommand{\chineserightparenthesis}{\char"FF09}

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}


% 章标题格式设置
\renewcommand\thechapter{第\zhnumber{\arabic{chapter}}章}
\renewcommand\thesection{\arabic{chapter}.\arabic{section}}

% 各级标题的字体字号设置
% 居中小三号黑体 15pt
\titleformat{\chapter}[block]
  {\centering\fontsize{15pt}{15pt}\selectfont\heiti\thispagestyle{fancy}}
  {\thechapter}{30pt}{}

% 四号黑体 14pt
\titleformat{\section}[block]
  {\fontsize{14pt}{14pt}\selectfont\heiti}
  {\thesection}{4pt}{}

% 四号黑体 14pt
\titleformat{\subsection}[block]
  {\fontsize{14pt}{14pt}\selectfont\heiti}
  {\thesubsection}{4pt}{}

% 小四号黑体 12pt（不推荐，要求中禁止使用）
\titleformat{\subsubsection}[block]
  {\fontsize{12pt}{12pt}\selectfont\heiti}
  {\thesubsubsection}{4pt}{}

% 下面的命令用于调节标题与左，上，下文，段落之间间距
\titlespacing{\chapter}{0pt}{6pt}{6pt}
\titlespacing{\section}{0pt}{6pt}{6pt}
\titlespacing{\subsection}{0pt}{6pt}{6pt}
\titlespacing{\subsubsection}{0pt}{6pt}{6pt}

\RequirePackage[hang, perpage]{footmisc}

\addtolength{\footnotesep}{0pt}
\setlength{\footnotemargin}{1.5pt}

\renewcommand{\footnotesize}{\fontsize{9pt}{10.8pt}\selectfont}
\renewcommand{\small}{\fontsize{10.5pt}{12.6pt}\selectfont}
\renewcommand\footnotelayout{\fontsize{9}{11.7}\selectfont}

\renewcommand{\thefootnote}{\ifcase\value{footnote}\or\ding{172}\or
\ding{173}\or\ding{174}\or\ding{175}\or\ding{176}\or\ding{177}\or
\ding{178}\or\ding{179}\or\ding{180\or\ding{181}}\fi}


\renewcommand{\footnoterule}{\vfill\noindent\vspace{0.9mm}\hspace{27pt}\rule{5.05cm}{0.02cm}\vspace*{2.6pt}}

\makeatletter
\def\@makefntext #1{
  \ifFN@hangfoot
      \bgroup \setbox \@tempboxa \hbox {
          \ifdim
        \footnotemargin >0pt \hb@xt@
                \footnotemargin {\hbox { \normalfont \@thefnmark}\hss }
            \else
              \hbox { \normalfont \@thefnmark}
      \fi
    }
        \leftmargin \wd \@tempboxa
        \rightmargin \z@ \linewidth \columnwidth
          \advance \linewidth -\leftmargin\parshape \@ne
    \leftmargin \linewidth \footnotesize \@setpar {{\@@par }}
    \leavevmode \llap {\box \@tempboxa }\parskip
        \hangfootparskip \relax \parindent
    \hangfootparindent \relax
        \else
          \parindent 1em \noindent
            \ifdim
                \footnotemargin >\z@ \hb@xt@
                \footnotemargin {\hss \hbox { \normalfont \@thefnmark} }
            \else
        \ifdim \footnotemargin =\z@
                    \llap {\hbox { \normalfont \@thefnmark} }
                \else
          \llap {\hb@xt@ -\footnotemargin {\hbox { \normalfont \@thefnmark} \hss }}
        \fi
            \fi
    \fi
        \footnotelayout #1\ifFN@hangfoot \par \egroup
  \fi
}
\makeatother

\newcounter{pseudopage}
\setcounter{pseudopage}{0}
\AddEverypageHook{\stepcounter{pseudopage}}

% 空页宏定义
\newcommand\blankpage{%
  \newpage
  \null
  \thispagestyle{empty}%
  \addtocounter{pseudopage}{-1}%
  \newpage
}

% 中文摘要
\newenvironment{chineseabstract}{
    \pdfbookmark{摘要}{chineseabstract}
    \chapter*{\fontsize{16pt}{16pt}\selectfont{摘\chinesespace\chinesespace 要}}
    \thispagestyle{empty}
    \vspace{0.6cm}
}{
  \clearpage
}

% 中文关键字
\newcommand{\chinesekeyword}[1]{
  \vspace{\baselineskip}
  \noindent
    \begin{minipage}[t]{48pt}
      \noindent{\heiti{关键词\chinesecolon }}
    \end{minipage}
    \begin{minipage}[t]{0.8\linewidth - 48pt}
      #1
    \end{minipage}
}

% 英文摘要
\newenvironment{englishabstract}{
    \pdfbookmark{ABSTRACT}{englishabstract}
    \chapter*{\fontsize{16pt}{16pt}\selectfont{\bfseries ABSTRACT}}
    \thispagestyle{empty}
    \vspace{0.6cm}
}{
  \clearpage
}

% 英文关键字
\newcommand{\englishkeyword}[1]{
  \vspace{\baselineskip}
  \noindent\begin{minipage}[t]{2.1cm}
      \noindent\textbf{Key words:}
    \end{minipage}
    \begin{minipage}[t]{
      0.8\linewidth - 2.1cm}
        #1
    \end{minipage}
}

\AddEverypageHook{\addtocontents{toc}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
  \protect\thispagestyle{empty}
}}

\AddEverypageHook{\addtocontents{lof}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
}}

\AddEverypageHook{\addtocontents{lot}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
}}

\tocloftpagestyle{fancy}
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand\cftchapleader{\cftdotfill{\cftdotsep}}

\renewcommand{\cftdotsep}{0.4}

\setlength{\cftbeforetoctitleskip}{0pt}
\setlength{\cftaftertoctitleskip}{18pt}
\setlength{\cftbeforechapskip}{5pt}

\addtolength{\cftchapnumwidth}{25pt}

%标题头字体设置
\cftsetindents{chapter}{0pt}{60pt}
\cftsetindents{section}{21pt}{22pt}
\cftsetindents{subsection}{44pt}{31pt}
\cftsetindents{subsubsection}{76pt}{41pt}

% 三号黑体 16pt
\renewcommand{\cfttoctitlefont}{\fontsize{16pt}{16pt}\selectfont\heiti}
\renewcommand{\cftchapfont}{\fontsize{14pt}{14pt}}

% 首页论文信息
\newcommand{\chinesedegreename}{本科}
\newcommand{\chinesebooktitle}{本科生毕业设计（论文）}
\newcommand{\englishbooktitle}{Bachelor Thesis}
\newcommand{\thetitle}{}
\newcommand{\theauthor}{}
\newcommand{\theschool}{}
\newcommand{\themajor}{}
\newcommand{\theadvisor}{}
\newcommand{\thestudentclass}{}
\newcommand{\thestudentid}{}
\newcommand{\thegraduateyear}{}
\newcommand{\thebegindate}{}
\newcommand{\thefinishdate}{}
\newcommand{\thecreatedate}{}
\newcommand{\theauthorsign}{}
\newcommand{\theadvisorsign}{}

\renewcommand{\title}[1]{
  \renewcommand{\thetitle}{#1}
}

\renewcommand{\author}[1]{
  \renewcommand{\theauthor}{#1}
}

\newcommand{\major}[1]{
  \renewcommand{\themajor}{#1}
}

\newcommand{\school}[1]{
  \renewcommand{\theschool}{#1}
}

\newcommand{\advisor}[1]{
  \renewcommand{\theadvisor}{#1}
}

\newcommand{\studentclass}[1]{
  \renewcommand{\thestudentclass}{
    \ifstrempty{#1}
      {}% 如果为空，什么都不加
      {#1\quad}% 如果不为空，班级号加上\quad
  }
}

\newcommand{\studentid}[1]{
  \renewcommand{\thestudentid}{#1}
}

\newcommand{\graduateyear}[1]{
  \renewcommand{\thegraduateyear}{#1}
}

\newcommand{\begindate}[1]{
  \renewcommand{\thebegindate}{#1}
}

\newcommand{\finishdate}[1]{
  \renewcommand{\thefinishdate}{#1}
}

% 原创性声明日期
\newcommand{\createdate}[3]{
  \renewcommand{\thecreatedate}{
    \quad#1\quad 年 \quad#2\quad 月\quad#3\quad 日
  }
}

% 原创性声明作者签名图片
\newcommand{\authorsign}[1]{
  \renewcommand{\theauthorsign}{
    \ifstrempty{#1}{ % 检查 #1 是否为空
      % 如果为空，不添加任何内容
    }{
      \raisebox{-0.5cm}{\includegraphics[height=1.5cm]{#1}} % 不为空，添加作者签名图片
    }
  }
}

% 封面导师签名图片
\newcommand{\advisorsign}[1]{
  \renewcommand{\theadvisorsign}{
    \ifstrempty{#1}{ % 检查 #1 是否为空
      \theadvisor % 如果为空，直接使用导师名称文字
    }{
      \includegraphics[height=1.2cm]{#1} % 不为空，添加导师签名图片
    }
  }
}


\DeclareOption{bachelor}{
  \renewcommand{\chinesedegreename}{本科}
  \renewcommand{\chinesebooktitle}{本科生毕业设计（论文）}
  \renewcommand{\englishbooktitle}{Bachelor Thesis}
}

% 制作封面
\newcommand{\makecover}{
\thispagestyle{empty}
\setlength{\extrarowheight}{36pt}
\begin{center}
  \fontsize{15pt}{15pt}\selectfont{\heiti ~\\}
  \fontsize{36pt}{36pt}\selectfont{\heiti ~\\南京邮电大学 \\ 毕{\ }业{\ }设{\ }计（论{\ }文）\\}
  \vspace{1cm} % 缩小此处长度（2025新模板）
  
  \begingroup % 使用group括起来，单独设置行距
  \linespread{1.25} % 封面信息部分依旧保持1.25 latex行距，否则和模板对不上
  \begin{tabular}{>{\fontsize{16pt}{16pt}\kaiti}l
      >{\centering\arraybackslash\fontsize{15pt}{15pt}}
      p{11.53cm}}
    题\chinesespace\chinesespace 目{}{} & \thetitle \\
    \cline{2-2}
    专\chinesespace\chinesespace 业{}{} & \themajor \\
    \cline{2-2}
    学生姓名{}{} & \theadvisorsign  \\
    \cline{2-2}
    班级学号{}{} & {\large \thestudentclass\thestudentid} \\
    \cline{2-2}
    指导老师{}{} & \theadvisor \\
    \cline{2-2}
    指导单位{}{} & \theschool \\
    \cline{2-2}
  \end{tabular}
  \endgroup

\vspace{4.5cm} % 缩小此处长度（2025新模板）

\fontsize{16pt}{16pt}\selectfont{\kaiti 日期：\quad \thebegindate 至\hspace{.5pc} \thefinishdate \\}
\end{center}

\newpage
\thispagestyle{empty}

\noindent

\begin{center}
  \fontsize{16pt}{16pt}\selectfont{\heiti
    毕业设计（论文）原创性声明
  } \\[32bp]
\end{center}

\begin{spacing}{2.0}
本人郑重声明：所提交的毕业设计（论文），是本人在导师指导下，独立进行研究工作所取得的成果。
除文中已注明引用的内容外，本毕业设计（论文）不包含任何其他个人或集体已经发表或撰写过的作品成果。
对本研究做出过重要贡献的个人和集体，均已在文中以明确方式标明并表示了谢意。
\vspace{3cm}

\hspace*{7cm} 论文作者签名：\theauthorsign % 插入签名图片

\hspace*{7cm} 日期：\thecreatedate
\end{spacing}


\newpage
\setcounter{page}{0}
\setcounter{pseudopage}{0}
\setlength{\extrarowheight}{5pt}
}

\ProcessOptions\relax

% 页眉页脚设置
\newcommand{\standardhead}{
  \fancyhf{}
  \fancyhead[CE, CO]{\fontsize{10.5pt}{10.5pt}\selectfont 南京邮电大学\thegraduateyear 届本科生毕业设计（论文）\\}
  \fancyfoot[CE, CO]{\fontsize{9pt}{9pt}\selectfont-\quad\thepage\quad-}
}

% 目录页设置
\newcommand{\thesistableofcontents}{
  \setlength{\cftchapindent}{0pt} % 设置章标题的缩进
  \setlength{\cftsecindent}{12pt}  % 设置节标题的缩进为1个汉字字符
  \setlength{\cftsubsecindent}{24pt} % 设置小节标题的缩进2个汉字字符


  % 设置目录项目之间的距离为1.25倍行距
  \setlength{\cftbeforechapskip}{3.5pt}
  \setlength{\cftbeforesecskip}{3pt}
  \setlength{\cftbeforesubsecskip}{3pt}
  % 设置章节后两个半角空格（共4个汉字字符距离）
  \setlength{\cftchapnumwidth}{56pt}

  \pdfbookmark{目录}{toc}
  \addtocontents{toc}{\protect\vspace{0.6cm}} % 目录两个字下方的空行
  \tableofcontents
  \thispagestyle{empty}
}

% 章节名重构
%\renewcommand{\chaptermark}[1]{\markboth{第\zhnumber{\arabic{chapter}}章 \hspace{2}#1}{}}

%\fontsize{16pt}{16pt}\selectfont{\heiti

% 结束语
\newcommand{\thesisconclusion}{
	\renewcommand\thesection{\arabic{section}}
	\addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
	\setcounter{section}{0}
	\chapter*{\fontsize{16pt}{16pt}\selectfont{结束语}}
	\addcontentsline{toc}{chapter}{结束语}
	\markboth{结束语}{结束语}
	\thispagestyle{fancy}
  \vspace{0.6cm}
}

% 加载参考文献
\newcommand{\thesisreference}{
	\titleformat{\chapter}[block]
	{\fontsize{16pt}{16pt}\selectfont\heiti\thispagestyle{fancy}}
	{\thechapter}{30pt}{}
	\titlespacing{\chapter}{0pt}{0pt}{10pt} % 最后一个设置“参考文献”和参考文献列表之间的空隙
	
	\fontsize{10.5pt}{10.5pt}\selectfont{
		\bibliographystyle{gbt7714-numerical}
		\bibliography{reference}
	}

	\titleformat{\chapter}[block]
	{\centering\fontsize{15pt}{15pt}\selectfont\heiti\thispagestyle{fancy}}
	{\thechapter}{30pt}{}
	\titlespacing{\chapter}{0pt}{0pt}{15pt}
	
}

% 致谢
\newcommand{\thesisacknowledgement}{
  \renewcommand\thesection{\arabic{section}}
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
  \setcounter{section}{0}
  \chapter*{\fontsize{16pt}{16pt}\selectfont{致\chinesespace\chinesespace 谢}}
  \addcontentsline{toc}{chapter}{致谢}
  \markboth{致谢}{致谢}
  \thispagestyle{fancy}
  \vspace{0.6cm}
}

\newcommand{\thesischapterexordium}{
  \newpage
  \addtocontents{toc}{\protect\setcounter{tocdepth}{2}}
  \standardhead
  \pagenumbering{arabic}
  \setcounter{page}{1}
}

% 附录
% 定义一个计数器用于附录编号（实现自动ABC编号）
\newcounter{appendixcounter}
\setcounter{appendixcounter}{0}

% 定义附录环境
\newcommand{\thesisappendix}{
    % 增加附录计数器
    \stepcounter{appendixcounter}
    % 重置章节编号
    \setcounter{chapter}{0}
    \setcounter{section}{0}
    \setcounter{equation}{0}
    \setcounter{table}{0}
    \setcounter{figure}{0}
    % 重置章节编号格式
    \renewcommand{\theHchapter}{Appendix\Alph{appendixcounter}.\arabic{chapter}} % 超链接锚点唯一标识
    \renewcommand{\thechapter}{\Alph{appendixcounter}}
    \renewcommand{\thesection}{\thechapter.\arabic{section}}
    \renewcommand{\theequation}{\thechapter.\arabic{equation}}
    \renewcommand{\thetable}{\thechapter.\arabic{table}}
    \renewcommand{\thefigure}{\thechapter.\arabic{figure}}
    % 重置 listings 计数器
    \setcounter{lstlisting}{0}
    % 设置 listings 编号格式为 附录号.代码块编号
    \renewcommand{\thelstlisting}{\thechapter.\arabic{lstlisting}}
    % 设置章节标题格式
    \titleformat{\chapter}[block]
    {\fontsize{16pt}{16pt}\selectfont\heiti\thispagestyle{fancy}}
    {\thechapter}{30pt}{}
    \titlespacing{\chapter}{0pt}{0pt}{0pt}
    % 添加附录标题
    \chapter*{\raggedleft\fontsize{16pt}{16pt}\selectfont{附录\thechapter}}
    \thispagestyle{fancy}
    \markboth{附录\thechapter}{附录\thechapter}
    % 添加到PDF目录
    \phantomsection % 手动设置PDF大纲
    \addcontentsline{toc}{chapter}{附录\large{\thechapter}} % 手动添加附录X的PDF大纲
    % 附录和附录正文添加空行
    \vspace{0.5cm}
    % 附录正文格式设置
    \fontsize{12pt}{15pt}           % 小四号字体
    \setstretch{1.35}               % 1.25倍行距(设置成1.35才和docx的1.25一样)
}

% 定理推导等等翻译
\newtheoremstyle{dotless}{0pt}{0pt}{\normalfont}{24pt}{\heiti}{}{ }{}
\theoremstyle{dotless}
\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}[theorem]{公理}
\newtheorem{corollary}[theorem]{推论}
\newtheorem{lemma}[theorem]{引理}
\newtheorem{definition}[theorem]{定义}
\newtheorem{example}[theorem]{例子}
\newtheorem{proposition}[theorem]{命题}

% 定理公理编号格式
\renewcommand{\thetheorem}{\arabic{chapter}.\arabic{theorem}}
\renewcommand{\theaxiom}{\arabic{chapter}.\arabic{axiom}}
\renewcommand{\thecorollary}{\arabic{chapter}.\arabic{corollary}}
\renewcommand{\thelemma}{\arabic{chapter}.\arabic{lemma}}
\renewcommand{\thedefinition}{\arabic{chapter}.\arabic{definition}}
\renewcommand{\theexample}{\arabic{chapter}.\arabic{example}}
\renewcommand{\qedsymbol}{$\blacksquare$}
\renewcommand{\proofname}{证明}


\makeatletter
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}
  \normalfont
  \topsep0pt \partopsep0pt
  \trivlist
  \item[\hskip5\labelsep
        \heiti
    #1\@addpunct{:}]\ignorespaces
}{
  \popQED\endtrivlist\@endpefalse
}
\makeatother

%\newcommand{\citing}[1]{\textsuperscript{\cite{#1}}}
\setlist{noitemsep}
\setlist{nolistsep}

% 设置公式的上下间距
\AtBeginDocument{
  \setlength{\abovedisplayskip}{8pt}
  \setlength{\belowdisplayskip}{8pt}
}

% 导入代码块
\usepackage{listings}
\usepackage{xcolor}

% 自定义代码块样式
\lstset{
    numbers=left, % 显示行号
    numberstyle=\small, % 行号字体
    basicstyle=\small\ttfamily, % 等宽字体
    keywordstyle=\color{blue!70}, % 关键字颜色
    commentstyle=\color{red!50!green!50!blue!50}, % 注释颜色
    frame=single, % 添加普通边框
    rulesepcolor=\color{black}, % 边框颜色
    backgroundcolor =\color{yellow!10},    % 背景色：淡黄
    escapeinside=``, % 允许在代码块中使用 LaTeX 命令
    xleftmargin=1.5em, xrightmargin=0.5em, aboveskip=0em, % 设置代码块的边距
    framexleftmargin=0em, % 阴影框左边距
    breaklines=true, % 启用自动换行
    breakatwhitespace=true % 在空白处换行
}
\renewcommand{\lstlistingname}{Code} % 将标题从 Listing 改为 Code

% 在itemize和enumerate前后插入空行
\setlist[itemize]{after=\vspace{0.15cm},before=\vspace{0.15cm}}
\setlist[enumerate]{after=\vspace{0.15cm},before=\vspace{0.15cm}}


\endinput
