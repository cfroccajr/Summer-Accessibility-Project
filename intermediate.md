# Plan of Action

## General Steps

The plan is create the following sections:

1.  A general header file that loads packages that are fully or at least partially compatible with the LaTeX Tagging Project.

2.  Samples of text in single and multiple columns. Some of these I will type myself. For others I will test to see if the lipsum package can be used.

3.  Various equations and expressions with and with out array like environments. These will include inline, displayed, and stacked equations.

4.  A variety of imported and generated images. All of these will contain instances of alt text, actual text, or artifact tags.

5.  Test special packages like tcolorbox or mint to see if and how they work.

After the creation of each section we will test the generated pdf using Blackboard Allie or Acrobat Accessibility Check. And use one or more programs to convert the file to HTML. To facilitate this process, based on prior experience, this project has two shells that can be used for compilation, one with the document meta data and one without.

## Resources and Programs

In creating this document we will reference a number of sources which include but are not limited to:

- The LaTeX Tagging Project: <https://latex3.github.io/tagging-project/>

- AMS guidance for accessibility: <https://www.ams.org/accessibility/accessibility-guidance>

- *Author Guidelines for Preparing Accessible Mathematics Content* produced through a collaboration of societies: <https://epubs.siam.org/pb-assets/author_guidelines_accessible_mathematics.pdf>

- Arxiv *LaTeX Markup Best Practices for Successful HTML Papers*: <https://info.arxiv.org/help/submit_latex_best_practices.html>

By using these resources we should be able to make a pdf as accessible as it can be. For examples of what this can sound like you can look here <https://latex3.github.io/tagging-project/documentation/wtpdf/fulldoc> at these complied examples from the LaTeX Tagging Project.

We will also explore using the following software in the conversion of files to HTML:

- Pandoc Universal Document Converter: <https://pandoc.org/>

- TeX4ht: <https://tug.org/tex4ht/>

- LaTeXML: <https://math.nist.gov/~BMiller/LaTeXML/>

It is important to become familiar with these since HTML is the preferred format for making mathematics electronically accessible.

# Text in One or More Columns

## General Remarks on Accessibility

For detailed remarks on accessibility you should refer to the links above; here we will make a few brief comments mostly as a way to generate some text for checking accessibility. The first step in creating an accessible document is to use good structure. By using proper structuring commands in you document[^1] `\section`{.latex} or `\subsection`{.latex} or `\chapter`{.latex} you help screen readers better understand in what order to read documents. You must always tag images with alt text, actual text, or artifact as demonstrated in the following example from the tagging project:

``` latex
    \includegraphics[height=4cm,alt={Portrait of Shakespeare}]{shakespeare.jpg}
    \includegraphics[height=4cm,artifact]{crinklepaper}
    \includegraphics[height=\baselineskip,actualtext=A]{image-of-a.jpg}
```

It should be noted that writing good alt text is an art in its self and takes practice. Related to issues with good images is careful use of color. Using a tool like [WebAIM https://webaim.org/resources/contrastchecker/](https://webaim.org/resources/contrastchecker/) can help you pick colors that work well together and avoiding those that do not as seen in figure [1](#fig:contrast){reference-type="ref" reference="fig:contrast"}. When you want to draw someones attention to a piece of text be sure to use a command like `\emph`{.latex} instead of just italicizing it, making it bold, or changing the color; this tags the text as emphasized.

<figure id="fig:contrast">

<figcaption>Examples of Good and Poor Contrast</figcaption>
</figure>

## Multi-Column Text with Lorem Ipsum

::: multicols
2
:::

::: multicols
3
:::

# Equations

## Basic Equations

## Equations with Matrices

# Images and Graphs

# Specialized Packages

# Notes

This section is a running narrative of what work has been done and when.

- June 6th 2026: This document was created and material is added to the first few sections. So far the document uploaded to Balckboard is testing well. The only issue that was flagged and can't be fixed is the deliberate example of poor contrast in figure [1](#fig:contrast){reference-type="ref" reference="fig:contrast"}. When compiling with Pandoc it does not like tikz and make4ht has issues with minted. The command `mak4ht -m clean -a info plain_pdf_shell.tex`{.linuxconfig} followed by `make4ht -m clean -a info plain_pdf_shell.tex`{.linuxconfig}. Mint is causing an issue with the conversion, should probably try using fancyvrb instead. Also noted that without the document meta data portion of the header from the tagging project the compiler can't recognize the alt text for tikz.

[^1]: Here we use the minted package which is technically incompatible with the LaTeX Tagging, but we will see what happens.
