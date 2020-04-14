module Main where

    -- https://www.reddit.com/r/haskellquestions/comments/3of62e/the_io_action_main_is_not_defined_in_module_main/
    main :: IO ()
    main = return ()
    
    -- fun returns True if its args are in the right order
    sort x fun = let l_stat = sort_and_report x fun in
        if status(l_stat) == False
            then list(l_stat)
            else sort (list(l_stat)) fun
        where status = snd
              list = fst
    
    -- second value of tuple is whether any sorting occurred
    sort_and_report [] fun = ([], False)
    sort_and_report [n] fun = ([n], False)
    sort_and_report (n:ns) fun = if (fun n (head(ns))) == True
        then let x = sort_and_report ns fun in ((n:list(x)), status(x))
        else let x = sort_and_report(n : (tail(ns))) fun in ((head(ns) : list(x)), True)
        
        where status = snd
              list = fst
