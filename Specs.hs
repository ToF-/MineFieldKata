import Test.Hspec
import Minefield

main = hspec $ do
    describe "label" $ do
        it "given a 1x1 mine field, labels it with *" $ do
            label ["*"] `shouldBe` ["*"]
