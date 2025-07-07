using CairoMakie
using LaTeXStrings

fig = Figure()
ax = Axis(fig[1, 1], xlabel=L"x", ylabel=L"\dot{x}")
unstable_points = [Point2f(-1,0), Point2f(1,0)]

x = range(-1.25, 1.25, length=100)
ẋ(x) = 1 - x^14

arrow_xs = [-1.1, -1, 1, 1.1]
arrow_dxs = ẋ.(arrow_xs)
arrow_us = [x < -1 || x > 0 && x < 1 ? x - 0.03 : x + 0.03 for x in arrow_xs]
arrow_vs = ẋ.(arrow_us)

lines!(ax, x, ẋ, label=L"\dot{x} = 1 - x^{14}", color="blue")
scatter!(ax, unstable_points, marker=:circle, markersize=10, color="blue")
scatter!(ax, unstable_points, marker=:circle, markersize=5, color="white")
arrows2d!(ax, arrow_xs, arrow_dxs, arrow_us, arrow_vs, shaftwidth=1, tipwidth=20, color="blue", argmode=:endpoint)

axislegend(position=:cb)

save("plots/ch02/ex2_2_2.pdf", fig)
