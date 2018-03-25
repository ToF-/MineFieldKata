module Minefield
where
import Data.Char (intToDigit)
import Data.List (transpose)

type Field = [String]
type MappedField = [String]
type MineMap = [[Int]]
data Direction = North | South | West | East | NorthWest | SouthWest | NorthEast | SouthEast
    deriving (Enum,Bounded,Show)

mapField :: Field -> MappedField
mapField grid = merge label (mineCount grid) grid
    where 
    label :: Int -> Char -> Char
    label _ '*' = '*'
    label c '.' = intToDigit c

merge f = zipWith (zipWith f)
plus = merge (+)

mineCount :: Field -> MineMap
mineCount field = foldl1 plus (map (flip shift mineMapField) directions)
    where
    directions = (enumFromTo minBound maxBound)
    mineMapField = mineMap field
        
left = tail . (++[0])
right = reverse . left . reverse

shiftHorz f = map f
shiftVert f = transpose . map f . transpose 

shift :: Direction -> MineMap -> MineMap
shift North = shiftVert right
shift South = shiftVert left
shift West = shiftHorz left
shift East = shiftHorz right
shift NorthWest = shift North . shift West 
shift SouthWest = shift South . shift West
shift NorthEast = shift North . shift East
shift SouthEast = shift South . shift East

mineMap :: Field -> MineMap
mineMap = map (map count)

count :: Char -> Int
count '.' = 0
count '*' = 1 
