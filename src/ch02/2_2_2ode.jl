using Symbolics

@variables t
@syms x(t)

expr = Symbolics.derivative(x, t) + x^14 - 1
sol = Symbolics.sympy_ode_solve(expr, x, t)
print(sol)
