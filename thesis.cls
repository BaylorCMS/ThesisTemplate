% %%%%%%%%%%%%%%%%%%%%%%%%%
%
% Baylor University Thesis LaTeX Template
% Last Updated: July 2021
%
% %%%%%%%%%%%%%%%%%%%%%%%%%
%
% Authors
%
% Some code derived from an early template created by Jeff Donahoo (2000),
% with additional inspiration from a template by David Jack (2011);
% rewritten and simplified by Jonathan Drake (2013).
% Additional stuff by Alvin Jude (2014).
% Formatting updates by Kenneth Call, Kenichi Hatakeyama (2019).
% More edits by Caleb Smith and Jay Dittmann (2020, 2021).
%
% %%%%%%%%%%%%%%%%%%%%%%%%%

% ================== Changelog ================================
%
% Outdated: use git to track changes!
%
% Added \comment{} - simplifies multiline comments
% Fixed spaces after floats: images & tables
% -- NOTE:
%    This only works when floats are at to of page. There is no guarantee that inline images and tables
%    Will actually work. If anybody needs this, will need to be fixed
% final version changelog:
% Dedication: Moved to 3 inches from the top, removed title ("DEDICATION") from the top of the page
% Double spacing AFTER level 3 (\subsection) when text follows.
% Add period after level 5 (followed by 2 spaces)
% Added APPENDICES separator page
% =============================================================

\ProvidesClass{thesis}[2019/07/15]


% draft	draft heading, no graphics loaded, etc.
% short	front matter omitted
\newif\if@makeDraftThesis
\newif\if@makeShortThesis
\@makeDraftThesisfalse
\@makeShortThesisfalse
\DeclareOption{draft}{\@makeDraftThesistrue}
\DeclareOption{short}{\@makeShortThesistrue}
\ProcessOptions

% Load the parent class: report
\LoadClass[12pt,letterpaper]{report}
% ALVIN: Simplifies adding comments
%\newcommand{\comment}[1]{}


% We need both double and single spacing
\RequirePackage[nodisplayskipstretch]{setspace}

\SetSinglespace{0.951643}
\renewcommand{\onehalfspacing}{\setstretch{1.4274645}}
\renewcommand{\doublespacing}{\setstretch{1.903286}}

\newlength{\singlebaselineskip}
\singlespacing
\setlength{\singlebaselineskip}{\baselineskip}

\newlength{\onehalfbaselineskip}
\onehalfspacing
\setlength{\onehalfbaselineskip}{\baselineskip}

\newlength{\doublebaselineskip}
\doublespacing
\setlength{\doublebaselineskip}{\baselineskip}


\RequirePackage{float}
\RequirePackage{flafter}

\newlength{\intexttopsep}
\setlength{\intexttopsep}{0pt}
\def \@addtocurcol {%
   \@insertfalse
   \@setfloattypecounts
   \ifnum \@fpstype=8
   \else
     \ifnum \@fpstype=24
     \else
       \@flsettextmin
       \advance \@textmin \@textfloatsheight
       \@reqcolroom \@pageht
       \ifdim \@textmin>\@reqcolroom
         \@reqcolroom \@textmin
       \fi
       \advance \@reqcolroom \ht\@currbox
       \ifdim \@colroom>\@reqcolroom
         \@flsetnum \@colnum
         \ifnum \@colnum>\z@
           \@bitor\@currtype\@deferlist
          \@testwrongwidth\@currbox
           \if@test
           \else
             \@bitor\@currtype\@botlist
             \if@test
               \@addtobot
             \else
               \ifodd \count\@currbox
                 \advance \@reqcolroom \intexttopsep
                 \advance \@reqcolroom \intextsep
                 \ifdim \@colroom>\@reqcolroom
                   \global \advance \@colnum \m@ne
                   \global \advance \@textfloatsheight \ht\@currbox
                   \global \advance \@textfloatsheight \intexttopsep
                   \global \advance \@textfloatsheight 2\intextsep
                   \@cons \@midlist \@currbox
                   \if@nobreak
                     \nobreak
                     \@nobreakfalse
                     \everypar{}%
                   \else
                     \addpenalty \interlinepenalty
                   \fi
                   \vskip \intexttopsep
                   \vskip \intextsep
                   \box\@currbox
                   \penalty\interlinepenalty
                   \vskip\intextsep
                   \ifnum\outputpenalty <-\@Mii \vskip -\parskip\fi
                   \outputpenalty \z@
                   \@inserttrue
                 \fi
               \fi
               \if@insert
               \else
                 \@addtotoporbot
               \fi
             \fi
           \fi
         \fi
       \fi
     \fi
   \fi
   \if@insert
   \else
     \@resethfps
     \@cons\@deferlist\@currbox
   \fi
}%

\def\@float@HH#1[H{\@float@Hx{#1}[h}

% General document configuration
\setlength{\topmargin}{0.0in}
\setlength{\headheight}{0.0in}
\setlength{\headsep}{0.0in}
\setlength{\topskip}{8.568pt}
\setlength{\footskip}{0.4in}
\setlength{\textheight}{9.0in} % 1in margins
\setlength{\textwidth}{6.0in} % 1.25in margins
\setlength{\oddsidemargin}{0.25in} % 1.25in margin relative to 1in default
\setlength{\evensidemargin}{0.25in} % 1.25in margin relative to 1in default
\setlength{\parindent}{0.5in} % used in triplespace
\setlength{\labelsep}{0.5em}
\setlength{\labelwidth}{1.5em}
	
\setlength{\parskip}{0.0in}
\setlength{\topsep}{0.0in}
\setlength{\partopsep}{0.0in}


\onecolumn
\raggedbottom
\doublespacing

%\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{3}


% -----------------------------------------------
% TABLE FORMATING STUFF
% This is confusing because the caption is at the top.
%%%%%%% THERE HAS TO BE A BETTER WAY JIM
% aboveskip = distance between caption and float
% belowskip = distace between caption and text
% Set the caption label separator and spacing for all floats

%\renewenvironment{figure}[1][1]{\@float{figure}\vspace{1.5\baselineskip}}{\end@float}
%\renewenvironment{table}[1][1]{\@float{table}\vspace{1.5\baselineskip}}{\end@float}

\setlength{\abovecaptionskip}{0ex}
\setlength{\belowcaptionskip}{0ex}
\setlength{\intexttopsep}{\doublebaselineskip}
\setlength{\intextsep}{0.5\doublebaselineskip}
\setlength{\floatsep}{\doublebaselineskip}
\setlength{\textfloatsep}{\doublebaselineskip} % Vertical space for floats at the top of the page

\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{4}
\renewcommand{\topfraction}{0.75}
\renewcommand{\bottomfraction}{0.75}
\renewcommand{\textfraction}{0.25}
\renewcommand{\floatpagefraction}{0.5}

\RequirePackage{caption}
\captionsetup{labelsep=colon,font=singlespacing}
\captionsetup[figure]{aboveskip=\baselineskip, belowskip=0ex}
\captionsetup[table]{aboveskip=0ex, belowskip=\baselineskip}
\captionsetup[table]{justification=centering}

\RequirePackage[bottom,multiple]{footmisc}  %note that the "multiple" option doesn't work if hyperref is loaded later
\def\footnoterule{\kern-3\p@ \hrule \@width 2in \kern -8\p@} % the \hrule is .4pt high
\renewcommand{\multfootsep}{AA}
%\setlength{\footnotemargin}{em}
%\renewcommand{\hangfootparindent}{9em}

% First handle the case where a figure appears in the middle of a page, between text
%\setlength{\belowcaptionskip}{0ex}
%\setlength{\intextsep}{0ex}  % Vertical space above and below floats in the middle of the page, between text
	% Just right for space above figures (triplespace), but too much below figures, where there is already a natural doublespace
%\captionsetup[figure]{aboveskip=\baselineskip}		% This sets the space between the figure and caption
%\captionsetup[figure]{belowskip=-2\baselineskip}	% The -2 fixes the space below the figure


%\captionsetup[figure]{aboveskip=\baselineskip,belowskip=-2\baselineskip}
%\captionsetup[table]{belowskip=-0.1em, aboveskip=1em}

% because we set this which determines the distance between the table
% and the preeceeding / proceeding text, we HAVE to set the belowskip in the thing above to 0
% this is also applicable for the images and pictures. Fortunately the configuration
% for both are the same. If they're not, then we're in big barney
% -----------------------------------------------
%\setlength{\abovecaptionskip}{2em}

% Fix the ToC style for appendices
%\RequirePackage[titletoc]{appendix}
\RequirePackage{appendix}
\newcommand{\myappendixword}{APPENDIX}  %singular
\newcommand{\myappendicesword}{APPENDICES}   %plural
\newif\if@onlyoneappendix
\@onlyoneappendixfalse

% Reasonable appendix package settings when there is more than one appendix
\newcommand{\multipleappendices}
{
	\@onlyoneappendixfalse
	\renewcommand{\appendixname}{\normalsize\normalfont\myappendixword}   %the name used for each appendix title
	\appendixtocon
	\renewcommand{\appendixtocname}{\normalsize\normalfont\myappendicesword}   %this goes into the TOC for the separator page
	\appendixpageon
	\renewcommand{\appendixpagename}{\normalsize\normalfont\myappendicesword}  %this goes onto the blank separator page
}

% Reasonable appendix package settings when there is only one appendix
\newcommand{\oneappendix}
{
	\@onlyoneappendixtrue
	\renewcommand{\appendixname}{\normalsize\normalfont\myappendixword}   %the name used for each appendix title
	\appendixtocoff
	\appendixpageon
	\renewcommand{\appendixpagename}{\normalsize\normalfont\myappendixword}  %this goes onto the blank separator page
}

\multipleappendices

% Optional additional packages
\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage{chicago}
% ALVIN: Needs this
\RequirePackage{multirow}
\RequirePackage{hhline}
\RequirePackage{url} % for bibtex
\RequirePackage{newclude}
%\RequirePackage{breakcites}
\RequirePackage{tocloft}
\RequirePackage{everypage}
\RequirePackage{calc}

\brokenpenalty=10000	% Eliminates page breaks at hyphens
\clubpenalty=10000 		% Eliminates orphan lines
\widowpenalty=10000 	% Eliminates widowed lines


% Set the names of prologue pages
\newcommand*{\ToCname}{TABLE OF CONTENTS}
\newcommand*{\Acroname}{LIST OF ACRONYMS}
\newcommand*{\LoFname}{LIST OF FIGURES}
\newcommand*{\LoTname}{LIST OF TABLES}
\newcommand*{\acknowledgename}{ACKNOWLEDGMENTS}
\newcommand*{\dedicationname}{DEDICATION}
\renewcommand*{\chaptername}{CHAPTER}
\newcommand*{\bibliographyname}{BIBLIOGRAPHY}

% Convert to form expected by other packages
\renewcommand*{\bibname}{\normalsize\normalfont\bibliographyname}

% Heading format
\renewcommand*{\thechapter}{\arabic{chapter}}
\renewcommand*{\thesection}{\thechapter.\arabic{section}}
\renewcommand*{\thesubsection}{\thesection.\arabic{subsection}}
\renewcommand*{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}

% Enumerated list labels
\renewcommand*{\theenumi}{\arabic{enumi}}
\renewcommand*{\theenumii}{\alph{enumii}}
\renewcommand*{\theenumiii}{\roman{enumiii}}
\renewcommand*{\theenumiv}{\alph{enumiv}}
\renewcommand*{\labelenumi}{(\theenumi)}
\renewcommand*{\labelenumii}{(\theenumii)}
\renewcommand*{\labelenumiii}{(\theenumiii)}
\renewcommand*{\labelenumiv}{(\theenumiii.\theenumiv)}

% Itemized list labels
\renewcommand*{\labelitemi}{\textbullet}
\renewcommand*{\labelitemii}{\textasteriskcentered}
\renewcommand*{\labelitemiii}{\normalfont \bfseries \textendash}
\renewcommand*{\labelitemiv}{\textperiodcentered}

% Margins for lists
\setlength{\leftmargini}{3.5em}
\setlength{\leftmarginiii}{2.2em}
\setlength{\leftmarginiv}{2.2em}
\setlength{\leftmarginv}{2.2em}
\setlength{\leftmarginvi}{2.2em}
\setlength{\leftmargin}{\leftmargini}
\setlength{\labelwidth}{1.5em}

\AddEverypageHook{
	\addtocontents{toc}{\protect\cftsetpnumwidth{\widthof{\thepage}-.2em}}
	\addtocontents{lof}{\protect\cftsetpnumwidth{\widthof{\thepage}-.2em}}
	\addtocontents{lot}{\protect\cftsetpnumwidth{\widthof{\thepage}-.2em}}
}

\let\oldvspace\vspace
\newcommand{\topvspace}[1]
{
	\oldvspace{\parskip}
	\oldvspace{\baselineskip}
	\oldvspace*{#1}
	\oldvspace{-\parskip}
	\oldvspace{-\baselineskip}
}

\RequirePackage{acronym}
\renewcommand{\aclabelfont}{\normalfont}

\newcommand{\chapquote}[2]{ \begin{quotation} \singlespacing  \noindent \textrm{#1} \end{quotation} \begin{flushright} ---#2\end{flushright} }

% Macro that converts the given number to a corresponding number name
\newcommand{\arabicText}[1]
{
	\ifnum0<0#1 % Test for chapter number vs appendix letter
		\ifcase#1
			ZERO \or ONE \or TWO \or THREE \or FOUR \or
			FIVE \or SIX \or SEVEN \or EIGHT \or NINE \or TEN \or
			ELEVEN \or TWELVE \or THIRTEEN \or FOURTEEN \or
			FIFTEEN \or SIXTEEN \or SEVENTEEN \or EIGHTEEN \or
			NINETEEN \or TWENTY
		\fi
	\else
		\if@onlyoneappendix \relax \else #1 \fi    % Pass-through appendix letter when there is more than one appendix
	\fi
}

% Chapter command
%\renewcommand{\chapter}
%{
%	\if@openright\cleardoublepage\else\clearpage\fi % first page on right
%	\thispagestyle{plain}%
%	\global\@topnum\z@
%	\@afterindentfalse
%	\secdef\@chapter\@schapter
%}

% Chapter heading
\def\@chapter[#1]#2
{
	\setcounter{footnoteA}{0}  % the footnotes should start with 1 in each chapter

	\ifnum \c@secnumdepth >\m@ne
		\refstepcounter{chapter}
		\typeout{**************************}
		\typeout{\@chapapp\space\thechapter}
			\addcontentsline{toc}{chapter}{\protect\numberline{\@chapapp\space\arabicText{\thechapter}}#1}
                 \else
                 	\addcontentsline{toc}{chapter}{#1}
                 \fi
                 \chaptermark{#1}
                 %\addtocontents{lof}{\protect\addvspace{10\p@}}%
                 %\addtocontents{lot}{\protect\addvspace{10\p@}}%
		{
			\singlespacing
			\centering
			\topvspace{0.50in}
			\MakeUppercase{\@chapapp{}}\arabicText{\thechapter} \par
			\ \\
			#2 \par
			\ \\
		 }
		 \@afterheading
}

% Section headings
% \@startsection{<name>}{<level>}{<indent>}{<beforeskip>}{<afterskip>}{<style>}*[<altheading>]{<heading>}
\renewcommand{\section}
{%
	\@startsection{section}{1}{0pt}{1em}{0.001ex}%skip: 2 space before, 1 space after. adjusted to 0.001 so that it's virually none
	{\centering\normalfont\slshape\normalsize}
}
% IF there is content text immediately after level 3,
%   THEN distance between Level 3 and Content text = doublespace.
% IF there is level 4 header immediately after level 3,
%   THEN distance between Level 3 and Level 4 = triplespace.

\renewcommand{\subsection}[1]
{
	\@startsection{subsection}{2}{0pt}{0.001ex}{0.001ex}
	{\vspace{1em}\normalfont\slshape\normalsize}{#1}
}

\renewcommand{\subsubsection}[1]
{%
        \vspace{1em}
	\@startsection{subsubsection}{3}{\parindent}{0.001em}{-1em}%
	{\normalfont\slshape\normalsize}{#1\hspace{-3ex}}{.} %adds a period/fullstop/dot after the title
}

%% standardize itemize and enumerate spacing
\let\oldenumerate\enumerate
\renewcommand{\enumerate}{
  \oldenumerate
  \setlength{\itemsep}{1em}
  \setlength{\parskip}{-1em}
  \setlength{\parsep}{0pt}
}
%% standardize itemize and enumerate spacing
\let\olditemize\itemize
\renewcommand{\itemize}{
  \olditemize
  \setlength{\parsep}{-\baselineskip}
  \setlength{\itemsep}{1em}
  \setlength{\parskip}{-1em}

}

% removes extra space after the list (itemize). So it will be double space instead of triple
\let\@oldlistI\@listI
\renewcommand{\@listI}{
	\@oldlistI
	\topsep=0pt
}

% Internal boolean variables
\newcommand{\th@dedicationStash}{\relax}
\newcommand{\th@acknowledgementsStash}{\relax}
\newif\if@makeAcro
\newif\if@makeLoF
\newif\if@makeLoT
\newif\if@makeDedication
\newif\if@makeAcknowledgements
\newif\if@makeCopyright
\newif\if@makeCosupervisor
\newif\if@makeReaderThree
\newif\if@makeReaderFour
\newif\if@makeReaderFive

% Initial values for boolean variables
\@makeAcrofalse
\@makeLoFfalse
\@makeLoTfalse
\@makeCopyrighttrue
\@makeDedicationfalse
\@makeAcknowledgementsfalse
\@makeCosupervisorfalse
\@makeReaderThreefalse
\@makeReaderFourfalse
\@makeReaderFivefalse

% Abstract page (attempts to match BUGS 2019 guidelines)
\newcommand*{\thesisAbstractPage}
{
	\pagestyle{empty}
	\singlespacing
	\if@makeDraftThesis
		\begin{center}
			\Huge Draft \\
			\Large \today \normalsize
		\end{center}
		\vspace{-8em}
	\fi
	\topvspace{1.50in}
	\begin{center}
		ABSTRACT \\
		\ \\
		\thesisTitle \par
		\ \\
		\thesisAuthorName, \thesisSeeking \par
		\ \\
		\thesisSupervisorRole: \thesisSupervisor \par
		\if@makeCosupervisor \thesisCosupervisorRole: \thesisCosupervisor \par \fi
		\ \\
        	\end{center}
	\par
	\begin{doublespace}
		\thesisAbstract
	\end{doublespace}
	\clearpage
}

% Internal macro for drawing signature lines
\newcommand*{\thesisSignature}[2]
{
	\vspace{3.0ex}
	\renewcommand{\arraystretch}{0.44}
	\begin{tabular}{@{}c@{}}
	\hrulefill \\
	\makebox[#2][c]{#1}
	\end{tabular}
	\par
}

% Signature page (attempts to match BUGS 2019 guidelines)
\newcommand*{\thesisSignaturePage}
{
	\enlargethispage{3\baselineskip}
	\thispagestyle{empty}
	\doublespacing

	\newcommand{\siglinelength}{88mm}

	{
		\setlength{\parindent}{0.0in}
            	\begin{center}
            	        	\begin{singlespace}
            	        		\thesisTitle
            	        	\end{singlespace}
            	        	by \\
            	        	\thesisAuthorName, \thesisHolding \par
            	        	\thesisProject \par
            	        	Approved by the \thesisDepartment \par
            	        	\thesisSignature{\thesisDepartmentChair, \thesisDepartmentChairTitle}{\siglinelength}
                    
            	        	\vspace{3ex}
                    
             	       	\begin{singlespace}
              	      		Submitted to the Graduate Faculty of \\
            	        		Baylor University in Partial Fulfillment of the \\
             	       		Requirements for the Degree \\
            	        		of \\
            	        		\thesisDegree
            	        	\end{singlespace}
            	\end{center}
            
            	\vspace{5ex}
            
            	\begin{minipage}{\siglinelength}
            	\begin{center}
            		Approved by the \thesisCommittee \par
            		\thesisSignature{\thesisReaderOne}{\siglinelength}
            		\thesisSignature{\thesisReaderTwo}{\siglinelength}
            		\if@makeReaderThree \thesisSignature{\thesisReaderThree}{\siglinelength} \fi
            		\if@makeReaderFour \thesisSignature{\thesisReaderFour}{\siglinelength} \fi
            		\if@makeReaderFive \thesisSignature{\thesisReaderFive}{\siglinelength} \fi
            	\end{center}
            	\end{minipage}
            
            	\vspace{2ex}
            
            	\begin{flushright}
            	\begin{minipage}{\siglinelength}
            	\begin{center}
            		\begin{singlespace}
            			Accepted by the Graduate School \\
            			\thesisConfDate
            		\end{singlespace}
            		\thesisSignature{\thesisDean, \thesisDeanTitle}{\siglinelength}
            	\end{center}
            	\end{minipage}
            	\end{flushright}
            
            	\vfill
            
            	\begin{center}
            		{\footnotesize \textit{Page bearing signatures is kept on file in the Graduate School.}}
            	\end{center}
	}

	\clearpage
}

% Copyright page (attempts to match BUGS 2019 guidelines)
\newcommand*{\thesisCopyrightPage}
{
	\if@makeCopyright
		\thispagestyle{empty}
		\topvspace{8.28in}
		\begin{center}
			Copyright \copyright{} \the\year\ by  \thesisAuthorName \\
			All rights reserved
		\end{center}
		\clearpage
	\fi
}


% Table of contents page
% Massive change just because overflowing chapter titles have to be single-spaced
% uses the tocloft package
\renewcommand{\cftdotsep}{0.5}
\cftsetrmarg{3em}
\renewcommand{\cftpartleader}{\cftdotfill{\cftdotsep}} % add dot lines for parts
\renewcommand{\cftpartpagefont}{\normalfont} % this defaults to bold, overwrite that
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}} % add dot lines for chapters
\renewcommand{\cftchappagefont}{\normalfont} % this defaults to bold, overwrite that
\setlength{\cftbeforepartskip}{2.65ex}
\setlength{\cftbeforechapskip}{2.65ex}
\setlength{\cftbeforesecskip}{0ex}
\setlength{\cftbeforesubsecskip}{0ex}
\setlength{\cftbeforesubsubsecskip}{0ex}
\setlength{\cftchapindent}{0em}
\renewcommand{\cftchapfont}{\normalfont}
\renewcommand{\cftchapaftersnumb}{\\}



\newcommand{\thesisToCpage}
{
	\singlespacing

	\renewcommand{\contentsname}{\ToCname}
	\setlength{\cftbeforetoctitleskip}{0in}
	\setlength{\cftaftertoctitleskip}{2\baselineskip}
	\renewcommand{\cfttoctitlefont}{\hfill\normalsize\normalfont}
	\renewcommand{\cftaftertoctitle}{\hfill\strut}

	\topvspace{0.5in}
	\tableofcontents	%tocloft includes \pagestyle{plain} by default
	\clearpage
}

% List of Figures page (optional)
\newcommand{\thesisLoFpage}
{
	\if@makeLoF
		\phantomsection  % Anchor the bookmark to this position
		\addcontentsline{toc}{part}{\normalsize\normalfont\LoFname}

		\singlespacing

		\renewcommand{\listfigurename}{\LoFname}
		\setlength{\cftbeforeloftitleskip}{0in}
		\setlength{\cftafterloftitleskip}{\baselineskip}
		\renewcommand{\cftloftitlefont}{\hfill\normalsize\normalfont}
		\renewcommand{\cftafterloftitle}{\hfill\strut}
		\newcommand{\myLoFw}{Figure}
		\newlength{\myLoFlen}
		\settowidth{\myLoFlen}{\mbox{\myLoFw\space\space}}
		\setlength{\cftfigindent}{0em}
		\setlength{\cftbeforefigskip}{\baselineskip}
		\renewcommand{\cftfigpresnum}{\hspace*{-\myLoFlen}\myLoFw\space}
		\renewcommand{\cftfigaftersnum}{.\hfill}
		\renewcommand{\cftfigfont}{\hspace*{\myLoFlen}}

		\topvspace{0.5in}
		\listoffigures	%tocloft includes \pagestyle{plain} by default
		\clearpage
	\fi
}

% List of Tables page (optional)
\newcommand{\thesisLoTpage}
{
	\if@makeLoT
		\phantomsection  % Anchor the bookmark to this position
		\addcontentsline{toc}{part}{\normalsize\normalfont\LoTname}
		
		\singlespacing

		\renewcommand{\listtablename}{\LoTname}
		\setlength{\cftbeforelottitleskip}{0in}
		\setlength{\cftafterlottitleskip}{\baselineskip}
		\renewcommand{\cftlottitlefont}{\hfill\normalsize\normalfont}
		\renewcommand{\cftafterlottitle}{\hfill\strut}
		\newcommand{\myLoTw}{Table}
		\newlength{\myLoTlen}
		\settowidth{\myLoTlen}{\mbox{\myLoTw\space\space}}
		\setlength{\cfttabindent}{0em}
		\setlength{\cftbeforetabskip}{\baselineskip}
		\renewcommand{\cfttabpresnum}{\hspace*{-\myLoTlen}\myLoTw\space}
		\renewcommand{\cfttabaftersnum}{.\hfill}
		\renewcommand{\cfttabfont}{\hspace*{\myLoTlen}}

		\topvspace{0.5in}
		\listoftables	%tocloft includes \pagestyle{plain} by default
		\clearpage
	\fi
}

% List of Acronyms page (optional)
\newcommand{\thesisAcropage}
{
	\if@makeAcro
		\phantomsection  % Anchor the bookmark to this position
		\addcontentsline{toc}{part}{\normalsize\normalfont\Acroname}

		\singlespacing
		\topvspace{0.5in}
		\begin{center}
                 	\normalsize\normalfont\Acroname\par
		\end{center}
		\vspace{2\baselineskip}
		\input{acronyms}
		\clearpage
	\fi
}

% Acknowledgments page (optional)
\newcommand{\thesisAcknowledgementpage}
{
	\if@makeAcknowledgements

		\phantomsection  % Anchor the bookmark to this position
		\addcontentsline{toc}{part}{\normalsize\normalfont\acknowledgename}
		
		\singlespacing
		\topvspace{0.5in}
		\begin{center}
			\normalfont\normalsize\acknowledgename\par
		\end{center}
		\vspace{\baselineskip}
		\doublespacing
		\hspace{\parindent}\th@acknowledgementsStash   % a little hack, not sure why indentation wasn't working
		\clearpage
	\fi
}

% Dedication page (optional)
\newcommand{\thesisDedicationpage}
{
	\if@makeDedication

		\phantomsection  % Anchor the bookmark to this position
		\addcontentsline{toc}{part}{\normalsize\normalfont\dedicationname}

		\singlespacing
		%\begin{center}\vspace*{0.25in}\normalfont\normalsize{}\end{center} % DOES NOT show the dedication title on the actual page
		\topvspace{2.0in}
		\begin{center}
			\normalfont\normalsize\th@dedicationStash
		\end{center}
		\clearpage
	\fi
}

%\newcommand{\thesisAppendixPage}{
%
%		\thispagestyle{plain}
%		%\addtocontents{toc}{\protect\vspace{-0.25in}}
%		\phantomsection  % Anchor the bookmark to this position
%		\addcontentsline{toc}{part}{\normalsize\normalfont\appendicestitle}
%		%\begin{center}\vspace*{0.25in}\normalfont\normalsize{}\end{center}
%		\vspace*{\fill}
%		\begin{center}\vspace*{-2.75in}\normalfont\normalsize{}\end{center}
%		\begin{center}\appendicestitle\end{center}
%		\vspace*{\fill}
%		\clearpage
%}


% The thesis prologue (front matter)
\newcommand{\thesisPrologue}
{
	% Where to start counting pages (Baylor's first pages are unpaginated, but counted!)
	\pagenumbering{roman}

	% Unpaginated preliminary pages
	\thesisAbstractPage
	\thesisSignaturePage
	\thesisCopyrightPage

	% Where to start paginating (thus making ToC page "iv" or so)
	\pagestyle{plain}

	% Paginated preliminary pages
	\thesisToCpage
	\thesisAcropage
	\thesisLoFpage
	\thesisLoTpage
	\thesisAcknowledgementpage
	\thesisDedicationpage
}

% Intercept the bibliography body
\AtBeginDocument
{
	\def\thebibliography#1
	{
		\clearpage
		\addcontentsline{toc}{chapter}{\bibname}
		\vspace*{0.43in}
		\centering\normalfont\normalsize\bibname
		\vspace{2ex}
		\singlespacing
		\list{[\arabic{enumi}]}
		{
	 		\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
	 		\advance\leftmargin\labelsep
	 		\advance\leftmargin\bibindent
			\itemindent -\bibindent
			\listparindent \itemindent
			\usecounter{enumi}
		}
		\def\newblock{\hskip .11em plus .33em minus -.07em}
		\sloppy
	 	\sfcode`\.=1000\relax
	}
}

% Intercept the main document (basically the main function here)
\let\interceptedDocument\document
\renewcommand*{\document}
{
	\interceptedDocument

	\singlespacing

	\setlength{\belowdisplayskip}{1ex} \setlength{\belowdisplayshortskip}{1ex}
	\setlength{\abovedisplayskip}{1ex} \setlength{\abovedisplayshortskip}{1ex}

	% Front matter
	\if@makeShortThesis
		\thesisAbstractPage
	\else
		\thesisPrologue
	\fi

	% Document body follows
	\doublespacing
	\pagenumbering{arabic}
}

% Expected parameters
\renewcommand*{\title}[1]{\gdef\thesisTitle{#1}}
\newcommand*{\degree}[1]{\gdef\thesisDegree{#1}}
\newcommand*{\project}[1]{\gdef\thesisProject{#1}}
\newcommand*{\committee}[1]{\gdef\thesisCommittee{#1}}
\newcommand*{\supervisor}[1]{\gdef\thesisSupervisor{#1}}
\newcommand*{\seeking}[1]{\gdef\thesisSeeking{#1}}
\newcommand*{\holding}[1]{\gdef\thesisHolding{#1}}
\newcommand*{\readerOne}[1]{\gdef\thesisReaderOne{#1}}
\newcommand*{\readerTwo}[1]{\gdef\thesisReaderTwo{#1}}
\newcommand*{\department}[1]{\gdef\thesisDepartment{#1}}
\newcommand*{\departmentChair}[1]{\gdef\thesisDepartmentChair{#1}}
\newcommand*{\graduateDean}[1]{\gdef\thesisDean{#1}}
\renewcommand*{\date}[1]{\gdef\thesisConfDate{#1}}
\renewcommand*{\author}[1]{\gdef\thesisAuthorName{#1}}
\renewcommand{\abstract}[1]{\gdef\thesisAbstract{#1}}

% Standard words that can be changed using optional parameters if necessary
\newcommand*{\thesisSupervisorRole}{Advisor}
\newcommand*{\thesisCosupervisorRole}{Co-Advisor}
\newcommand*{\thesisDepartmentChairTitle}{Chairperson}
\newcommand*{\thesisDeanTitle}{Dean}

% Optional parameters
\newcommand*{\acknowledgements}[1]{\@makeAcknowledgementstrue \gdef\th@acknowledgementsStash{#1}}
\newcommand*{\dedication}[1]{\@makeDedicationtrue \gdef\th@dedicationStash{#1}}
\newcommand*{\supervisorRole}[1]{\renewcommand{\thesisSupervisorRole}{#1}}
\newcommand*{\cosupervisor}[1]{\@makeCosupervisortrue \gdef\thesisCosupervisor{#1}}
\newcommand*{\cosupervisorRole}[1]{\renewcommand{\thesisCosupervisorRole}{#1}}
\newcommand*{\readerThree}[1]{\@makeReaderThreetrue \gdef\thesisReaderThree{#1}}
\newcommand*{\readerFour}[1]{\@makeReaderFourtrue \gdef\thesisReaderFour{#1}}
\newcommand*{\readerFive}[1]{\@makeReaderFivetrue \gdef\thesisReaderFive{#1}}
\newcommand*{\departmentChairTitle}[1]{\renewcommand{\thesisDepartmentChairTitle}{#1}}
\newcommand*{\deanTitle}[1]{\@renewcommand{\thesisDeanTitle}{#1}}
\newcommand*{\makeListOfAcronyms}{\@makeAcrotrue}
\newcommand*{\makeListOfFigures}{\@makeLoFtrue}
\newcommand*{\makeListOfTables}{\@makeLoTtrue}


% Handy table spacing macros: \abovespace, \belowspace
%% Alvin's Note: Obsolete. Do not use
%\def\abovestrut#1{}
%\def\belowstrut#1{}
%\def\abovespace{}
%\def\aroundspace{}
%\def\belowspace{}
%\def\amanda{}

% Alvin's Note: Stacking is obsolete. Handled by the subsections respective headers
%\newcommand*{\stack}{}

% Rysavy: footnotes must have the same indent as paragraph
\RequirePackage{manyfoot}
% the footnote indent should be 0.5in, which is parindent
\SetFootnoteHook{\singlespace\hspace{\dimexpr 0.5in-3ex \relax}}
\DeclareNewFootnote{A}
% the footnotes need to start with 1 at the beginning of each chapter
\renewcommand{\footnote}[1]{\footnoteA{#1}}

% if you start a chapter without a section, you need this to have the paragraph indented
\RequirePackage{indentfirst}
