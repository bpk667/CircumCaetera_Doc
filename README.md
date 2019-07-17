# Circum Caetera - Documentation
The goal of the project is to build a free software solution with WAF (Web Application Firewall) capabilities and SSL/TLS acceleration.

This repository is focuses on documenting the analysis of similar current solutions and the design of Circum Caetera.


## Getting Started
There are 3 documents (all in spanish):
 - Prepuesta. It is the proposal for the project.
 - Memoria. Thesis where it is documented all the work done and the final project.
 - Presentacion. Slides presenting the solution.

### Prerequisites
For the proposal and the thesis:
Documentation is generated using XeTeX [XeTex](http://xetex.sourceforge.net/ "XeTeX Home page").

For the slides:
Documentation is generated using pdfTeX [pdfTeX](http://www.tug.org/applications/pdftex/ "pdfTeX Home page").

### Installing

Several compilations are needed in order to generate indices and references properly.
PDF can be generated executing the following commands (proposal and thesis):

```
xelatex -halt-on-error PFG.tex
makeglossaries PFG
xelatex -halt-on-error PFG.tex
biber PFG
xelatex -halt-on-error PFG.tex
xelatex -halt-on-error PFG.tex
```

As for the slides:
```
pdflatex -halt-on-error PFG.tex
makeglossaries PFG
pdflatex -halt-on-error PFG.tex
biber PFG
pdflatex -halt-on-error PFG.tex
pdflatex -halt-on-error PFG.tex
```

## Built With
* [XeTex](http://xetex.sourceforge.net/ "XeTeX Home page").
* [pdfTeX](http://www.tug.org/applications/pdftex/ "pdfTeX Home page").
* [Biber](http://biblatex-biber.sourceforge.net/ "Biber home page").
* [Glossaries package](https://en.wikibooks.org/wiki/LaTeX/Glossary "LaTeX/Glossary").

## Authors
* **Pedro Pozuelo**

## License
This project is licensed under the GNU Free Documentation License v1.3 - see the [LICENSE](LICENSE) file for details.

## Acknowledgments
[Donald E. Knuth](https://cs.stanford.edu/~knuth/ "Donald E. Knuth Home page") and all the people who has contributed to TeX and TeX's amazing macros.

[Richard Stallman](https://stallman.org/ "Richard Stallman's Personal Site") and all the people involved in the Free Software Foundation.
