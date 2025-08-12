using CairoMakie
using LaTeXStrings

xs = [0.5π * x for x = -4:4]

fig = Figure()
ax = Axis(
    fig[1, 1],
    limits=((-2.5π, 2.5π), nothing),
    xticks=(
        xs,
        [L"-2\pi", L"-\frac{3}{2}\pi", L"-\pi", L"-\frac{1}{2}\pi", L"0", L"\frac{1}{2}\pi", L"\pi", L"\frac{3}{2}\pi", L"2\pi"]
    ),
    xlabel=L"x",
    ylabel=L"\dot{x}"
)

x = range(-2.5π, 2.5π, length=100)
ẋ(x) = 1 + (1 // 2)cos(x)

lines!(ax, x, ẋ, label=L"1 + \frac{1}{2}\cos{x}", color="blue")

axislegend(position=:rb)

save("plots/ch02/ex2_2_5.pdf", fig)
