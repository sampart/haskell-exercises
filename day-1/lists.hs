module Main where

    -- https://www.reddit.com/r/haskellquestions/comments/3of62e/the_io_action_main_is_not_defined_in_module_main/
    main :: IO ()
    main = return ()
    
    size [] = 0
    size (h:t) = 1 + size t
    
    prod [] = 1
    prod (h:t) = h * prod t