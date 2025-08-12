using CairoMakie
using LaTeXStrings

xs = [0.5pi * x for x = -4:4]

fig = Figure()
ax = Axis(
    fig[1, 1],
    limits=((-2.5π, 2.5π), (-10, 10)),
    xticks=(
        xs,
        [L"-2\pi", L"-\frac{3}{2}\pi", L"-\pi", L"-\frac{1}{2}\pi", L"0", L"\frac{1}{2}\pi", L"\pi", L"\frac{3}{2}\pi", L"2\pi"]
    ),
    xlabel=L"x",
    ylabel=L"\dot{x}"
)
stable_points = [Point2f(-π, 0), Point2f(π, 0)]
unstable_points = [Point2f(-2π, 0), Point2f(0, 0), Point2f(2π, 0)]

x = range(-2.5π, 2.5π, length=100)
ẋ(x) = exp(-x) * sin(x)

arrow_xs = vcat(
    [x - 0.2 for x in first.(stable_points)],
    [x + 0.2 for x in first.(stable_points)],
    [x - 0.4 for x in first.(unstable_points)],
    [x + 0.4 for x in first.(unstable_points)],
)
arrow_dxs = ẋ.(arrow_xs)
arrow_us = [ẋ(x) > 0 ? x + 0.1 : x - 0.1 for x in arrow_xs]
arrow_vs = ẋ.(arrow_us)

lines!(ax, x, ẋ, label=L"\dot{x} = x - x^3", color="blue")
scatter!(ax, stable_points, marker=:circle, markersize=10, color="blue")
scatter!(ax, unstable_points, marker=:circle, markersize=10, color="blue")
scatter!(ax, unstable_points, marker=:circle, markersize=5, color="white")
arrows2d!(ax, arrow_xs, arrow_dxs, arrow_us, arrow_vs, shaftwidth=1, tipwidth=10, color="blue", argmode=:endpoint)

axislegend(position=:rt)

save("plots/ch02/ex2_2_4.pdf", fig)
