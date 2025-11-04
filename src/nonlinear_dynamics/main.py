import os
from pathlib import Path

from nonlinear_dynamics.ch02 import plot_ex2_2_1


def main():
    plotsdir = Path("..", "plots")

    if not os.path.exists(plotsdir):
        os.mkdir(plotsdir)

    plot_ex2_2_1(plotsdir)


if __name__ == "__main__":
    main()
