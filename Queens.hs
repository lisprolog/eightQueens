module Main where

main  = print $ queens 10

boardSize = 10

queens 0 = [[]]
queens n = [ x : y | y <- queens (n-1), x <- [1..boardSize], safe x y 1]
      where
         safe x [] n = True
         safe x (c:y) n = and [ x /= c , x /= c + n , x /= c - n , safe x y (n+1)]
