from typing import Callable

import matplotlib
import matplotlib.pyplot as plt
import numpy as np

matplotlib.rcParams["text.usetex"] = True


def get_vector_field_plot(
    x: np.ndarray,
    xdot: Callable,
    xlims: tuple[float, float],
    stable_points: list[tuple[float, float]],
    unstable_points: list[tuple[float, float]],
    arrow_xs: list[float],
    arrow_delta: float,
    width: float,
    scale: float,
    ylims: tuple[float, float] | None = None,
) -> tuple:
    fig, ax = plt.subplots()

    ax.set_xlim(*xlims)
    if ylims is not None:
        ax.set_ylim(*ylims)

    ax.plot(x, xdot(x), color="C0", zorder=1)
    ax.scatter(
        [x for (x, _) in stable_points],
        [y for (_, y) in stable_points],
        s=20,
        marker="o",
        color="C0",
        zorder=2,
    )
    ax.scatter(
        [x for (x, _) in unstable_points],
        [y for (_, y) in unstable_points],
        s=20,
        marker="o",
        color="C0",
        zorder=2,
    )
    ax.scatter(
        [x for (x, _) in unstable_points],
        [y for (_, y) in unstable_points],
        s=5,
        marker="o",
        color="w",
        zorder=3,
    )

    ax.axhline(0.0, xlims[0], xlims[1], color="k", linewidth=0.75, zorder=0)
    ax.axvline(0.0, color="k", linewidth=0.75, zorder=0)

    for i in range(len(arrow_xs)):
        arrow_x = arrow_xs[i]
        arrow_y = xdot(arrow_x)

        slope = (xdot(arrow_x + arrow_delta) - xdot(arrow_x - arrow_delta)) / (
            2 * arrow_delta
        )
        length = np.sqrt(1 + slope**2)
        dx = (1.0 / length) * (-1 if arrow_y < 0.0 else 1)
        dy = (slope / length) * (-1 if arrow_y < 0.0 else 1)

        ax.quiver(
            arrow_x,
            arrow_y,
            dx,
            dy,
            angles="xy",
            scale_units="xy",
            scale=scale if scale is not None else 1,
            color="C0",
            width=width,
            headwidth=4,
            headlength=4,
            headaxislength=3,
        )

    ax.set_xlabel(r"$x$")
    ax.set_ylabel(r"$\dot{x}$")

    return ax, fig
