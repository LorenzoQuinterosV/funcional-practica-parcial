module Spec where
import PdePreludat
import Library
import Test.Hspec
import Control.Exception (evaluate)

simple :: Hamburguesa
simple = Hamburguesa {
    precioBase = 20,
    ingredientes = [Pan, Carne, Pan]
}
triple :: Hamburguesa
triple = Hamburguesa {
    precioBase = 30,
    ingredientes = [Pan, Carne, Cheddar, Carne, Cheddar, Carne, Cheddar, Pan]
}
pollo :: Hamburguesa
pollo = Hamburguesa {
    precioBase = 25,
    ingredientes = [Pan, Pollo, Pan]
}
vegana :: Hamburguesa
vegana = Hamburguesa {
    precioBase = 25,
    ingredientes = [Pan, BaconDeTofu, QuesoDeAlmendras, Pan]
}
americana :: Hamburguesa
americana = hamburguesaSimple = Hamburguesa {
    precioBase = 40,
    ingredientes = [Pan, Carne, Panceta, Cheddar, Panceta, Cheddar, Pan]
}


correrTests :: IO ()
correrTests = hspec $ do
    describe "TP 5" $ do
        it "test de prueba" $ do
            2 + 2 `shouldBe` 4

    describe "Parte 1, hamburguesas"
        it "calcular precio hamburguesa simple" $ do
            calcularPrecio simple `shouldBe` 44
        it "calcular precio hamburguesa triple" $ do
            calcularPrecio triple `shouldBe` 124
        it "calcular precio hamburguesa vegana" $ do
            calcularPrecio vegana `shouldBe` 56
        it "calcular precio hamburguesa pdepburger" $ do
            calcularPrecio pdepBurger `shouldBe` 110

        it "agrandar simple" $ do
            agrandar simple `shouldBe` Hamburguesa {
            precioBase = 20,
            ingredientes = [Carne, Pan, Carne, Pan]
        }
        it "agrandar pollo" $ do
            agrandar pollo `shouldBe` Hamburguesa {
            precioBase = 25,
            ingredientes = [Pollo, Pan, Carne, Pan]
        }
     
        it "descontar 40% precio hamburguesa triple" $ do
            descuento 40 triple `shouldBe` Hamburguesa {
            precioBase = 18,
            ingredientes = [Pan, Carne, Cheddar, Carne, Cheddar, Carne, Cheddar, Pan]
            }
        it "descontar 50% precio hamburguesa americana" $ do
            descuento 50 americana `shouldBe` Hamburguesa {
            precioBase = 20,
            ingredientes = [Pan, Carne, Panceta, Cheddar, Panceta, Cheddar, Pan]
            }
        
    describe "Parte 2, mas burgas"
        it "calcular precio hamburguesa doble cuarto" $ do
            calcularPrecio dobleCuarto `shouldBe` 84
        it "calcular precio hamburguesa bigPdeP" $ do
            calcularPrecio bigPdeP `shouldBe` 89
        it "hacer una hamburguesa del dia a la hamburguesa simple" $ do
            delDia simple `shouldBe` Hamburguesa {
                precioBase = 14,
                ingredientes = [Papas, Pan, Carne, Pan]
            }
        it "hacer una hamburguesa del dia a la hamburguesa bigPdeP" $ do
            delDia bigPdeP `shouldBe` Hamburguesa {
                precioBase = 14,
                ingredientes = [Papas, Curry, Carne, Cheddar, Pan, Carne, Cheddar, Pan]
            }
        it "calcular precio hamburguesa doble cuarto del dia" $ do
            calcularPrecio (delDia dobleCuarto) `shouldBe` 88

    describe "Parte 3, mas burgas^2"
        it "hacer veggie hamburguesa doble cuarto del dia" $ do
            hacerVeggie (delDia dobleCuarto) `shouldBe` Hamburguesa {
                precioBase = 14,
                ingredientes = [Papas, Curry, PatiVegano, QuesoDeAlmendras, Pan, PatiVegano, QuesoDeAlmendras, Pan]
            }
        it "hacer veggie hamburguesa bigPdeP del dia" $ do
            hacerVeggie (delDia bigPdeP) `shouldBe` Hamburguesa {
                precioBase = 14,
                ingredientes = [Papas, Curry, PatiVegano, QuesoDeAlmendras, Pan, PatiVegano, QuesoDeAlmendras, Pan]
            }
        it "cambiar pan de hamburguesa simple" $ do
            cambiarPandePati simple `shouldBe` Hamburguesa {
                precioBase = 20,
                ingredientes = [PanIntegral, Carne, PanIntegral]
            }