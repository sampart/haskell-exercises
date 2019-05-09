module Main where

    import Data.Maybe

    -- https://www.reddit.com/r/haskellquestions/comments/3of62e/the_io_action_main_is_not_defined_in_module_main/
    main :: IO ()
    main = return ()
    
    allEven :: [Integer] -> [Integer]
    allEven [] = []
    allEven (h:t) = if even h then h : allEven t else allEven t
    
    allEven2 :: [Integer] -> [Integer]
    allEven2 l = [i | i <- l, even i]
    
    allEven3 :: [Integer] -> [Integer]
    allEven3 l = [i | i <- l, mod i 2 == 0]
    
    allEven4 :: [Integer] -> [Integer]
    allEven4 l = [i | i <- l, i `mod` 2 == 0]
    
    allEven5 :: [Integer] -> [Integer]
    allEven5 l = filter even l 
    
    allEven6 :: [Integer] -> [Integer]
    allEven6 l = mapMaybe (\x -> if even x then Just x else Nothing) l
    
    allEven7 :: [Integer] -> [Maybe Integer]
    allEven7 l = filter (not . isNothing) (map (\x -> if even x then Just x else Nothing) l)
    
    -- build our own mapMaybe...
    -- https://stackoverflow.com/a/4940615/328817
    allEven8 :: [Integer] -> [Integer]
    allEven8 l = map (maybe 0 id) (allEven7 l)