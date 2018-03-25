module Minefield
where

label ["*."] = ["*1"]
label [s] = [zipWith danger s ((tail s)++".")]
    where 
    danger '*' '.' = '*'
    danger '.' '.' = '0'
    danger '.' '*' = '1'

