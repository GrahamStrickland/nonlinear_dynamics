import matplotlib
import matplotlib.pyplot as plt
import numpy as np


matplotlib.rcParams["text.usetex"] = True


def get_vector_field_plot(
    x,
    xdot,
    xlims,
    ylims,
    stable_points,
    unstable_points,
    arrow_xs,
    arrow_delta,
    width,
    scale,
):
    fig, ax = plt.subplots()

    ax.set_xlim(xlims[0], xlims[1])
    if ylims is not None:
        ax.set_ylim(ylims[0], ylims[1])

    ax.plot(x, xdot(x), color="C0", zorder=0)
    ax.scatter(
        [x for (x, _) in stable_points],
        [y for (_, y) in stable_points],
        s=20,
        marker="o",
        color="C0",
        zorder=1,
    )
    ax.scatter(
        [x for (x, _) in unstable_points],
        [y for (_, y) in unstable_points],
        s=20,
        marker="o",
        color="C0",
        zorder=1,
    )
    ax.scatter(
        [x for (x, _) in unstable_points],
        [y for (_, y) in unstable_points],
        s=5,
        marker="o",
        color="w",
        zorder=2,
    )

    for i in range(len(arrow_xs)):
        x = arrow_xs[i]
        y = xdot(x)

        slope = (xdot(x + arrow_delta) - xdot(x - arrow_delta)) / (2 * arrow_delta)
        length = np.sqrt(1 + slope**2)
        dx = (1.0 / length) * (-1 if y < 0.0 else 1)
        dy = (slope / length) * (-1 if y < 0.0 else 1)

        ax.quiver(
            x,
            y,
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
