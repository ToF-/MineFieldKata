module Minefield
where
import Data.Char (digitToInt, intToDigit)
import Data.List (transpose)

label ["*","."] = ["*","1"]
label ss = labelHorz ss
    where 
    labelHorz = map labelRow
    labelVert = transpose (map labelRow (transpose ss))
    danger '*' '.' = '*'
    danger '.' '.' = '0'
    danger '.' '*' = '1'
    labelLeft s  = zipWith danger s ((tail s)++".")
    labelRight s = reverse (labelLeft (reverse s)) 
    merge '*'  _  = '*'
    merge  _  '*' = '*'
    merge c d = intToDigit (digitToInt c + digitToInt d)
    labelRow s = zipWith merge (labelLeft s) (labelRight s)
