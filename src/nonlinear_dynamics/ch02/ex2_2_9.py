from pathlib import Path

import matplotlib
import matplotlib.pyplot as plt
import numpy as np

from nonlinear_dynamics.plotting_utils import get_vector_field_plot

matplotlib.rcParams["text.usetex"] = True


def xdot(x: np.ndarray) -> np.ndarray:
    return x**2 - x


def x1(t: np.ndarray) -> np.ndarray:
    return 1.0 / (1.0 - (np.exp(t) / 3.0))


def ex2_2_9_vecfield(plotsdir: Path):
    step = 0.01
    xlims = (-1.0, 2.0)

    x = np.arange(xlims[0], xlims[1] + step, step)

    stable_points = [(0.0, 0.0)]
    unstable_points = [(1.0, 0.0)]

    arrow_xs = [-0.5, 0.5, 1.5]

    ax, fig = get_vector_field_plot(
        x=x,
        xdot=xdot,
        xlims=xlims,
        stable_points=stable_points,
        unstable_points=unstable_points,
        arrow_xs=arrow_xs,
        arrow_delta=0.0001,
        width=0.004,
        scale=10,
    )
    ax.legend([r"$\dot{x} = x^2 - x$"], loc="upper right")

    fig.savefig(
        Path(
            plotsdir,
            "ch02",
            "fig2_2_9vecfield.pdf",
        ),
        dpi=300,
    )


def ex2_2_9_graph(plotsdir: Path):
    step = 0.01
    xlims = [0, 2]

    t = np.arange(xlims[0], xlims[1] + step, step)

    fig, ax = plt.subplots()

    ax.set_xlim(xlims[0], xlims[1])

    ax.plot(t, x1(t))

    ax.set_xlabel(r"$t$")
    ax.set_ylabel(r"$x$")

    ax.legend(
        [
            r"$x_1(t) = \frac{1}{1 - e^t/3}$",
        ]
    )

    ax.axhline(0.0, xlims[0], xlims[1], color="k", linewidth=0.75, zorder=0)

    fig.savefig(
        Path(
            plotsdir,
            "ch02",
            "fig2_2_9graph.pdf",
        ),
        dpi=300,
    )


def plot_ex2_2_9(plotsdir: Path):
    ex2_2_9_vecfield(plotsdir)
    ex2_2_9_graph(plotsdir)
