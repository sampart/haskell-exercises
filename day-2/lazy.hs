module Main where

    -- https://www.reddit.com/r/haskellquestions/comments/3of62e/the_io_action_main_is_not_defined_in_module_main/
    main :: IO ()
    main = return ()
    
    every_third x = x : (every_third (x + 3))
    
    every_fifth y = y : (every_fifth (y + 5))
    
    -- adapted from https://github.com/kikito/7-languages-in-7-weeks/blob/master/7-haskell/day-2/lazy.hs; I couldn't solve it myself
    every_eighth x y = zipWith (+) (every_third x) (every_fifth y)