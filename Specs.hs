import Test.Hspec
import Minefield

main = hspec $ do
    describe "label" $ do
        it "given a 1x1 mine field, labels it with *" $ do
            label ["*"] `shouldBe` ["*"]

        it "given a 1x1 free field, labels it with 0" $ do
            label ["."] `shouldBe` ["0"]

        it "given a 2x1 mine field at the end, labels it" $ do
            label [".*"] `shouldBe` ["1*"]

        it "given a 3x1 mine field at the end, labels it" $ do
            label ["..*"] `shouldBe` ["01*"]

        it "given a 2x1 mine field at the beginning, labels it" $ do
            label ["*."] `shouldBe` ["*1"]

        it "given a 1x2 mine field, labels it" $ do
            label ["*","."] `shouldBe` ["*","1"]
