import Test.Hspec
import Minefield

main = hspec $ do
    describe "mapField" $ do
        it "given a 1x1 mine field, labels it with *" $ do
            mapField ["*"] `shouldBe` ["*"]

        it "given a 1x1 clear field, labels it with 0" $ do
            mapField ["."] `shouldBe` ["0"]

        it "given a 2x1 clear field, labels it with 00" $ do
            mapField [".."] `shouldBe` ["00"]

        it "given a 2x1 mined field, labels it with **" $ do
            mapField ["**"] `shouldBe` ["**"]

        it "given a 2x1 field with 1 mine, labels it with 1*" $ do
            mapField [".*"] `shouldBe` ["1*"]

        it "given a 3x1 field ending with 1 mine, labels it with 01*" $ do
            mapField ["..*"] `shouldBe` ["01*"]

        it "given a 3x1 field beginning with 1 mine, labels it with *10" $ do
            mapField ["*.."] `shouldBe` ["*10"]

        it "given a 2 rows clear field, labels it with 0,0" $ do
            mapField [".","."] `shouldBe` ["0","0"]

        it "given a 2 rows mine field, labels it with 0,1" $ do
            mapField [".","*"] `shouldBe` ["1","*"]

        it "given a 2x2 rows mine field, labels it" $ do
            mapField ["*.",
                      ".*"] `shouldBe` ["*2"
                                       ,"2*"]

        it "given a 2x2 rows mine field with mine south east, labels it" $ do
            mapField [".."
                     ,".*"] `shouldBe` ["11"
                                       ,"1*"]

        it "given a 2x2 rows mine field with mine north west, labels it" $ do
            mapField ["*."
                     ,".."] `shouldBe` ["*1"
                                       ,"11"]

        it "given the test case field, labels it" $ do
            mapField ["*..."
                     ,"..*."
                     ,".*.."] `shouldBe` ["*211"
                                         ,"23*1"
                                         ,"1*21"]
