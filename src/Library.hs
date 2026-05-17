module Library where
import PdePreludat

data Ingrediente =
    Carne | Pan | Panceta | Cheddar | Pollo | Curry | QuesoDeAlmendras | BaconDeTofu | Papas | PatiVegano | PanIntegral
    deriving (Eq, Show)

precioIngrediente Carne = 20
precioIngrediente Pan = 2
precioIngrediente Panceta = 10
precioIngrediente Cheddar = 10
precioIngrediente Pollo =  10
precioIngrediente Curry = 5
precioIngrediente QuesoDeAlmendras = 15
precioIngrediente BaconDeTofu = 12
precioIngrediente Papas = 10
precioIngrediente PatiVegano = 10
precioIngrediente PanIntegral = 3

data Hamburguesa = Hamburguesa {
    precioBase :: Number,
    ingredientes :: [Ingrediente]
} deriving (Eq, Show)

cuartoDeLibra :: Hamburguesa
cuartoDeLibra = Hamburguesa {
    precioBase = 20,
    ingredientes = [Pan, Carne, Cheddar, Pan]
}

pdepBurguer :: Hamburguesa
pdepBurguer = Hamburguesa {
    precioBase = (precioBase . descuento 20) cuartoDeLibra,
    ingredientes = (ingredientes . agrandar . agrandar . agregarIngrediente Panceta . agregarIngrediente Cheddar) cuartoDeLibra
}

dobleCuarto :: Hamburguesa
dobleCuarto = Hamburguesa {
    precioBase = precioBase cuartoDeLibra,
    ingredientes = (ingredientes . agrandar . agregarIngrediente Cheddar) cuartoDeLibra
}

bigPdeP :: Hamburguesa
bigPdeP = agregarIngrediente Curry dobleCuarto

dobleCuartoVegano :: Hamburguesa
dobleCuartoVegano = (cambiarPanDePati . hacerVeggie) dobleCuarto

calcularPrecio :: Hamburguesa -> Number
calcularPrecio hamburguesa = precioBase hamburguesa + (sum . map precioIngrediente . ingredientes) hamburguesa 

agrandar :: Hamburguesa -> Hamburguesa
agrandar hamburguesa 
    |elem Carne (ingredientes hamburguesa) = agregarIngrediente Carne hamburguesa
    |elem Pollo (ingredientes hamburguesa) = agregarIngrediente Pollo hamburguesa
    |elem PatiVegano (ingredientes hamburguesa) = agregarIngrediente PatiVegano hamburguesa
    |otherwise = hamburguesa
--Entiendo que hay logica repetida, no se me ocurre como hacerlo sin tener que usar maybe u otras cosas

agregarIngrediente :: Ingrediente -> Hamburguesa -> Hamburguesa
agregarIngrediente ingrediente hamburguesa = hamburguesa {ingredientes = ingrediente : (ingredientes hamburguesa)}

descuento :: Number -> Hamburguesa -> Hamburguesa
descuento porcentaje hamburguesa = hamburguesa { precioBase = (precioBase hamburguesa - (precioBase hamburguesa * porcentaje / 100))}

delDia :: Hamburguesa -> Hamburguesa
delDia hamburguesa = Hamburguesa {
    precioBase = (precioBase . descuento 30) hamburguesa,
    ingredientes = (ingredientes . agregarIngrediente Papas) hamburguesa
}

replace :: Eq a => a -> a -> [a] -> [a]
replace viejo nuevo lista = map (cambiar viejo nuevo) lista

cambiar :: Eq a => a -> a -> a -> a
cambiar viejo nuevo elemento
    |viejo == elemento = nuevo
    |otherwise = elemento

hacerVeggie :: Hamburguesa -> Hamburguesa
hacerVeggie hamburguesa = hamburguesa {
    ingredientes = (replace Carne PatiVegano . replace Pollo PatiVegano . replace Cheddar QuesoDeAlmendras . replace Panceta BaconDeTofu . ingredientes) hamburguesa
}

cambiarPandePati :: Hamburguesa -> Hamburguesa
cambiarPandePati hamburguesa = hamburguesa{
    ingredientes = (replace Pan PanIntegral . ingredientes) hamburguesa
}

