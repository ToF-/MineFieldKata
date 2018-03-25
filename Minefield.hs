module Minefield
where
import Data.Char (digitToInt, intToDigit)

label [s] = [zipWith merge (labelLeft s) (labelRight s)]
    where 
    danger '*' '.' = '*'
    danger '.' '.' = '0'
    danger '.' '*' = '1'
    labelLeft s  = zipWith danger s ((tail s)++".")
    labelRight s = reverse (labelLeft (reverse s)) 
    merge '*'  _  = '*'
    merge  _  '*' = '*'
    merge c d = intToDigit (digitToInt c + digitToInt d)
    
