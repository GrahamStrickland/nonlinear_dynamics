using CairoMakie
using LaTeXStrings

fig = Figure()
ax = Axis(fig[1, 1], xlabel=L"x", ylabel=L"\dot{x}")
stable_points = [Point2f(-4,0)]
unstable_points = [Point2f(4,0)]

x = range(-5, 5, length=100)
ẋ(x) = x^2 - 16

arrow_xs = [-5, -3, 3.75, 4.125]
arrow_dxs = ẋ.(arrow_xs)
arrow_us = [x < -4|| x > 4 ? x + 0.5 : x - 0.5 for x in arrow_xs]
arrow_vs = ẋ.(arrow_us)

lines!(ax, x, ẋ, label=L"\dot{x} = x^2 - 16", color="blue")
scatter!(ax, stable_points, marker=:circle, markersize=10, color="blue")
scatter!(ax, unstable_points, marker=:circle, markersize=10, color="blue")
scatter!(ax, unstable_points, marker=:circle, markersize=5, color="white")
arrows2d!(ax, arrow_xs, arrow_dxs, arrow_us, arrow_vs, shaftwidth=1, tipwidth=10, color="blue", argmode=:endpoint)

axislegend(position=:rt)

save("plots/ch02/ex2_2_1.pdf", fig)
