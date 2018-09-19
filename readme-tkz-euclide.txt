% encodage utf8    
--------------------  english readme ----------------------------------------
readme-tkz-euclide.txt V1.16 c 01/06/2011 

tkz-euclide is a replacement package for the original tkz-2d package. 
tkz-euclide uses the Cartesian (rectangular) coordinate system provided by the
package tkz-base.sty. It is designed to create figures based on Euclidean
 geometry.

Licence
-------

This program can be redistributed and/or modified under the terms
of the LaTeX Project Public License Distributed from CTAN
archives in directory macros/latex/base/lppl.txt. 


Features
--------
 -- needs etex and fp.sty;
 -- requires and automatically loads  PGF/TikZ 2.1; 
 -- compiles with utf8, pdflatex;
 -- compiles using the chain dvi->dvips->ps2pdf; 
 -- not yet ready for use with TeX and ConText (I need more time and ideas); 
 
Installation  
------------

You can experiment with the tkz-euclide package by placing all of the
distribution files in the directory containing your current tex file.

You can also placing all of the distribution files in the directory : 
/texmf/tex/latex/tkz.

tkz-euclide.sty uses a lot of files. The directory tkzeuclide contains the
 following files :

 -- tkz-euclide.sty
 -- tkz-lib-symbols.tex
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

tkz-euclide also uses the files in the directory tkzbase:

 -- tkz-base.cfg 
 -- tkz-obj-segments.tex
 -- tkz-tools-misc.tex
 -- tkz-base.sty
 -- tkz-tools-arith.tex
 -- tkz-tools-obsolete.tex
 -- tkz-obj-marks.tex	tkz-tools-base.tex
 -- tkz-tools-utilities.tex
 -- tkz-obj-points.tex
 -- tkz-tools-math.tex
 
How to use it
-------------

To use the package tkz-euclide, place the following lines in the preamble of
 your LaTeX document.

\usepackage{tkz-euclide} 
\usetkzobj{all} 
 
\usepackage{tkz-euclide}  loads tkz-base and TikZ. \usetkzobj{all}  loads all
 objects used by tkz-euclide. 

If you don't need to use all of the objects provided by tkz-euclide, you can
 load just the ones you need.

\usepackage{tkz-euclide} 
\usetkzobj}{circles,polygons}

This loads two specific objects, circles and polygons.

If you use the xcolor package, load that package before tkz-euclide to avoid
 package conflicts.

\usepackage[usenames,dvipsnames]{xcolor}
\usepackage{amsmath,tkz-euclide,tkz-fct}
\usetkzobj{all}   


Documentation
-------------
 Documentation for tkz-euclide and tkz-base is available on my sites:
 
 http://altermundus.fr (en français) or  http://altermundus.fr (in english) 
 Documentation for printing will be ready soon. 
 
Examples
--------
 All  examples given in documentation will be stored on my sites as standalone
  files, ready for compilation.  

Compatibility
-------------  

The new package tkz-euclide is *not* compatible with older packages tkz-base,
 tkz-2d, and tkz-arith.  

History
-------

-- 1.16 correction of bugs
-- 1.13 first version

 Alain Matthes
 5 rue de Valence
 Paris 75005  
 
 al (dot) ma (at) mac (dot) com 
 
               