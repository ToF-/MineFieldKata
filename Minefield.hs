module Minefield
where

label [s] = [zipWith merge (labelLeft s) (labelRight s)]
    where 
    danger '*' '.' = '*'
    danger '.' '.' = '0'
    danger '.' '*' = '1'
    labelLeft s  = zipWith danger s ((tail s)++".")
    labelRight s = reverse (labelLeft (reverse s)) 
    merge '*'  _  = '*'
    merge '0' '0' = '0'
    merge '0' '1' = '1'
    merge '1' '0' = '1'
    
