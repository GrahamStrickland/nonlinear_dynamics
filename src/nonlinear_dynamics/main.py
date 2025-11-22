import os
from pathlib import Path

from nonlinear_dynamics.ch02 import (plot_ex2_2_1, plot_ex2_2_2, plot_ex2_2_3,
                                     plot_ex2_2_4, plot_ex2_2_5, plot_ex2_2_6,
                                     plot_ex2_2_7, plot_ex2_2_8, plot_ex2_2_9)


def main():
    plotsdir = Path("..", "plots")

    if not os.path.exists(plotsdir):
        os.mkdir(plotsdir)

    plot_ex2_2_1(plotsdir)
    plot_ex2_2_2(plotsdir)
    plot_ex2_2_3(plotsdir)
    plot_ex2_2_4(plotsdir)
    plot_ex2_2_5(plotsdir)
    plot_ex2_2_6(plotsdir)
    plot_ex2_2_7(plotsdir)
    plot_ex2_2_8(plotsdir)
    plot_ex2_2_9(plotsdir)


if __name__ == "__main__":
    main()
