module Library where
import PdePreludat

data Ingrediente =
    Carne | Pan | Panceta | Cheddar | Pollo | Curry | QuesoDeAlmendras | BaconDeTofu
    deriving (Eq, Show)

precioIngrediente Carne = 20
precioIngrediente Pan = 2
precioIngrediente Panceta = 10
precioIngrediente Cheddar = 10
precioIngrediente Pollo =  10
precioIngrediente Curry = 5
precioIngrediente QuesoDeAlmendras = 15
precioIngrediente BaconDeTofu = 12

data Hamburguesa = Hamburguesa {
    precioBase :: Number,
    ingredientes :: [Ingrediente]
} deriving (Eq, Show)

cuartoDeLibra :: Hamburguesa
cuartoDeLibra = Hamburguesa {
    precioBase = 20,
    ingredientes = [pan, carne, cheddar, pan]
}

pdepBurguer :: Hamburguesa
pdepBurguer = Hamburguesa {
    precioBase = (precioBase . descuento 20) cuartoDeLibra,
    ingredientes = (ingredientes . agrandar . agrandar . agregarIngrediente Panceta . agregarIngrediente Cheddar) cuartoDeLibra
}

calcularPrecio :: Hamburguesa -> Number
calcularPrecio hamburguesa = precioBase hamburguesa + (sum . map precioIngrediente . ingredientes) hamburguesa 

agrandar :: Hamburguesa -> Hamburguesa
agrandar hamburguesa 
    |elem Carne (ingredientes hamburguesa) = agregarIngrediente Carne hamburguesa
    |elem Pollo (ingredientes hamburguesa) = agregarIngrediente Pollo hamburguesa
    |otherwise = hamburguesa
--Entiendo que hay logica repetida, no se me ocurre como hacerlo sin tener que usar maybe u otras cosas

agregarIngrediente :: Ingrediente -> Hamburguesa -> Hamburguesa
agregarIngrediente ingrediente hamburguesa = hamburguesa {ingredientes = ingrediente : (ingredientes hamburguesa)}

descuento :: Number -> Hamburguesa -> Hamburguesa
descuento porcentaje hamburguesa = hamburguesa { precioBase = (precioBase hamburguesa - (precioBase hamburguesa * porcentaje / 100))}

