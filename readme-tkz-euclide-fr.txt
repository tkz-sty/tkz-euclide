% encodage utf8  
------------------- french lisez-moi ! --------------------------------------
  readme-tkz-euclide.txt V1.16 c 01/06/2011 

Objet
-----
tkz-euclide.sty  est un package qui remplace tkz-2d, et qui permet de dessiner
 des figures géométriques en deux dimensions. Il utilise un repère cartésien
 orthogonal fourni par le package tkz-base.sty. Il est principalement conçu
  pour faire des figures de géométrie euclidienne.  


Licence 
-------
LaTeX Project Public License  

Contraintes
----------
 -- ce package nécessite etex et fp.sty et le dossier tkzbase;
 -- bien sûr, PGF/TikZ doit être installé en version 2.1 ; 
 -- ce package fonctionne avec utf8 et pdflatex;
 -- la chaîne dvi->dvips->ps2pdf est aussi possible;
 -- il ne fonctionne pas encore avec TeX et ConTeXt; 

Installation
------------
Si vous voulez installer ce package à la main pour tester une version beta, il
 suffit de placer le dossier tkzeuclide  décompressé dans un dossier tkz (par
 exemple) ici :  /texmf/tex/latex/tkz, à côté du dossier tkzbase.
Le plus simple est de récupérer l'archive tkz.zip qui contient l'ensemble de
 mes packages liés à tkz-base.

Ce projet est constitué de nombreux fichiers qu'il est préférable de laisser
 dans un même dossier tkzeuclide. Ce dossier contient les fichiers suivants : 

 -- tkz-euclide.sty
 -- tkz-obj-addpoints.tex
 -- tkz-obj-angles.tex
 -- tkz-obj-arcs.tex
 -- tkz-obj-circles.tex
 -- tkz-obj-lines.tex
 -- tkz-obj-protractor.tex
 -- tkz-obj-polygons.tex
 -- tkz-obj-sectors.tex
 -- tkz-obj-segments.tex
 -- tkz-obj-vectors.tex
 -- tkz-tools-intersections.tex
 -- tkz-tools-transformations.tex
 -- tkz-lib-symbols.tex    

tkz-euclide utilise aussi les fichiers du dossier tkzbase:

 -- tkz-base.sty     
 -- tkz-base.cfg 
 -- tkz-tools-misc.tex
 -- tkz-tools-arith.tex
 -- tkz-tools-math.tex 
 -- tkz-tools-base.tex
 -- tkz-tools-utilities.tex
 -- tkz-obj-segments.tex 
 -- tkz-obj-points.tex
 -- tkz-obj-marks.tex   
 
Fonctionnement
-------------  
Son fonctionnement s'obtient par 
\usepackage{tkz-euclide}
\usetkzobj{all}
 
Ce package  charge tkz-base et TikZ.  \usetkzobj{all}  charge tous les objets
 utilisables par tkz-euclide, parmi ces objets, il y a les cercles  ou encore
  les rapporteurs. Si vous n'utilisez qu'un seul type d'objet, vous pouvez
   charger que celui-ci : \usetkzobj{circles} pour les cercles.

il est nécessaire de charger xcolor.sty avant tkz-euclide,  si vous en avez
 besoin, afin d'éviter des conflits entre packages. 

Documentation
-------------
 tkz-euclide-screen.pdf est actuellement en français, mais de nombreux 
  exemples sont donnés. 
Une documentation destinée à l'impression sera bientôt prête. Vous trouverez
 ces fichiers sur mes sites :
  http://altermundus.fr  ou   http://altermundus.com 

Exemples
--------
 Tous les exemples donnés dans la documentation sont stockés sur mes sites
  sous forme de fichiers individuels, prêts pour être compilés.

Compatibilité
-------------
Ce nouveau package est incompatible avec les anciens packages tkz-2d.


Historique des versions
-------

-- 1.16 correction of bugs
-- 1.13 first version

 Alain Matthes
 5 rue de Valence
 Paris 75005  
 
 al (dot) ma (at) mac (dot) com     
 