{-# OPTIONS -Wall #-}

module FlowsOnTheLine.Plots where

import Graphics.Matplotlib

type R = Double

-- Exercise 2.2.1

xRange2_2_1 :: [R]
xRange2_2_1 = [-3, -2.9 .. 3]

xDotPos2_2_1 ::
    R ->
    R
xDotPos2_2_1 x = 4 * x ** 2 - 16

plot2_2_1 :: Matplotlib
plot2_2_1 =
    setTeX True
        % plot x y
        @@ [o1 "b", o2 "zorder" (0 :: Int)]
        % scatter (map (\(x', _) -> x') stablePoints) (map (\(_, y') -> y') stablePoints)
        @@ [o2 "color" "b", o2 "marker" "o", o2 "zorder" (1 :: Int)]
        % scatter (map (\(x', _) -> x') unstablePoints) (map (\(_, y') -> y') unstablePoints)
        @@ [o2 "color" "b", o2 "marker" "o", o2 "zorder" (1 :: Int)]
        % scatter (map (\(x', _) -> x') unstablePoints) (map (\(_, y') -> y') unstablePoints)
        @@ [o2 "color" "w", o2 "marker" ".", o2 "zorder" (1 :: Int)]
        % scatter (map (\(x', _) -> x') leftArrows) (map (\(_, y') -> y') leftArrows)
        @@ [o2 "color" "b", o2 "marker" "<"]
        % scatter (map (\(x', _) -> x') rightArrows) (map (\(_, y') -> y') rightArrows)
        @@ [o2 "color" "b", o2 "marker" ">"]
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
    x = xRange2_2_1
    y = map xDotPos2_2_1 x
    stablePoints = [((-2, 0) :: (R, R))]
    unstablePoints = [((2, 0) :: (R, R))]
    leftArrows = [(x', xDotPos2_2_1 x') | x' <- [-2.3825, 2.3825]]
    rightArrows = [(x', xDotPos2_2_1 x') | x' <- [-1.5, 1.5]]

output2_2_1 :: IO (Either String String)
output2_2_1 = (file "plots/ch02/ex2_2_1.pdf") $ plot2_2_1

-- Exercise 2.2.2

xRange2_2_2 :: [R]
xRange2_2_2 = [-1.1, -1.09 .. 1.1]

xDotPos2_2_2 ::
    R ->
    R
xDotPos2_2_2 x = 1 - x**14

plot2_2_2 :: Matplotlib
plot2_2_2 =
    setTeX True
        % plot x y
        @@ [o1 "b", o2 "zorder" (0 :: Int)]
        % scatter (map (\(x', _) -> x') stablePoints) (map (\(_, y') -> y') stablePoints)
        @@ [o2 "color" "b", o2 "marker" "o", o2 "zorder" (1 :: Int)]
        % scatter (map (\(x', _) -> x') unstablePoints) (map (\(_, y') -> y') unstablePoints)
        @@ [o2 "color" "b", o2 "marker" "o", o2 "zorder" (1 :: Int)]
        % scatter (map (\(x', _) -> x') unstablePoints) (map (\(_, y') -> y') unstablePoints)
        @@ [o2 "color" "w", o2 "marker" ".", o2 "zorder" (1 :: Int)]
        % scatter (map (\(x', _) -> x') leftArrows) (map (\(_, y') -> y') leftArrows)
        @@ [o2 "color" "b", o2 "marker" "<"]
        % scatter (map (\(x', _) -> x') rightArrows) (map (\(_, y') -> y') rightArrows)
        @@ [o2 "color" "b", o2 "marker" ">"]
        % spine "bottom"
        % spineSetPosition "'data'" (0 :: R)
        % spine "left"
        % spineSetPosition "'data'" (0 :: R)
        % spine "right"
        % spineSetVisible False
        % spine "top"
        % spineSetVisible False
        % xticks [(-1 :: R), (1 :: R)]
        % xlabel "$x$"
        @@ [o2 "rotation" "horizontal", o2 "loc" "right"]
        % yticks [(-1 :: R), (1 :: R)]
        % ylabel "$\\dot{x}$"
        @@ [o2 "rotation" "horizontal", o2 "loc" "top"]
  where
    x = xRange2_2_2
    y = map xDotPos2_2_2 x
    stablePoints = [((1, 0) :: (R, R))]
    unstablePoints = [((-1, 0) :: (R, R))]
    leftArrows = [(x', xDotPos2_2_2 x') | x' <- [-1.05, 1.05]]
    rightArrows = [(x', xDotPos2_2_2 x') | x' <- [-0.9, 0.9]]

output2_2_2 :: IO (Either String String)
output2_2_2 = (file "plots/ch02/ex2_2_2.pdf") $ plot2_2_2

-- Exercise 2.2.3

xRange2_2_3 :: [R]
xRange2_2_3 = [-1.5, -1.49 .. 1.5]

xDotPos2_2_3 ::
    R ->
    R
xDotPos2_2_3 x = x - x**3

plot2_2_3 :: Matplotlib
plot2_2_3 =
    setTeX True
        % plot x y
        @@ [o1 "b", o2 "zorder" (0 :: Int)]
        % scatter (map (\(x', _) -> x') stablePoints) (map (\(_, y') -> y') stablePoints)
        @@ [o2 "color" "b", o2 "marker" "o", o2 "zorder" (1 :: Int)]
        % scatter (map (\(x', _) -> x') unstablePoints) (map (\(_, y') -> y') unstablePoints)
        @@ [o2 "color" "b", o2 "marker" "o", o2 "zorder" (1 :: Int)]
        % scatter (map (\(x', _) -> x') unstablePoints) (map (\(_, y') -> y') unstablePoints)
        @@ [o2 "color" "w", o2 "marker" ".", o2 "zorder" (1 :: Int)]
        % scatter (map (\(x', _) -> x') leftArrows) (map (\(_, y') -> y') leftArrows)
        @@ [o2 "color" "b", o2 "marker" "<"]
        % scatter (map (\(x', _) -> x') rightArrows) (map (\(_, y') -> y') rightArrows)
        @@ [o2 "color" "b", o2 "marker" ">"]
        % spine "bottom"
        % spineSetPosition "'data'" (0 :: R)
        % spine "left"
        % spineSetPosition "'data'" (0 :: R)
        % spine "right"
        % spineSetVisible False
        % spine "top"
        % spineSetVisible False
        % xticks [(-1 :: R), (1 :: R)]
        % xlabel "$x$"
        @@ [o2 "rotation" "horizontal", o2 "loc" "right"]
        % yticks [(-1 :: R), (1 :: R)]
        % ylabel "$\\dot{x}$"
        @@ [o2 "rotation" "horizontal", o2 "loc" "top"]
  where
    x = xRange2_2_3
    y = map xDotPos2_2_3 x
    stablePoints = [((-1, 0) :: (R, R)), ((1, 0) :: (R, R))]
    unstablePoints = [((0,0) :: (R,R))]
    leftArrows = [(x', xDotPos2_2_3 x') | x' <- [-0.75, -0.25, 1.25]]
    rightArrows = [(x', xDotPos2_2_3 x') | x' <- [-1.25, 0.25, 0.75]]

output2_2_3 :: IO (Either String String)
output2_2_3 = (file "plots/ch02/ex2_2_3.pdf") $ plot2_2_3
