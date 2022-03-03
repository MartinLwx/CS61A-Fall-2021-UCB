## Rules

---

In Hog, two players alternate turns trying to be the first to end a turn with at least 100 total points. On each turn, the current player chooses some number of dice to roll, up to 10. That player's score for the turn is the sum of the dice outcomes. However, a player who rolls too many dice risks:

-   **Sow Sad**. If any of the dice outcomes is a 1, the current player's score for the turn is `1`.

In a normal game of Hog, those are all the rules. To spice up the game, we'll include some special rules:

-   **Picky Piggy**. A player who chooses to roll zero dice scores the `n`th digit of the decimal expansion of 1/7 (0.14285714...), where `n` is the opponent's score. As a special case, if `n` is 0, the player scores 7 points.

-   **Hog Pile**. After points for the turn are added to the current player's score, if the players' scores are the same, the current player's score doubles.

## Contents

---

To get started, download all of the project code as a [zip archive](https://inst.eecs.berkeley.edu/~cs61a/fa21/proj/hog/hog.zip). Below is a list of all the files you will see in the archive once unzipped. For the project, you'll only be making changes to `hog.py`.

-   `hog.py`: A starter implementation of Hog
-   `dice.py`: Functions for rolling dice
-   `hog_gui.py`: A graphical user interface (GUI) for Hog (updated)
-   `ucb.py`: Utility functions for CS 61A
-   `ok`: CS 61A autograder
-   `tests`: A directory of tests used by `ok`
-   `gui_files`: A directory of various things used by the web GUI
-   `calc.py`: A file you can use to approximately test your final strategy (in progress)

I have removed the `ok` and `tests`

## How to run

---

```bash
> python3 hog_gui.py
```

## Source

---

https://inst.eecs.berkeley.edu/~cs61a/fa21/proj/hog/