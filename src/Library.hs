module Library where
import PdePreludat

--EL GRAN DT TEMA 1

data Puesto = Arquero | Defensor | Volante | Delantero deriving(Show,Eq)

data Partido = UnPartido {
    minutosJugados :: Number,
    goles :: Number
} deriving(Show, Eq)

data Jugador = UnJugador {
    nombre :: String,
    velocidad :: Number,
    habilidad :: Number,
    puesto :: Puesto,
    partidos :: [Partido]
} deriving(Show, Eq)

--Punto 1

nombresDeJugadoresQueJugaronMinutos :: [Jugador] -> Number -> [String]
nombresDeJugadoresQueJugaronMinutos listaJugadores minutosMinimos =
    map nombre . filter (all (\partido -> minutosJugados partido >= minutosMinimos) partidos) $ listaJugadores

algunoEmpiezaPorLetra :: [Jugador] -> Char -> Bool
algunoEmpiezaPorLetra listaJugadores letraInicial = 
    any ((head . nombre) == letraInicial) listaJugadores

--Punto 2

type Entrenador = Jugador -> Jugador

modificarHabilidad :: Number -> Jugador -> Jugador
modificarHabilidad nuevaHabilidad jugador = jugador {habilidad = max (0, (habilidad jugador + nuevaHabilidad))}

agregarMrANombre :: Jugador -> Jugador
agregarMrANombre jugador = jugador { nombre = "Mr. " ++ nombre jugador}

bielsa :: Entrenador
bielsa = velocidad * 1.5 . modificarHabilidad (-10)

menotti :: Number -> Entrenador
menotti puntosHabilidad = agregarMrANombre . modificarHabilidad (puntosHabilidad)

bertolotti :: Entrenador
bertolotti = menotti 10

vanGaal :: Entrenador
vanGaal jugador = jugador

{- En consola, llamaria vanGaal menotti bielsa jugador
siendo jugador alguno predefinido -}

--Parte 3
esBueno :: Jugador -> Bool
esBueno (UnJugador _ velocidadJ habilidadJ puestoJ _) = 
    habilidadJ > velocidadJ || puestoJ == Volante

elTecnicoMejoraAlEquipo :: Entrenador -> [Jugador] -> Bool
elTecnicoMejoraAlEquipo tecnico listaJugadores =
    (length . filter esBueno) listaJugadores < (length . filter esBueno . map tecnico) listaJugadores


--Parte 4

esImparable :: Jugador -> Bool
esImparable (UnJugador _ _ _ _ []) = TRUE
esImparable (UnJugador _ _ _ _ [partido1, partido2]) = goles partido1 <= goles partido2
esImparable (UnJugador _ _ _ _ (partido1 : partido2 : partidos)) 
    |goles partido1 <= goles partido2 = esImparable (UnJugador _ _ _ _ (partido2 : partidos))
    |otherwise = FALSE