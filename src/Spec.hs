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
americana = Hamburguesa {
    precioBase = 40,
    ingredientes = [Pan, Carne, Panceta, Cheddar, Panceta, Cheddar, Pan]
}

correrTests :: IO ()
correrTests = hspec $ do
    describe "TP 5" $ do
        it "test de prueba" $ do
            2 + 2 `shouldBe` 4

    describe "Parte 1, hamburguesas" $ do
        it "calcular precio hamburguesa simple" $ 
            calcularPrecio simple `shouldBe` 44
        it "calcular precio hamburguesa triple" $ 
            calcularPrecio triple `shouldBe` 124
        it "calcular precio hamburguesa vegana" $ 
            calcularPrecio vegana `shouldBe` 56
        it "calcular precio hamburguesa pdepburger" $ 
            calcularPrecio pdepBurguer `shouldBe` 110

        it "agrandar simple" $ 
            agrandar simple `shouldBe` Hamburguesa {
                precioBase = 20,
                ingredientes = [Carne, Pan, Carne, Pan]
            }
        it "agrandar pollo" $ 
            agrandar pollo `shouldBe` Hamburguesa {
                precioBase = 25,
                ingredientes = [Pollo, Pan, Pollo, Pan]
            }
     
        it "descontar 40% precio hamburguesa triple" $ 
            descuento 40 triple `shouldBe` Hamburguesa {
                precioBase = 18,
                ingredientes = [Pan, Carne, Cheddar, Carne, Cheddar, Carne, Cheddar, Pan]
            }
        it "descontar 50% precio hamburguesa americana" $ 
            descuento 50 americana `shouldBe` Hamburguesa {
                precioBase = 20,
                ingredientes = [Pan, Carne, Panceta, Cheddar, Panceta, Cheddar, Pan]
            }
        
    describe "Parte 2, mas burgas" $ do
        it "calcular precio hamburguesa doble cuarto" $ 
            calcularPrecio dobleCuarto `shouldBe` 84
        it "calcular precio hamburguesa bigPdeP" $ 
            calcularPrecio bigPdeP `shouldBe` 89
        it "hacer una hamburguesa del dia a la hamburguesa simple" $ 
            delDia simple `shouldBe` Hamburguesa {
                precioBase = 14,
                ingredientes = [Papas, Pan, Carne, Pan]
            }
        it "hacer una hamburguesa del dia a la hamburguesa bigPdeP" $ 
            delDia bigPdeP `shouldBe` Hamburguesa {
                precioBase = 14,
                ingredientes = [Papas, Curry, Carne, Cheddar, Pan, Carne, Cheddar, Pan]
            }
        it "calcular precio hamburguesa doble cuarto del dia" $ 
            calcularPrecio (delDia dobleCuarto) `shouldBe` 88

    describe "Parte 3, mas burgas^2" $ do
        it "hacer veggie hamburguesa doble cuarto del dia" $ 
            hacerVeggie (delDia dobleCuarto) `shouldBe` Hamburguesa {
                precioBase = 14,
                ingredientes = [Papas, PatiVegano, QuesoDeAlmendras, Pan, PatiVegano, QuesoDeAlmendras, Pan]
            }
        it "hacer veggie hamburguesa bigPdeP del dia" $ 
            hacerVeggie (delDia bigPdeP) `shouldBe` Hamburguesa {
                precioBase = 14,
                ingredientes = [Papas, Curry, PatiVegano, QuesoDeAlmendras, Pan, PatiVegano, QuesoDeAlmendras, Pan]
            } 
        it "cambiar pan de hamburguesa simple" $ 
            cambiarPandePati simple `shouldBe` Hamburguesa {
                precioBase = 20,
                ingredientes = [PanIntegral, Carne, PanIntegral]
            }