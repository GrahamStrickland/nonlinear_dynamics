from pathlib import Path

import matplotlib
import matplotlib.pyplot as plt
import numpy as np


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

    arrow_xs = [-2.75, -1.25, 1.75, 2.25]
    arrow_dxs = [xdot(x) for x in arrow_xs]
    arrow_us = [x + 0.25 if xdot(x) > 0.0 else x - 0.25 for x in arrow_xs]
    arrow_vs = [xdot(x) for x in arrow_us]

    fig, ax = plt.subplots()

    ax.set_xlim(xlims[0], xlims[1])

    ax.plot(x, xdot(x), color="b", zorder=0)
    ax.scatter(
        [x for (x, _) in stable_points],
        [y for (_, y) in stable_points],
        s=20,
        marker="o",
        color="b",
        zorder=1,
    )
    ax.scatter(
        [x for (x, _) in unstable_points],
        [y for (_, y) in stable_points],
        s=20,
        marker="o",
        color="b",
        zorder=1,
    )
    ax.scatter(
        [x for (x, _) in unstable_points],
        [y for (_, y) in stable_points],
        s=5,
        marker="o",
        color="w",
        zorder=2,
    )

    ax.set_xlabel(r"$x$")
    ax.set_ylabel(r"$\dot{x}$")
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
