module Main where

    -- https://www.reddit.com/r/haskellquestions/comments/3of62e/the_io_action_main_is_not_defined_in_module_main/
    main :: IO ()
    main = return ()

    -- params for do_colour_states are (1) states with no colour assigned (list of state abbreviations), (2) states with colour assigned (list of (state, colour) tuples)
    
    -- if all states coloured in, return the list of tuples
    do_colour_states :: [[Char]] -> [([Char], [Char])] -> [([Char], [Char])]
    do_colour_states [] coloured = coloured
        
    do_colour_states (u:us) coloured = do_colour_states us ((u, get_colour u coloured) : coloured)
    
    get_colour :: [Char] -> [([Char], [Char])] -> [Char]
    get_colour state coloured = if notElem "red" (map snd (neighbours state coloured)) then "red" else if notElem "green" (map snd (neighbours state coloured)) then "green" else "blue"
    
    neighbours :: [Char] -> [([Char], [Char])] -> [([Char], [Char])]
    neighbours state [] = []
    neighbours state ((other_state, colour):us) = if neighbour state other_state then (other_state, colour) : neighbours state us else neighbours state us
    
    -- todo this could probably find negatives instead and be shorted
    neighbour :: [Char] -> [Char] -> Bool
    neighbour "TN" "MI" = True
    neighbour "TN" "AL" = True
    neighbour "TN" "GE" = True
    neighbour "MI" "TN" = True
    neighbour "MI" "AL" = True
    neighbour "AL" "TN" = True
    neighbour "AL" "MI" = True
    neighbour "AL" "GE" = True
    neighbour "AL" "FL" = True
    neighbour "GE" "TN" = True
    neighbour "GE" "AL" = True
    neighbour "GE" "FL" = True
    neighbour "FL" "AL" = True
    neighbour "FL" "GE" = True
    neighbour state other_state = False

    -- colour_states ["TN", "MI", "AL", "GE", "FL"]
    colour_states states = do_colour_states states []
