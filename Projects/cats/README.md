## Rules

---

A program that measures typing speed. Additionally, you will implement typing autocorrect, which is a feature that attempts to correct the spelling of a word after a user types it. This project is inspired by [typeracer](https://play.typeracer.com/).

## Contents

---

-   `cats.py`: The typing test logic.
-   `utils.py`: Utility functions for interacting with files and strings.
-   `ucb.py`: Utility functions for CS 61A projects.
-   `data/sample_paragraphs.txt`: A file containing text samples to be typed. These are [scraped](https://github.com/kavigupta/wikivideos/blob/626de521e04ca643751ed85d549faca6ea528b1d/get_corpus.py) Wikipedia articles about various topics.
-   `data/common_words.txt`: A file containing common [English words in order of frequency](https://github.com/first20hours/google-10000-english/blob/master/google-10000-english-usa-no-swears.txt).
-   `data/words.txt`: A file containing many more [English words in order of frequency](https://github.com/first20hours/google-10000-english/blob/master/google-10000-english-usa-no-swears.txt).
-   `cats_gui.py`: A web server for the web-based graphical user interface (GUI).
-   `gui_files`: A directory of files needed for the graphical user interface (GUI).
-   `multiplayer`: A directory of files needed to support multiplayer mode.
-   `favicons`: A directory of icons.
-   `images`: A directory of images.
-   `ok`, `proj02.ok`, `tests`: Testing files.

I have removed the tests files.

## How to run

---

```bash
> python3 cats_gui.py
```

Or, you can play it online: https://cats.cs61a.org/

## Source

---

https://inst.eecs.berkeley.edu/~cs61a/fa21/proj/cats/