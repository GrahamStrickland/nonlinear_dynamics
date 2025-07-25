{-# OPTIONS_GHC -Wall #-}

module FlowsOnTheLine.Plots where

import Graphics.Matplotlib

type R = Double

xRange :: [R]
xRange = [-3, -2.9 .. 3]

xDotPos ::
    R ->
    R
xDotPos x = 4 * x ** 2 - 16

plot2_2_1 :: Matplotlib
plot2_2_1 =
    setTeX True
        % plot x y
        @@ [o1 "b"]
        % spine "bottom"
        % spineSetPosition "'data'" (0 :: R)
        % spine "left"
        % spineSetPosition "'data'" (0 :: R)
        % spine "right"
        % spineSetVisible False
        % spine "top"
        % spineSetVisible False
        % xlabel "$x$"
        % ylabel "$\\dot{x}$"
        % title "Ex. 2.2.1"
  where
    x = xRange
    y = map xDotPos x

output2_2_1 :: IO (Either String String)
output2_2_1 = (file "plots/ch02/ex2_2_1.pdf") $ plot2_2_1
