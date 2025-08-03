using CairoMakie
using LaTeXStrings

xs = [0.5 * pi * x for x = -4:4]

fig = Figure()
ax = Axis(
    fig[1, 1],
    xticks=(
        xs,
        [L"-2\pi", L"-\frac{3}{2}\pi", L"-\pi", L"-\frac{1}{2}\pi", L"0", L"\frac{1}{2}\pi", L"\pi", L"\frac{3}{2}\pi", L"2\pi"]
    ),
    xlabel=L"x",
    ylabel=L"\dot{x}"
)
stable_points = [Point2f(-pi, 0), Point2f(pi, 0)]
unstable_points = [Point2f(-2 * pi, 0), Point2f(0, 0), Point2f(2 * pi, 0)]

x = range(-2 * pi, 2 * pi, length=100)
ẋ(x) = exp(-x) * sin(x)

arrow_xs = [xp - 0.1 for xp in [x for x in xs if -2 * pi < x]] + [xp + 0.1 for xp in [x for x in xs if x < 2 * pi]]
arrow_dxs = ẋ.(arrow_xs)
arrow_us = [ẋ(x) > 0 ? x + 0.01 : x - 0.01 for x in arrow_xs]
arrow_vs = ẋ.(arrow_us)

lines!(ax, x, ẋ, label=L"\dot{x} = x - x^3", color="blue")
scatter!(ax, stable_points, marker=:circle, markersize=10, color="blue")
scatter!(ax, unstable_points, marker=:circle, markersize=10, color="blue")
scatter!(ax, unstable_points, marker=:circle, markersize=5, color="white")
arrows2d!(ax, arrow_xs, arrow_dxs, arrow_us, arrow_vs, shaftwidth=1, tipwidth=10, color="blue", argmode=:endpoint)

axislegend(position=:rt)

save("plots/ch02/ex2_2_4.pdf", fig)
