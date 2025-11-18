from pathlib import Path

import matplotlib
import matplotlib.pyplot as plt
import numpy as np

from nonlinear_dynamics.plotting_utils import get_vector_field_plot

matplotlib.rcParams["text.usetex"] = True


def xdot(x):
    return 1.0 + 0.5 * np.cos(x)


def x1(t):
    return 2.0 * np.atan(np.sqrt(3.0) * np.tan(t * (np.sqrt(3.0) / 4.0)))


def ex2_2_5_vecfield(plotsdir):
    step = 0.01
    xlims = [-2.5 * np.pi, 2.5 * np.pi]

    x = np.arange(xlims[0], xlims[1] + step, step)

    stable_points = []
    unstable_points = []

    arrow_xs = []

    ax, fig = get_vector_field_plot(
        x,
        xdot,
        xlims,
        None,
        stable_points,
        unstable_points,
        arrow_xs,
        arrow_delta=0.001,
        width=0.004,
        scale=1,
    )
    ax.legend([r"$\dot{x} = 1 + \frac{1}{2}\cos{x}$"], loc="lower right")
    ax.set_xticks(
        [(np.pi * x) / 2 for x in range(-4, 5, 1)],
        [
            r"$-2\pi$",
            r"$-\frac{3}{2}\pi$",
            r"$-\pi$",
            r"$-\frac{1}{2}\pi$",
            r"$0$",
            r"$\frac{1}{2}\pi$",
            r"$\pi$",
            r"$\frac{3}{2}\pi$",
            r"$2\pi$",
        ],
    )

    fig.savefig(
        Path(
            plotsdir,
            "ch02",
            "fig2_2_5vecfield.pdf",
        ),
        dpi=300,
    )


def ex2_2_5_graph(plotsdir):
    step = 0.01
    xlims = [0.0, 8.0 * np.pi]
    ylims = [-3.0, 3.0]

    ts = np.arange(xlims[0], xlims[1] + step, step)

    fig, ax = plt.subplots()

    ax.set_xlim(*xlims)
    ax.set_ylim(*ylims)

    xs = x1(ts)
    # TODO: Determine these values analytically
    # asymptotes = [t for t in ts if x1(t) < ylims[0] or x1(t) > ylims[1]]
    # print(len(asymptotes))
    # print(asymptotes[23], asymptotes[70], asymptotes[127])
    asymptotes = [3.58, 10.75, 18.01]
    xs[xs > ylims[1]] = np.inf
    xs[xs < ylims[0]] = -np.inf

    ax.axhline(0.0, xlims[0], xlims[1], color="k", linewidth=0.75, zorder=0)
    ax.vlines(
        asymptotes, ylims[0], ylims[1], color="0.5", linestyles="dashed", linewidths=1.0
    )
    ax.plot(ts, xs)

    ax.set_xlabel(r"$t$")
    ax.set_ylabel(r"$x$")
    ax.set_xticks(
        [2.0 * x * np.pi for x in range(0, 5)],
        [r"$0$", r"$2\pi$", r"$4\pi$", r"$6\pi$", r"$8\pi$"],
    )
    ax.legend(
        [
            r"$x(t) = 2\tan^{-1}{[\sqrt{3}\tan{(t\sqrt{3}/4)}]}$",
        ],
        loc="upper center",
    )

    fig.savefig(
        Path(
            plotsdir,
            "ch02",
            "fig2_2_5graph.pdf",
        ),
        dpi=300,
    )


def plot_ex2_2_5(plotsdir):
    ex2_2_5_vecfield(plotsdir)
    ex2_2_5_graph(plotsdir)
