## Rules

---

In this project, you will develop an interpreter for a subset of the Scheme language. As you proceed, think about the issues that arise in the design of a programming language; many quirks of languages are byproducts of implementation decisions in interpreters and compilers. The subset of the language used in this project is described in the [functional programming](http://composingprograms.com/pages/32-functional-programming.html) section of Composing Programs, as well as this [language specification](https://inst.eecs.berkeley.edu/~cs61a/fa21/articles/scheme-spec/)and [built-in procedure reference](https://inst.eecs.berkeley.edu/~cs61a/fa21/articles/scheme-builtins/) for the CS 61A subset of Scheme that you'll be building in this project.



Watch (or attend) the lectures on Calculator and Interpreters for an overview of the project.



In addition, there will be a completely optional open-ended art contest (released separately) that challenges you to produce recursive images in only a few lines of Scheme. As an example, the picture above abstractly depicts all the ways of making change for $0.50 using U.S. currency. All flowers appear at the end of a branch with length 50. Small angles in a branch indicate an additional coin, while large angles indicate a new currency denomination. In the contest, you too will have the chance to unleash your inner recursive artist.

## Contents

---

-   Files you will edit:

    -   `scheme_eval_apply.py`: the recursive evaluator for Scheme expressions
    -   `scheme_forms.py`: evaluation for special forms
    -   `scheme_classes.py`: classes that describe Scheme expressions
    -   `questions.scm`: contains skeleton code for Part III

    The rest of the files in the project:

    -   `scheme.py`: the interpreter REPL
    -   `pair.py`: defines the `Pair` class and the `nil` object
    -   `scheme_builtins.py`: built-in Scheme procedures
    -   `scheme_reader.py`: the reader for Scheme input (this file is obfuscated so that you can implement it in lab)
    -   `scheme_tokens.py`: the tokenizer for Scheme input
    -   `scheme_utils.py`: functions for inspecting Scheme expressions
    -   `ucb.py`: utility functions for use in 61A projects
    -   `tests.scm`: a collection of test cases written in Scheme
    -   `ok`: the autograder
    -   `tests`: a directory of tests used by `ok`
    -   `mytests.rst`: a file where you can add your own tests

## NOTICE !!!

**This project is incomplete**. 😈 I kept the test files for future review(when I am ready)

Problems to be solved:

- [ ] Problem EC (0.0 / 2)

## How to run

---

```bash
$ python3 scheme.py
```

## Source

---

https://inst.eecs.berkeley.edu/~cs61a/fa21/proj/scheme/

