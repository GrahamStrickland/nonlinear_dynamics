using CairoMakie
using LaTeXStrings

fig = Figure()
ax = Axis(fig[1, 1], limits=((0, 2), (-4, 4)), xlabel=L"t", ylabel=L"x")

t = range(0, 2, length=100)
x₁(t) = 2.0 * (1.0 - exp(16.0t)) / (1.0 + exp(16.0t))
x₂(t) = 2.0 * (1.0 + (1.0 / 3.0)exp(16.0t)) / (1.0 - (1.0 / 3.0)exp(16.0t))
x₃(t) = 2.0 * (1.0 + 3exp(16.0t)) / (1.0 - 3exp(16.0t))

lines!(ax, t, x₁, label=L"x_1(t) = 2\frac{1 - e^{16t}}{1 + e^{16t}}")
lines!(ax, t, x₂, label=L"x_2(t) = 2\frac{1 + \frac{1}{3}e^{16t}}{1 - \frac{1}{3}e^{16t}}")
lines!(ax, t, x₃, label=L"x_3(t) = 2\frac{1 + 3e^{16t}}{1 - 3e^{16t}}")
axislegend(position=:rt)

save("plots/ch02/fig2_2_1graph.pdf", fig)