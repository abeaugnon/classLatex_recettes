% Copyright (C) 2014 Anael Bonneton
%       anael.bonneton@gmail.com 
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

%% Classe Latex permettant de rédiger des recettes en français
\NeedsTeXFormat{LaTeX2e}
 
\ProvidesClass{recette}[2013/12/29 Classe recette, V1.0]

\LoadClass[a4paper, 12pt, landscape]{article}

\RequirePackage[a4paper, landscape]{geometry}
\RequirePackage[latin1]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[frenchb]{babel}
\RequirePackage{lmodern}
\RequirePackage{graphicx}
\RequirePackage{textcomp}
\RequirePackage{xparse}
\RequirePackage{multicol}
\RequirePackage{fullpage}
\RequirePackage[usenames, dvipsnames]{xcolor}
\RequirePackage{graphics}
\RequirePackage{nicefrac}
\RequirePackage{symbolesCuisine}
\RequirePackage{outils}

%% ne pas numéroter les pages
\pagestyle{empty}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%% Commande à utiliser au début du document
\newcommand{\debut}
{\begin{document}}

%%%%%%%%%%%%%%%%%%%%%%%% Commande à utiliser à la fin du document
\newcommand{\fin}
{%% Affiche le titre
 \maketitle
  %% Affiche le corps de la recette
 \corps
 \end{document}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Définition de variables pour le titre du document
\def\@titre{\relax} % titre
\newcommand{\titre}[1]{\gdef\@titre{#1}}

\def\@tag{\relax} % tag (pour les dossiers de la page web)
\newcommand{\tag}[1]{\gdef\@tag{#1}}

\def\@nbPers{\relax} % nombre de personnes
\newcommand{\nombrePersonnes}[1]{\gdef\@nbPers{#1}}

\def\@tpsPrep{\relax} % temps de préparation
\newcommand{\tempsPreparation}[1]{\gdef\@tpsPrep{#1}}

\def\@tpsRef{\relax} % temps de réfrigération
\newcommand{\tempsRefrigeration}[1]{\gdef\@tpsRef{#1}}

\def\@tpsCuiss{\relax} % temps de cuisson
\newcommand{\tempsCuisson}[1]{\gdef\@tpsCuiss{#1}}

\def\@temp{\relax} % température de cuisson
\newcommand{\temperature}[1]{\gdef\@temp{#1}}					

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Définition de variables pour le corps du document
\def\@ingr{\relax} % les ingrédients
\newcommand{\ingredients}[1]{\gdef\@ingr{#1}}

\def\@prep{\relax} % la préparation
\newcommand{\preparation}[1]{\gdef\@prep{#1}}

\def\@conseils{\relax} % les conseils			
\newcommand{\conseils}[1]{\gdef\@conseils{#1}}	

\def\@variantes{\relax}	% des variantes
\newcommand{\variantes}[1]{\gdef\@variantes{#1}}	

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%% Définition des paragraphes
%% pour les instructions de la préparation, les conseils et les variantes
\newcommand\paragraphe{\@startsection{paragraph}{4}{\z@}
{1.5ex \@plus1ex \@minus.2ex}{-1em}
{\normalfont\normalsize\bfseries}}

%%%%%%%%%%%%%%%%%%%%%%%% Définition des listes (pour les ingrédients)
%% #1 (paramètre optionel) : titre de la liste
\DeclareDocumentEnvironment{liste}{ o } {
\IfNoValueTF {#1} {
	\begin{itemize}
		\renewcommand{\labelitemi}{$\bullet$}
	} {
	\subsection*{\color{Turquoise}{#1}}
	\begin{itemize}
		\renewcommand{\labelitemi}{$\bullet$}
	}
}
{\end{itemize}}

%% Jolie fraction 1/2
\newcommand{\demi}
{\nicefrac{1}{2}~}

%% Jolie fraction 1/3
\newcommand{\tiers}
{\nicefrac{1}{3}~}

%% Jolie fraction 1/4
\newcommand{\quart}
{\nicefrac{1}{4}~}

%% Abbréviation pour cuillère à café
\newcommand{\cc}
{c. \`a c.~}

%% Abbréviation pour cuillère à soupe
\newcommand{\cs}
{c. \`a s.~}
