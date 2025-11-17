from pathlib import Path

import matplotlib
import numpy as np

from nonlinear_dynamics.plotting_utils import get_vector_field_plot


matplotlib.rcParams["text.usetex"] = True


def xdot(x):
    return x - x**3


def ex2_2_3_vecfield(plotsdir):
    step = 0.01
    xlims = [-1.5, 1.5]

    x = np.arange(xlims[0], xlims[1] + step, step)

    stable_points = [(0.0, 0.0)]
    unstable_points = [(-1.0, 0.0), (1.0, 0.0)]

    arrow_xs = [-1.2, -0.75, -0.25, 0.25, 0.75, 1.2]

    ax, fig = get_vector_field_plot(
        x,
        xdot,
        xlims,
        None,
        stable_points,
        unstable_points,
        arrow_xs,
        arrow_delta=0.01,
        width=0.004,
        scale=10,
    )
    ax.legend([r"$\dot{x} = x - x^3$"], loc="upper right")

    fig.savefig(
        Path(
            plotsdir,
            "ch02",
            "fig2_2_3vecfield.pdf",
        ),
        dpi=300,
    )


def plot_ex2_2_3(plotsdir):
    ex2_2_3_vecfield(plotsdir)
