from pathlib import Path

import matplotlib
import numpy as np

from nonlinear_dynamics.plotting_utils import get_vector_field_plot

matplotlib.rcParams["text.usetex"] = True


def xdot(x: np.ndarray) -> np.ndarray:
    return x**4 - 3.0 * x**2 - 2 * x


def ex2_2_8_vecfield(plotsdir: Path):
    step = 0.01
    xlims = (-2.0, 2.5)

    x = np.arange(xlims[0], xlims[1] + step, step)

    half_stable_points = [(-1.0, 0.0)]
    stable_points = [(0.0, 0.0)]
    unstable_points = [(2.0, 0.0)]

    arrow_xs = [-1.75, -0.7, 0.5, 2.25]

    ax, fig = get_vector_field_plot(
        x=x,
        xdot=xdot,
        xlims=xlims,
        half_stable_points=half_stable_points,
        stable_points=stable_points,
        unstable_points=unstable_points,
        arrow_xs=arrow_xs,
        arrow_delta=0.0001,
        width=0.004,
        scale=3,
    )
    ax.legend([r"$\dot{x} = x^4 - 3x^2 - 2x$"], loc="upper right")

    fig.savefig(
        Path(
            plotsdir,
            "ch02",
            "fig2_2_8vecfield.pdf",
        ),
        dpi=300,
    )


def plot_ex2_2_8(plotsdir: Path):
    ex2_2_8_vecfield(plotsdir)
