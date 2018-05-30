# sphinx-docker

Play sphinx just through docker and without installing Python and Sphinx on your computer.

## Create a Sphinx project

Create a sphinx project under `/Users/penxiao/tmp/demo`

```bash
➜  tmp docker run -it --rm -v /Users/penxiao/tmp/demo:/app sphinx-demo sphinx-quickstart
Welcome to the Sphinx 1.7.5 quickstart utility.

Please enter values for the following settings (just press Enter to
accept a default value, if one is given in brackets).

Selected root path: .

You have two options for placing the build directory for Sphinx output.
Either, you use a directory "_build" within the root path, or you separate
"source" and "build" directories within the root path.
> Separate source and build directories (y/n) [n]: y

Inside the root directory, two more directories will be created; "_templates"
for custom HTML templates and "_static" for custom stylesheets and other static
files. You can enter another prefix (such as ".") to replace the underscore.
> Name prefix for templates and static dir [_]:

The project name will occur in several places in the built documentation.
> Project name: demo
> Author name(s): Peng Xiao
> Project release []: 1.0

If the documents are to be written in a language other than English,
you can select a language here by its language code. Sphinx will then
translate text that it generates into that language.

For a list of supported codes, see
http://sphinx-doc.org/config.html#confval-language.
> Project language [en]:

The file name suffix for source files. Commonly, this is either ".txt"
or ".rst".  Only files with this suffix are considered documents.
> Source file suffix [.rst]:

One document is special in that it is considered the top node of the
"contents tree", that is, it is the root of the hierarchical structure
of the documents. Normally, this is "index", but if your "index"
document is a custom template, you can also set this to another filename.
> Name of your master document (without suffix) [index]:

Sphinx can also add configuration for epub output:
> Do you want to use the epub builder (y/n) [n]:
Indicate which of the following Sphinx extensions should be enabled:
> autodoc: automatically insert docstrings from modules (y/n) [n]:
> doctest: automatically test code snippets in doctest blocks (y/n) [n]:
> intersphinx: link between Sphinx documentation of different projects (y/n) [n]:
> todo: write "todo" entries that can be shown or hidden on build (y/n) [n]:
> coverage: checks for documentation coverage (y/n) [n]:
> imgmath: include math, rendered as PNG or SVG images (y/n) [n]:
> mathjax: include math, rendered in the browser by MathJax (y/n) [n]:
> ifconfig: conditional inclusion of content based on config values (y/n) [n]:
> viewcode: include links to the source code of documented Python objects (y/n) [n]:
> githubpages: create .nojekyll file to publish the document on GitHub pages (y/n) [n]:

A Makefile and a Windows command file can be generated for you so that you
only have to run e.g. `make html' instead of invoking sphinx-build
directly.
> Create Makefile? (y/n) [y]:
> Create Windows command file? (y/n) [y]:

Creating file ./source/conf.py.
Creating file ./source/index.rst.
Creating file ./Makefile.
Creating file ./make.bat.

Finished: An initial directory structure has been created.

You should now populate your master file ./source/index.rst and create other documentation
source files. Use the Makefile to build the docs, like so:
   make builder
where "builder" is one of the supported builders, e.g. html, latex or linkcheck.

```

## Edit Source

We can use any editor to edit rst source files in `source` folder.

## Build html

And finished, we can run `make html` and html files will be located in `/Users/penxiao/tmp/demo/build/html`.

```bash
➜  demo docker run -it --rm -v /Users/penxiao/tmp/demo:/app sphinx-demo make html
Running Sphinx v1.7.5
making output directory...
loading pickled environment... not yet created
building [mo]: targets for 0 po files that are out of date
building [html]: targets for 1 source files that are out of date
updating environment: 1 added, 0 changed, 0 removed
reading sources... [100%] index
looking for now-outdated files... none found
pickling environment... done
checking consistency... done
preparing documents... done
writing output... [100%] index
generating indices... genindex
writing additional pages... search
copying static files... done
copying extra files... done
dumping search index in English (code: en) ... done
dumping object inventory... done
build succeeded.

The HTML pages are in build/html.
➜  demo ls
Makefile build    make.bat source
➜  demo cd build
➜  build ls
doctrees html
➜  build cd html
➜  html ls
_sources       _static        genindex.html  index.html     objects.inv    search.html    searchindex.js
➜  html
```

open the file `index.html` with the browser, and you will see:

[demo](demo.png)

## Sphinx themes

we can use pip to install some themes and use them in source file config.py

for example, we want to use the theme `sphinx_rtd_theme`, first, change the html_theme in config.py

```python
# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = 'sphinx_rtd_theme'

```

then build with pip install `sphinx_rtd_theme`

```bash
➜  demo drun -v /Users/penxiao/tmp/demo:/app sphinx-demo sh -c "pip install sphinx_rtd_theme; make html"
Collecting sphinx_rtd_theme
  Downloading https://files.pythonhosted.org/packages/47/33/e3a1cc08acf0c50418c505d1b954adc950141ace691e3b4a22ba91950a32/sphinx_rtd_theme-0.3.1-py2.py3-none-any.whl (2.2MB)
    100% |████████████████████████████████| 2.2MB 11.2MB/s
Installing collected packages: sphinx-rtd-theme
Successfully installed sphinx-rtd-theme-0.3.1
Running Sphinx v1.7.5
loading pickled environment... done
building [mo]: targets for 0 po files that are out of date
building [html]: targets for 1 source files that are out of date
updating environment: 0 added, 0 changed, 0 removed
looking for now-outdated files... none found
preparing documents... done
writing output... [100%] index
generating indices... genindex
writing additional pages... search
copying static files... done
copying extra files... done
dumping search index in English (code: en) ... done
dumping object inventory... done
build succeeded.

The HTML pages are in build/html.
➜  demo
```

After that, we use open `index.html` with browser and see the changes.

Have fun!