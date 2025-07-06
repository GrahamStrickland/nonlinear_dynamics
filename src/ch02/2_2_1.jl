using CairoMakie
using LaTeXStrings

fig = Figure()
ax = Axis(fig[1, 1], xlabel=L"x", ylabel=L"\dot{x}")
stable_points = [Point2f(-4,0)]
unstable_points = [Point2f(4,0)]

x = range(-5, 5, length=100)

function ẋ(x)
    return x^2 - 16
end

lines!(ax, x, ẋ, label=L"\dot{x} = x^2 - 16", color="blue")
scatter!(ax, stable_points, marker=:circle, markersize=10, color="blue")
scatter!(ax, unstable_points, marker=:circle, markersize=10, color="blue")
scatter!(ax, unstable_points, marker=:circle, markersize=5, color="white")
axislegend(position=:rt)

save("plots/ch02/ex2_2_1.pdf", fig)
