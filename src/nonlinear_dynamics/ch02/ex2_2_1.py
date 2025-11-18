from pathlib import Path

import matplotlib
import matplotlib.pyplot as plt
import numpy as np

from nonlinear_dynamics.plotting_utils import get_vector_field_plot

matplotlib.rcParams["text.usetex"] = True


def xdot(x):
    return 4.0 * x**2 - 16.0


def x1(t):
    return 2.0 * (1.0 - np.exp(16.0 * t)) / (1.0 + np.exp(16.0 * t))


def x2(t):
    return (
        2.0
        * (1.0 + (1.0 / 3.0) * np.exp(16.0 * t))
        / (1.0 - (1.0 / 3.0) * np.exp(16.0 * t))
    )


def x3(t):
    return 2.0 * (1.0 + 3.0 * np.exp(16.0 * t)) / (1.0 - 3.0 * np.exp(16.0 * t))


def ex2_2_1_vecfield(plotsdir):
    step = 0.01
    xlims = [-3, 3]

    x = np.arange(xlims[0], xlims[1] + step, step)

    stable_points = [(-2.0, 0.0)]
    unstable_points = [(2.0, 0.0)]

    arrow_xs = [-2.5, -1.25, 1.5, 2.5]

    ax, fig = get_vector_field_plot(
        x,
        xdot,
        xlims,
        None,
        stable_points,
        unstable_points,
        arrow_xs,
        arrow_delta=0.01,
        width=0.01,
        scale=1,
    )
    ax.legend([r"$\dot{x} = 4x^2 - 16$"], loc="upper center")

    fig.savefig(
        Path(
            plotsdir,
            "ch02",
            "fig2_2_1vecfield.pdf",
        ),
        dpi=300,
    )


def ex2_2_1_graph(plotsdir):
    step = 0.01
    xlims = [0, 2]
    ylims = [-4, 2]

    t = np.arange(xlims[0], xlims[1] + step, step)

    fig, ax = plt.subplots()

    ax.set_xlim(xlims[0], xlims[1])
    ax.set_ylim(ylims[0], ylims[1])

    ax.plot(t, x1(t))
    ax.plot(t, x2(t))
    ax.plot(t, x3(t))

    ax.set_xlabel(r"$t$")
    ax.set_ylabel(r"$x$")

    ax.legend(
        [
            r"$x_1(t) = 2\frac{1 - e^{16t}}{1 + e^{16t}}$",
            r"$x_2(t) = 2\frac{1 + \frac{1}{3}e^{16t}}{1 - \frac{1}{3}e^{16t}}$",
            r"$x_3(t) = 2\frac{1 + 3e^{16t}}{1 - 3e^{16t}}$",
        ]
    )

    ax.axhline(0.0, xlims[0], xlims[1], color="k", linewidth=0.75, zorder=0)

    fig.savefig(
        Path(
            plotsdir,
            "ch02",
            "fig2_2_1graph.pdf",
        ),
        dpi=300,
    )


def plot_ex2_2_1(plotsdir):
    ex2_2_1_vecfield(plotsdir)
    ex2_2_1_graph(plotsdir)
