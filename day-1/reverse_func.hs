module Main where

    -- https://www.reddit.com/r/haskellquestions/comments/3of62e/the_io_action_main_is_not_defined_in_module_main/
    main :: IO ()
    main = return ()

    append a [] = [a]
    append a (h:t) = h : append a t
    
    reverse_it [] = []
    reverse_it (h:t) = append h (reverse_it t)
    