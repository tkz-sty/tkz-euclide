# tkz-euclide — for euclidan geometry

Release 3.0§c 2020/04/06

## Description

`tkz-euclide` is a package (latex) which allows you to draw  two-dimensional
geometric figures, in other words to create figures of Euclidean geometry.
It uses a Cartesian coordinate system orthogonal provided by the `tkz-base`
package as well as tools to define the unique coordinates of points and to
manipulate them. The idea is to allow you to follow step by step a construction
that would be done by hand as naturally as possible.

## Licence

The scontents package may be modified and distributed under the terms and
conditions of the [LaTeX Project Public License](https://www.latex-project.org/lppl/), version 1.3c or greater.


## Requirements

The package compiles with utf8, pdflatex and lualatex, loads and depends on updated versions of:
- [tkz-base](https://ctan.org/pkg/tkz-base)
- [xfp](https://ctan.org/pkg/xfp)
- [numprint](https://ctan.org/pkg/numprint)
- [tikz](https://ctan.org/pkg/tikz)

## Installation

The package `tkz-eculide` is present in TeXLive and MiKTeX, use the package
manager to install.

You can experiment with the `tkz-euclide` package by placing all of the
distribution files in the directory containing your current tex file.

The different files must be moved into the different directories in your
installation `TDS` tree or in your `TEXMFHOME`:

```
  doc/cheatsheet_euclide_2.pdf -> TDS:doc/latex/tkz-euclide/cheatsheet_euclide_2.pdf
  doc/cheatsheet_euclide_1.pdf -> TDS:doc/latex/tkz-euclide/cheatsheet_euclide_1.pdf
  doc/Euclidean_geometry.pdf   -> TDS:doc/latex/tkz-euclide/Euclidean_geometry.pdf
  doc/TKZdoc-euclide.pdf       -> TDS:doc/latex/tkz-euclide/TKZdoc-euclide.pdf
  doc/README.md                -> TDS:doc/latex/tkz-euclide/README.md
  doc/examples/*.*             -> TDS:doc/latex/tkz-euclide/examples/*.*
  doc/sourcedoc/*.*            -> TDS:doc/latex/tkz-euclide/sourcedoc/*.*
  code/*.*                     -> TDS:tex/latex/tkz-euclide/*.*
```

## How to use it

To use the package `tkz-euclide`, place the following lines in the preamble of
your LaTeX document:

```
\usepackage{tkz-euclide}
```

The line `\usetkzobj{all}` is no longer required with `tkz-euclide` but you can use it with
other packages.

If you use the `xcolor` package, load that package before `tkz-euclide` to avoid
package conflicts.

## Documentation

Documentation for `tkz-euclide` is available on `CTAN`. You have two
cheatsheets about tkz-euclide in the archive. Use `texdoc tkz-euclide`.

## Examples

All  examples given in documentation will be stored on `CTAN` as standalone
files, ready for compilation. You can use the main.tex file to load and
compile  an example.

The archive contains a litle document about Euclidean Geometry with four
examples.

Other examples, en français, are on my site: [http://altermundus.fr](http://altermundus.fr)

## Compatibility

The new version of `tkz-euclide` is *not* fully compatible with the version
1.16 but the differences are minor.

## History
- 3.06 correction of bugs, amelioration of the documentation. 
- 3.05 correction of bugs, amelioration of the documentation.
- 3.02 replacement french documentation by english documentation, correction of bugs.
- 3.01 replacement `fp` for `xfp`, addition of some macros, correction of bugs
- 1.16 correction of bugs
- 1.13 first version

## Author

Alain Matthes, 5 rue de Valence, Paris 75005, al (dot) ma (at) mac (dot) com
