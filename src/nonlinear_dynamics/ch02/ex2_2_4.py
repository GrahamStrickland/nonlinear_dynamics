from pathlib import Path

import matplotlib
import numpy as np

from nonlinear_dynamics.plotting_utils import get_vector_field_plot


matplotlib.rcParams["text.usetex"] = True


def xdot(x):
    return np.exp(-x) * np.sin(x)


def ex2_2_4_vecfield(plotsdir):
    step = 0.01
    xlims = [-2.5 * np.pi, 2.5 * np.pi]
    ylims = [-10.0, 10.0]

    x = np.arange(xlims[0], xlims[1] + step, step)

    stable_points = [(-np.pi, 0.0), (np.pi, 0.0)]
    unstable_points = [(-2.0 * np.pi, 0.0), (0.0, 0.0), (2.0 * np.pi, 0.0)]

    arrow_xs = (
        [x - 0.2 for (x, _) in stable_points]
        + [x + 0.2 for (x, _) in stable_points]
        + [x - 0.2 for (x, _y) in unstable_points]
        + [x + 0.2 for (x, _) in unstable_points]
    )

    ax, fig = get_vector_field_plot(
        x,
        xdot,
        xlims,
        ylims,
        stable_points,
        unstable_points,
        arrow_xs,
        arrow_delta=0.001,
        width=0.004,
        scale=1,
    )
    ax.legend([r"$\dot{x} = e^{-x}\sin{x}$"], loc="upper right")
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
            "fig2_2_4vecfield.pdf",
        ),
        dpi=300,
    )


def plot_ex2_2_4(plotsdir):
    ex2_2_4_vecfield(plotsdir)
