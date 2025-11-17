from pathlib import Path

import numpy as np

from nonlinear_dynamics.plotting_utils import get_vector_field_plot


def xdot(x):
    return 1.0 - x**14


def ex2_2_2_vecfield(plotsdir):
    step = 0.01
    xlims = [-1.1, 1.1]
    ylims = [-2.0, 1.5]

    x = np.arange(xlims[0], xlims[1] + step, step)

    stable_points = [(1.0, 0.0)]
    unstable_points = [(-1.0, 0.0)]

    arrow_xs = [-1.035, -0.95, 0.95, 1.035]

    ax, fig = get_vector_field_plot(
        x,
        xdot,
        xlims,
        ylims,
        stable_points,
        unstable_points,
        arrow_xs,
        arrow_delta=0.0005,
        width=0.004,
        scale=10,
    )
    ax.legend([r"$\dot{x} = 1 - x^{14}$"], loc="lower center")
    fig.savefig(
        Path(
            plotsdir,
            "ch02",
            "fig2_2_2vecfield.pdf",
        ),
        dpi=300,
    )


def plot_ex2_2_2(plotsdir):
    ex2_2_2_vecfield(plotsdir)
