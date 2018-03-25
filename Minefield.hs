module Minefield
where

label ["*"] = ["*"]
label ["."] = ["0"]
label [".*"] = ["1*"]
