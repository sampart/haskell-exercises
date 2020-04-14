module Main where

    import Debug.Trace
    debug = flip trace

    -- https://www.reddit.com/r/haskellquestions/comments/3of62e/the_io_action_main_is_not_defined_in_module_main/
    main :: IO ()
    main = return ()
    
    sort [] = [] --`debug` "\n-- []"
    sort [n] = [n] --`debug` ("\n--" ++ show([n]))
    sort (n:ns) = if n < head(ns)
        then (n:sort(ns)) --`debug` "\na"
        else head(ns) : sort(n : (tail ns)) --`debug` "\nb"
    
    
    -- todo try this form
    -- isPos n 
    -- | n<0       = False
    -- | otherwise = True