module Main where

    -- https://www.reddit.com/r/haskellquestions/comments/3of62e/the_io_action_main_is_not_defined_in_module_main/
    main :: IO ()
    main = return ()
    
    -- utility functions
    merge [] ys = ys
    merge (x:xs) ys = x:merge ys xs
                   
    -- the state
    the_states = ["TN", "MI", "AL", "GE", "FL"]
    
    -- boundaries
    touching = [ ("MI", "TN")
               , ("MI", "AL")
               , ("AL", "TN")
               , ("AL", "MI")
               , ("AL", "GE")
               , ("AL", "FL")
               , ("GE", "FL")
               , ("GE", "TN")]
    touching_reverse = [(snd x, fst x) | x <- touching]
    touching_all = merge touching touching_reverse
    
    -- the real code
    colour state neighbour_colours = if not (elem "red" neighbour_colours) then "red" : neighbour_colours else if not (elem "blue" neighbour_colours) then "blue" : neighbour_colours else "green" : neighbour_colours
    
    find_colours [] = []
    -- TODO pass neighbours instead of all others, or something
    find_colours (state:states) = colour state (find_colours states)