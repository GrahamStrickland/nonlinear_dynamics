from sympy import Function, Derivative, dsolve
from sympy.abc import t, V, R, C


def solution_ex2_2_11():
    Q = Function("Q")

    soln = dsolve(Derivative(Q(t), t) + (Q(t) / (R * C)) - (V / R), Q(t), ics={Q(0): 0})  # type: ignore
    print("Exercise 2.2.11:")
    print(soln)
