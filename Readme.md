# Three Manuscript Thesis LaTeX Template

This repository provides a thesis template built on a custom class file, `styles.cls`. You compile `Main.tex`, edit the page and chapter files that `Main.tex` inputs, and keep the formatting rules in `styles.cls`.

Most of the template text includes placeholders in `{brackets}`. Replace those with your own content.

## Quick start

### Overleaf

1. Upload the project to Overleaf (zip the folder or import from Git).
2. Set the compiler to **pdfLaTeX**.
3. Set the bibliography tool to **biber** (the class uses BibLaTeX).

Compile `Main.tex`. The output is `Main.pdf`.

### Local build (TeX Live)

Install TeX Live with `biber` available. TeX Live 2022+ works well.

Compile with `latexmk`:

```bash
latexmk -pdf -use-biber Main.tex
```

Or compile manually:

```bash
pdflatex Main
biber Main
pdflatex Main
pdflatex Main
```

## Repository layout

`Main.tex` in this repository expects these folders and file names:

```
backmatter/
  Appendix.tex
  Vita.tex
chapters/
  Chapter_01_Introduction.tex
  Chapter_02_Significance.tex
  Chapter_03_First_Manuscript.tex
  Chapter_04_Second_Manuscript.tex
  Chapter_05_Third_Manuscript.tex
  Chapter_06_Conclusion.tex
frontmatter/
  Abstract.tex
  Acknowledge.tex
  Approval.tex
  Contents.tex
  Copyright.tex
  Dedication.tex
  TitlePage.tex
Citations.bib
Main.tex
styles.cls
```

If you rename folders, update the corresponding `\input{...}` paths in `Main.tex`.

## How to use `Main.tex`

`Main.tex` is the entry point. It does three jobs.

1. Selects the class file and bibliography database
2. Inputs the front matter and sets page numbering
3. Inputs chapters, appendix, bibliography, and vita

The version in this repository begins like this:

```tex
\documentclass{styles}
\addbibresource{Citations.bib}

\begin{document}

\input{frontmatter/TitlePage}
\input{frontmatter/Copyright}
\input{frontmatter/Approval}

\cleardoublepage
\pagenumbering{roman}
\setcounter{page}{2}

\input{frontmatter/Dedication}
\input{frontmatter/Acknowledge}
\input{frontmatter/Contents}
% Add other front matter files here, for example:
% \input{frontmatter/Abstract}

% Switch to arabic numbering for the body where your program requires it:
% \cleardoublepage
% \pagenumbering{arabic}
% \tocChapterHeader

\input{chapters/Chapter_01_Introduction}
...
\printbibliography[heading=bibcenter]
\input{backmatter/Vita}

\end{document}
```

What you usually edit in `Main.tex`

- Add, remove, or reorder `\input{...}` lines for your chapters.
- Decide where roman numbering ends and where arabic numbering begins.
- Decide where the appendix and bibliography appear.

What you usually do **not** edit in `Main.tex`

- Margin rules, heading sizes, spacing, and list formatting. Those live in `styles.cls`.

## How to use `styles.cls`

You load the class with `\documentclass{styles}`. The file `styles.cls` extends the standard `report` class and sets thesis formatting. It also loads a set of common packages so you do not need to repeat them in each chapter.

Key behaviors defined by the class

- Page layout uses `geometry` with **1.5 inch left margin** and **1 inch** top, right, and bottom margins for the main body.
- Front matter helper environments apply separate margins suited to title and approval pages.
- Double spacing is enabled automatically at the start of the document (`\AtBeginDocument{\doublespacing}`).
- Chapter and section headings use larger fonts via `sectsty`.
- Hyperlinks are enabled with `hyperref` and hidden link styling (`hidelinks`).
- Table of contents, list of tables, and list of figures formatting is handled through `tocloft`.
- BibLaTeX is configured for the `biber` backend and numeric citations. DOIs are suppressed (`doi=false`). URLs still print if they are present in your `.bib` entries. If you also want to suppress URLs, add `url=false` to the BibLaTeX options in `styles.cls`.

### Front matter helper environments

These environments live in `styles.cls` and are meant to be used inside the files in `frontmatter/`.

- `titlefrontpage` for the title page (no page number, and it does not advance the counter)
- `uncountedfrontpage` for unnumbered pages that should not advance the page counter
- `frontmatterpage` for counted roman-numeral pages
- `approvalpage` for the approval page layout
- `\sigline{Role or Name}` for signature lines on the approval page

The key idea is that uncounted pages use `\thispagestyle{empty}` and also adjust the page counter so the next counted page gets the expected roman numeral.

### Table of contents chapter header

The command `\tocChapterHeader` inserts a `CHAPTER` entry into the table of contents. Use it once, right before the first chapter, if you want all chapter entries to appear under that label.

### Bibliography heading

The class defines a BibLaTeX heading named `bibcenter`. In `Main.tex` this is used as:

```tex
\printbibliography[heading=bibcenter]
```

It creates a centered “BIBLIOGRAPHY” heading and also adds a bibliography entry to the table of contents.

## Editing the front matter files

Each file in `frontmatter/` wraps the page content in one of the environments above. Edit the text inside the environment.

Examples

### `frontmatter/TitlePage.tex`

Edit the title and name. The file should wrap its content in `titlefrontpage`.

```tex
{\Large \MakeUppercase{Thesis}\\[-0.2ex]\MakeUppercase{Title}\par}
{\Large \MakeUppercase{Your Name}\par}
```

### `frontmatter/Approval.tex`

Use `approvalpage` and `\sigline{...}`.

```tex
\sigline{Dr. {Advisor Name}}
\sigline{Dr. {Committee Member 1}}
```

## Chapters, figures, tables, and code

- Begin each chapter file with `\chapter{...}`.
- The class loads `float`, so the `[H]` float specifier is available.
- The class loads `graphicx`, so you can include images with `\includegraphics`.
- The class loads `subcaption`, so you can create subfigures with `\begin{subfigure}...`.
- The class loads `listings` and provides a default `\lstset{...}` configuration.

## Citations and bibliography

All references live in `Citations.bib`.

- Add entries keyed like `smith2021method`.
- Cite with `\cite{smith2021method}` (and `\parencite{...}` if you prefer).
- Compile with `biber` as shown above.

## Troubleshooting

- References show as question marks: rebuild with `latexmk -C` then `latexmk -pdf -use-biber Main.tex`.
- Bibliography is empty: confirm `Citations.bib` is in the project root and that you cite at least one entry.
- A chapter is missing from the table of contents: use `\chapter{...}` (not `\chapter*{...}`).

## See also

Latex thesis templates provided by other Mizzou alum: Alex Yang and John Hammond.
