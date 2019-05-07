# Circum Caetera - Documentation
The goal of the project is to build a free software solution with WAF (Web Application Firewall) capabilities and SSL/TLS acceleration.
This repository is focuses on documenting the analysis of similar current solutions and the design of Circum Caetera.


## Getting Started
So far it has been analized and evaluated current solutions.

### Prerequisites
Documentation is generated using XeTeX [XeTex](http://xetex.sourceforge.net/ "XeTeX Home page").

### Installing

Several compilations are needed in order to generate indices and references properly.
PDF can be generated executing the following commands:

```
xelatex -halt-on-error PFG.tex
makeglossaries PFG
xelatex -halt-on-error PFG.tex
biber PFG
xelatex -halt-on-error PFG.tex
xelatex -halt-on-error PFG.tex
```

## Built With
* [XeTex](http://xetex.sourceforge.net/ "XeTeX Home page").
* [Biber](http://biblatex-biber.sourceforge.net/ "Biber home page").
* [Glossaries package](https://en.wikibooks.org/wiki/LaTeX/Glossary "LaTeX/Glossary").

## Authors
* **Pedro Pozuelo**

## License
This project is licensed under the GNU Free Documentation License v1.3 - see the [LICENSE](LICENSE) file for details.

## Acknowledgments
TODO
