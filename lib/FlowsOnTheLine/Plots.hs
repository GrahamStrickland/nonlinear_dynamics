{-# OPTIONS_GHC -Wall #-}

module FlowsOnTheLine.Plots where

import Graphics.Gnuplot.Simple

type R = Double

xRange :: [R]
xRange = [-3,-2.9..3]

xDotPos :: R -- x
        -> R -- xDot
xDotPos x = 4 * x**2 - 16

plot2_1 :: IO ()
plot2_1
    = plotFunc [Title "Exercise 2.2.1"
               ,XLabel "x"
               ,YLabel "dx/dt"
               ,PNG "plots/ch02/ex2_2_1.png"
               ,Key Nothing
               ] xRange xDotPos

