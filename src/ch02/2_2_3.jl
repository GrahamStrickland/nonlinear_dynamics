using CairoMakie
using LaTeXStrings

fig = Figure()
ax = Axis(fig[1, 1], limits=((-1.5, 1.5), nothing), xlabel=L"x", ylabel=L"\dot{x}")
stable_points = [Point2f(0, 0)]
unstable_points = [Point2f(-1, 0), Point2f(1, 0)]

x = range(-1.5, 1.5, length=100)
ẋ(x) = x - x^3

arrow_xs = [-1.25, -0.75, -0.25, 0.25, 0.75, 1.25]
arrow_dxs = ẋ.(arrow_xs)
arrow_us = [ẋ(x) > 0 ? x + 0.1 : x - 0.1 for x in arrow_xs]
arrow_vs = ẋ.(arrow_us)

lines!(ax, x, ẋ, label=L"\dot{x} = x - x^3", color="blue")
scatter!(ax, stable_points, marker=:circle, markersize=10, color="blue")
scatter!(ax, unstable_points, marker=:circle, markersize=10, color="blue")
scatter!(ax, unstable_points, marker=:circle, markersize=5, color="white")
arrows2d!(ax, arrow_xs, arrow_dxs, arrow_us, arrow_vs, shaftwidth=1, tipwidth=10, color="blue", argmode=:endpoint)

axislegend(position=:rt)

save("plots/ch02/ex2_2_3.pdf", fig)
