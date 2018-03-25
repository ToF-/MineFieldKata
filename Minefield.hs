module Minefield
where

label [s] = [zipWith danger s ((tail s)++".")]
    where 
    danger '*' '.' = '*'
    danger '.' '.' = '0'
    danger '.' '*' = '1'

