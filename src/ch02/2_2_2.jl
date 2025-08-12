using CairoMakie
using LaTeXStrings

fig = Figure()
ax = Axis(fig[1, 1], limits=((-1.1, 1.1), (-2, 1.5)), xlabel=L"x", ylabel=L"\dot{x}")

stable_points = [Point2f(1, 0)]
unstable_points = [Point2f(-1, 0)]

x = range(-1.1, 1.1, length=100)
ẋ(x) = 1 - x^14

arrow_xs = [-1.02, -0.95, 0.95, 1.04]
arrow_dxs = ẋ.(arrow_xs)
arrow_us = [ẋ(x) > 0 ? x + 0.01 : x - 0.01 for x in arrow_xs]
arrow_vs = ẋ.(arrow_us)

lines!(ax, x, ẋ, label=L"\dot{x} = 1 - x^{14}", color="blue")
scatter!(ax, stable_points, marker=:circle, markersize=10, color="blue")
scatter!(ax, unstable_points, marker=:circle, markersize=10, color="blue")
scatter!(ax, unstable_points, marker=:circle, markersize=5, color="white")
arrows2d!(ax, arrow_xs, arrow_dxs, arrow_us, arrow_vs, minshaftlength=0, shaftwidth=0.1, tipwidth=10, color="blue", argmode=:endpoint)

axislegend(position=:cb)

save("plots/ch02/ex2_2_2.pdf", fig)
