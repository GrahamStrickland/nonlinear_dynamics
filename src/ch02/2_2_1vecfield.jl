using CairoMakie
using LaTeXStrings

fig = Figure()
ax = Axis(fig[1, 1], limits=((-3, 3), nothing), xlabel=L"x", ylabel=L"\dot{x}")

x = range(-3, 3, length=100)
ẋ(x) = 4 * x^2 - 16

stable_points = [Point2f(-2, 0)]
unstable_points = [Point2f(2, 0)]

arrow_xs = [-2.75, -1.25, 1.75, 2.25]
arrow_dxs = ẋ.(arrow_xs)
arrow_us = [ẋ(x) > 0 ? x + 0.25 : x - 0.25 for x in arrow_xs]
arrow_vs = ẋ.(arrow_us)

lines!(ax, x, ẋ, label=L"\dot{x} = 4x^2 - 16", color="blue")
scatter!(ax, stable_points, marker=:circle, markersize=10, color="blue")
scatter!(ax, unstable_points, marker=:circle, markersize=10, color="blue")
scatter!(ax, unstable_points, marker=:circle, markersize=5, color="white")
arrows2d!(ax, arrow_xs, arrow_dxs, arrow_us, arrow_vs, shaftwidth=1, tipwidth=10, color="blue", argmode=:endpoint)

axislegend(position=:rt)

save("plots/ch02/fig2_2_1vecfield.pdf", fig)
