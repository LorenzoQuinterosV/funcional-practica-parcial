# TP Composición

## Tareas

- [ ] Aceptar el assignment y clonar el repositorio con el ejercicio
- [ ] Ir a la carpeta donde descargaste el ejercicio.
- [ ] Reemplazar nombre y legajo en el archivo README.md
- [ ] Resolver el ejercicio siguiendo [un esquema de trabajo](https://github.com/pdep-utn/enunciados-miercoles-noche/blob/master/pages/haskell/trabajo.md), eso incluye
- [ ] Ejecutar los tests con `stack test` y que den verde
- [ ] A medida que vas resolviendo el ejercicio, subir [el progreso a git](https://github.com/pdep-utn/enunciados-miercoles-noche/blob/master/pages/git/resolverConflictos.md)

# 📂 Banco de Parciales - Paradigmas de Programación (Funcional)

Este archivo contiene los enunciados de los parciales prácticos de **Haskell** listos para su resolución.

---

## ⚽ El Gran DT - 2025 (Tema 1)

### 📝 Contexto General
Un importante y sudoroso personaje del fútbol nos ha pedido que modelemos los requerimientos para la importante liga que tiene a su cargo. Sabemos que un jugador tiene:
* Nombre
* Velocidad (medida en km/h)
* Habilidad (de 0 a 100)
* Puesto en el que juega: `“arquero”`, `“defensor”`, `“volante”` o `“delantero”`
* Partidos donde jugó (del primero al último): en él se marca minutos jugados y goles convertidos. 

*Nota: Si un jugador estuvo en el banco de suplentes tendrá 0 minutos jugados.*

---

### 📌 Punto 1: Equipos (3 puntos)
> ⚠️ **Restricciones:** NO se pueden utilizar funciones auxiliares. Solo **composición** y **aplicación parcial**. NO se puede usar recursividad.

1. Queremos saber los **nombres de los jugadores** de un equipo que jugaron todos los partidos al menos una cantidad de minutos, donde esa cantidad de minutos sea parametrizable. *Ejemplo: si elegimos que la cantidad de minutos sea 45, puede haber jugado 45, 46 ó los 90, eso alcanza.*
2. Queremos saber si **hay algún jugador** de un equipo cuyo nombre empieza con una letra determinada (por ejemplo, `'F'`).

---

### 📌 Punto 2: Técnicos (3 puntos)
Presentamos ahora a los técnicos, que con sus tácticas modifican a los jugadores:
* **Bielsa:** Le agrega un 50% de velocidad a los jugadores pero también baja 10 puntos su habilidad.
* **Menotti:** Le agrega un `"Mr. "` al nombre del jugador y aumenta una cantidad parametrizable de puntos su habilidad.
* **Bertolotti:** Hace lo mismo que Menotti, solo que aumenta siempre 10 puntos de habilidad.
* **Van Gaal:** No afecta a los jugadores, siguen jugando igual que siempre.

👉 **Invocación:** Indique cómo haría en la consola para decir que un jugador fue entrenado primero por **Bielsa**, luego por **Menotti** y finalmente por **Van Gaal**. *No importa el resultado sino cómo es la invocación en el REPL.*

---

### 📌 Punto 3: Mejora (2 puntos)
Sabemos que un jugador es **bueno** si tiene más habilidad que velocidad, o bien si es volante. Queremos saber si un técnico **mejora a un equipo**: esto se da si después de entrenar a todos los jugadores de un equipo, tiene más jugadores buenos que antes de entrenarlos.
> ⚠️ **Restricciones:** NO puede utilizar recursividad.

---

### 📌 Punto 4: Es imparable (2 puntos)
Queremos saber si un jugador es **imparable**. Esto se da si con el correr de los partidos va metiendo la misma cantidad de goles o más (goles crecientes/estables).
> ⚠️ **Restricciones:** DEBE utilizar recursividad.

* **Ejemplo 1 (Es imparable):** Goles por partido: `[0, 2, 2, 4]`.
* **Ejemplo 2 (NO es imparable):** Goles por partido: `[0, 1, 0]`.

---
---

## ⚽ El Gran DT - 2025 (Tema 2)

### 📝 Contexto General
*(Mismo contexto que el Tema 1)*

---

### 📌 Punto 1: Equipos (3 puntos)
> ⚠️ **Restricciones:** NO se pueden utilizar funciones auxiliares. Solo **composición** y **aplicación parcial**. NO se puede usar recursividad.

1. Queremos saber **cuántos jugadores** de un equipo marcaron goles en todos los partidos.
2. Queremos saber si **todos los jugadores** de un equipo que tienen más de un mínimo de puntos de habilidad son volantes, donde ese mínimo es configurable. 
   * *Ojo: si elijo que el mínimo sea 35, si hay 2 volantes que tienen 40 y 50 puntos de habilidad y un delantero con 50 puntos de habilidad, la condición no se cumple: todos los jugadores que superan el mínimo deben ser únicamente volantes.*

---

### 📌 Punto 2: Técnicos (3 puntos)
Presentamos ahora a los técnicos, que con sus tácticas modifican a los jugadores:
* **Gago:** Hace que los volantes jueguen de defensores y los delanteros de volantes (el resto queda en su posición).
* **Bilardo:** Hace que jueguen un partido amistoso que termina 0 a 0 (hay que agregarlo al jugador que juega todo el partido: 90 min y 0 goles) y también aumenta 5 puntos su habilidad si Bilardo está nervioso, ó 10 si Bilardo está tranquilo.
* **Fatigatti:** Hace lo mismo que Bilardo pero siempre está tranquilo.
* **Klopp:** No afecta a los jugadores, siguen jugando igual que siempre.

👉 **Invocación:** Indique cómo haría en la consola para decir que un jugador fue entrenado primero por **Gago**, luego por **Bilardo** y finalmente por **Klopp**. *No importa el resultado sino cómo es la invocación en el REPL.*

---

### 📌 Punto 3: Buena enseñanza (2 puntos)
Sabemos que un jugador es **bueno** si tiene más habilidad que velocidad, o bien si es volante. Queremos saber si un jugador tiene una **buena enseñanza**: esto se da si después de que lo entrenan una serie de técnicos termina siendo un jugador bueno (no importa si antes ya lo era).
> ⚠️ **Restricciones:** NO puede utilizar recursividad.

---

### 📌 Punto 4: Regularidad (2 puntos)
Dado un jugador, queremos saber si **perdió regularidad**. Esto se da si con el correr de los partidos juega menos minutos (los minutos decrecen en algún punto).
> ⚠️ **Restricciones:** DEBE utilizar recursividad.

* **Ejemplo 1 (NO perdió):** Minutos por partido: `[10, 20]` (Subió).
* **Ejemplo 2 (NO perdió):** Minutos por partido: `[10, 20, 10]` (Volvió a jugar lo mismo que en el segundo, se mantiene/sube respecto al inicio).
* **Ejemplo 3 (SÍ perdió):** Minutos por partido: `[90, 90, 90, 80]` (Bajó al final).

---

# Academia Perruna

Queremos modelar el comportamiento de los animales que fueron enrolados a una academia de entrenamiento perruno.

De cada perro nos interesa registrar su **nombre**, la **cantidad de estamina** que tiene, cuál es su **juguete** y su **criterio de juego**, que determina cuándo el animal en cuestión se siente a gusto con otro perro para poder jugar con él. De momento, de los juguetes nos indican el **color** y si **rechinan o no** cuando los muerden, aunque seguramente aparezcan otras características relevantes en el futuro.

Resolver los siguientes requerimientos aprovechando los conceptos del paradigma funcional, favoreciendo cuando sea conveniente el uso de **orden superior**, **aplicación parcial** y **composición** a lo largo del desarrollo. Para todas las funciones desarrolladas, explicitar su tipo.

---

## Ejercicio 1

Necesitamos modelar a los perros y juguetes de acuerdo a lo indicado previamente, y tener un ejemplo de un perro que se llame **Sultán**, con 25 unidades de estamina, un juguete azul que no rechina, y que le guste jugar con otro perro si el juguete que tiene sí rechina.

Se cuenta con las siguientes definiciones:

```haskell
data Perro = Perro {
  nombre  :: String,
  estamina :: Number,
  juguete :: Juguete,
  juego   :: Bool
}

type Juguete = (String, Bool)

sultan = Perro {
  nombre   = "Sultán",
  estamina = 25,
  juguete  = ("azul", False),
  juego    = rechina (juguete otroPerro)
}

rechina = snd
```

Esta solución tiene problema/s. **Explicar qué problemas se identificaron y corregirlos.**

---

## Ejercicio 2

Se necesita una función:

```haskell
recibirJuguete :: Juguete -> Perro -> Perro
```

Sabiendo que cuando esto sucede, además de quedarse con el juguete nuevo, su estamina sube 3 puntos por el entusiasmo.

Ya se cuenta con estas dos funciones:

```haskell
jugueteNuevo perro nuevo = perro { juguete = nuevo }
cambiarEstamina x perro  = perro { estamina = x (estamina perro) }
```

**Definir `recibirJuguete` utilizando ambas funciones.**

---

## Ejercicio 3

Hacer una función:

```haskell
puedenJugarJuntos :: Perro -> Perro -> Bool
```

que se cumpla si mutuamente cumplen el criterio de juego del otro.

---

## Ejercicio 4

Hacer una función que **vuelva más exigente** a un perro para poder jugar con otro. Dado un nuevo criterio de juego, se espera que el perro luego de volverse más exigente requiera que el otro perro cumpla no sólo su criterio previo, sino también el nuevo criterio indicado.

Mostrar un ejemplo de uso haciendo que Sultán ahora también **requiera que el otro perro tenga más de 10 de estamina** para que pueda jugar con él.

---

## Ejercicio 5

En la academia les arman rutinas para hacer a los perritos durante el día, por lo que les interesa poder analizar el estado final de un perro luego de realizar sucesivamente múltiples acciones.

Sabiendo que una `Tarea` es una función de tipo `Perro -> Perro`, y asumiendo que ya existen las siguientes funciones (no importa cómo están implementadas):

```haskell
comer  :: Tarea
correr :: Tiempo -> Tarea
saltar :: Tarea
```

Se pide:

**a)** Definir una función que, dada una lista de tareas que representa la rutina a realizar y un perro, retorne cómo quedaría el perro si realizara cada una de esas tareas sucesivamente.

**b)** Saber si una rutina es **muy exigente** para un perro, que se cumple si luego de realizar las tareas gastaría más del 50% de su estamina original.

**c)** Mostrar un ejemplo de uso de la función anterior que permita saber si una rutina que haga que Sultán **coma, luego corra 10 minutos y por último salte** sería muy exigente.

---

## Ejercicio 6

Queremos que los perros puedan elegir un nuevo juguete de entre aquellos que hay disponibles como una nueva tarea que pueden realizar. Usando la función `recibirJuguete`, definir:

```haskell
elegirNuevoJuguete :: [Juguete] -> (Juguete -> Juguete -> Bool) -> Tarea
```

que reciba una lista de juguetes y una función que sirve para saber si el segundo juguete es mejor que el primero. Lo esperado para esta tarea es que el perro reciba un nuevo juguete, cambiando el propio por el **primero de los juguetes dados que cumpla con ser mejor que el que tiene actualmente**.

En caso de no haber ningún juguete disponible que sea mejor que el que ya tiene, no pasa nada: debería conservar el propio.

---

## Ejercicio 7

Teniendo una constante:

```haskell
perrosDeAcademia :: [Perro]
```

queremos obtener los **nombres de los 5 primeros perros** que podrían jugar con Sultán.

**a)** Sin definir nuevas funciones, mostrar cuál sería la consulta que debería hacerse para lograr lo pedido **usando composición de funciones**.

**b)** Si `perrosDeAcademia` fuera una **lista infinita**, ¿sería posible obtener una respuesta para la consulta anterior? Justificar.