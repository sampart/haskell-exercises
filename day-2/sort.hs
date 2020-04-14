module Main where

    import Debug.Trace
    debug = flip trace

    -- https://www.reddit.com/r/haskellquestions/comments/3of62e/the_io_action_main_is_not_defined_in_module_main/
    main :: IO ()
    main = return ()
    
    sort x = let l_stat = sort_and_report x in
        if status(l_stat) == False
            then list(l_stat)
            else sort(list(l_stat))
        where status = snd
              list = fst
    
    -- second value of tuple is whether any sorting occurred
    sort_and_report [] = ([], False) --`debug` "\n-- []"
    sort_and_report [n] = ([n], False) --`debug` ("\n--" ++ show([n]))
    sort_and_report (n:ns) = if n <= head(ns)
        then let x = sort_and_report(ns) in ((n:list(x)), status(x)) --`debug` "\na"
        else let x = sort_and_report(n : (tail ns)) in ((head(ns) : list(x)), True) --`debug` "\nb"
        
        where status = snd
              list = fst
