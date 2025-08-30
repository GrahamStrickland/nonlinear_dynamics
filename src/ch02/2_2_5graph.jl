using CairoMakie
using LaTeXStrings

fig = Figure()
ax = Axis(
    fig[1, 1], 
    limits=((0, 8π), nothing), 
    xticks=(
        [2x*π for x = 0:4], 
        [L"0", L"2\pi", L"4\pi", L"6\pi", L"8\pi"]
    ),
    xlabel=L"t", 
    ylabel=L"x"
)

t = range(0, 8π, length=100)
x₁(t) = 2atan(sqrt(3) * tan(t * (sqrt(3) / 4)))

lines!(ax, t, x₁, label=L"x(t) = 2\tan^{-1}{[\sqrt{3}\tan{(t\sqrt{3}/4)}]}")
axislegend(position=:rt)

save("plots/ch02/fig2_2_5graph.pdf", fig)
