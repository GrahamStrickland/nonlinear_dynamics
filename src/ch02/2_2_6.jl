using CairoMakie
using LaTeXStrings

xs = [0.5pi * x for x = -4:4]

fig = Figure()
ax = Axis(
    fig[1, 1],
    limits=((-2.5pi, 2.5pi), nothing),
    xticks=(
        xs,
        [L"-2\pi", L"-\frac{3}{2}\pi", L"-\pi", L"-\frac{1}{2}\pi", L"0", L"\frac{1}{2}\pi", L"\pi", L"\frac{3}{2}\pi", L"2\pi"]
    ),
    xlabel=L"x",
    ylabel=L"\dot{x}"
)
stable_points = [Point2f(-7pi / 3, 0), Point2f(-pi / 3, 0), Point2f(5pi / 3, 0)]
unstable_points = [Point2f(-5pi / 3, 0), Point2f(pi / 3, 0), Point2f(7pi / 3, 0)]

x = range(-2.5pi, 2.5pi, length=100)
ẋ(x) = 1 - 2cos(x)

arrow_xs = vcat(
    [x - 0.3 for x in first.(stable_points)],
    [x + 0.3 for x in first.(stable_points)],
    [x - 0.15 for x in first.(unstable_points)],
    [x + 0.15 for x in first.(unstable_points)],
)
arrow_dxs = ẋ.(arrow_xs)
arrow_us = [ẋ(x) > 0 ? x + 0.1 : x - 0.1 for x in arrow_xs]
arrow_vs = ẋ.(arrow_us)

lines!(ax, x, ẋ, label=L"\dot{x} = 1 - 2\cos{x}", color="blue")
scatter!(ax, stable_points, marker=:circle, markersize=10, color="blue")
scatter!(ax, unstable_points, marker=:circle, markersize=10, color="blue")
scatter!(ax, unstable_points, marker=:circle, markersize=5, color="white")
arrows2d!(ax, arrow_xs, arrow_dxs, arrow_us, arrow_vs, shaftwidth=1, tipwidth=10, color="blue", argmode=:endpoint)

axislegend(position=:rt)

save("plots/ch02/ex2_2_6.pdf", fig)
