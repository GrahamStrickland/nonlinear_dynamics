from pathlib import Path

import matplotlib
import matplotlib.pyplot as plt
import numpy as np


matplotlib.rcParams["text.usetex"] = True


def ex2_2_7_graph(plotsdir):
    step = 0.01
    xlims = [-np.pi / 2.0, np.pi / 2.0]

    x = np.arange(xlims[0], xlims[1] + step, step)

    fig, ax = plt.subplots()

    ax.set_xlim(xlims[0], xlims[1])

    ax.plot(x, np.exp(x))
    ax.plot(x, np.cos(x))

    ax.set_xlabel(r"$x$")
    ax.set_ylabel(r"$\dot{x}$")

    ax.legend(
        [
            r"$e^x$",
            r"$\cos{x}$",
        ]
    )

    fig.savefig(
        Path(
            plotsdir,
            "ch02",
            "fig2_2_7graph.pdf",
        ),
        dpi=300,
    )


def plot_ex2_2_7(plotsdir):
    ex2_2_7_graph(plotsdir)
