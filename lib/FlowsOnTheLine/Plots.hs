{-# OPTIONS -Wall #-}

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
        @@ [o1 "b", o2 "zorder" (0 :: Int)]
        % scatter (map (\(x',_) -> x') stablePoints) (map (\(_,y') -> y') stablePoints)
        @@ [o2 "color" "b", o2 "marker" "o", o2 "zorder" (1 :: Int)]
        % scatter (map (\(x',_) -> x') stablePoints) (map (\(_,y') -> y') stablePoints)
        @@ [o2 "color" "w", o2 "marker" ".", o2 "zorder" (1 :: Int)]
        % scatter (map (\(x',_) -> x') unstablePoints) (map (\(_,y') -> y') unstablePoints)
        @@ [o2 "color" "b", o2 "marker" "o", o2 "zorder" (1 :: Int)]
        % spine "bottom"
        % spineSetPosition "'data'" (0 :: R)
        % spine "left"
        % spineSetPosition "'data'" (0 :: R)
        % spine "right"
        % spineSetVisible False
        % spine "top"
        % spineSetVisible False
        % xticks [(-2 :: R), (2 :: R)]
        % xlabel "$x$"
        @@ [o2 "rotation" "horizontal", o2 "loc" "right"]
        % yticks [(-16 :: R)]
        % ylabel "$\\dot{x}$"
        @@ [o2 "rotation" "horizontal", o2 "loc" "top"]
  where
    x = xRange
    y = map xDotPos x
    stablePoints = [((-2, 0) :: (R,R))]
    unstablePoints = [((2, 0) :: (R,R))]

output2_2_1 :: IO (Either String String)
output2_2_1 = (file "plots/ch02/ex2_2_1.pdf") $ plot2_2_1
