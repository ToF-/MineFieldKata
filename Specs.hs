import Test.Hspec
import Minefield

main = hspec $ do
    describe "label" $ do
        it "given a 1x1 mine field, labels it with *" $ do
            label ["*"] `shouldBe` ["*"]

        it "given a 1x1 free field, labels it with 0" $ do
            label ["."] `shouldBe` ["0"]
