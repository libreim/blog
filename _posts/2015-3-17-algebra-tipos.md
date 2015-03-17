---
layout: post
title: Álgebra de tipos
authors:
  - M42
category: Álgebra
---


En este post formularemos un álgebra para los tipos de los lenguajes de
programación. Veremos operaciones que se aplican sobre ellos para obtener nuevos
tipos y qué leyes siguen estas operaciones. Usaremos como base el sistema de
tipos de Haskell, pero estos mismos conceptos podrían aplicarse a cualquier
lenguaje con un sistema algebraico de tipos. Para iniciarse en el sistema de
tipos de Haskell sugiero leer antes la [Introducción a Haskell](http://dgiim.github.io/blog/2014/10/01/intro-haskell/).

## Notando tipos en Haskell

En Haskell, los **tipos** se escriben como un conjunto de constructores, que
actúan como funciones teniendo como codominio el tipo definido. Por ejemplo,

~~~Haskell
data Colour = RGB Int Int Int
            | HSV Int Int Int
~~~

este código define un tipo `Colour` con dos formas de construirlo, como `RGB` y
como `HSV`. Ambos constructores usan como argumento tres enteros. Con tres
enteros podremos construir un color de dos formas distintas.

<!--more-->

Pero además, no sólo existen tipos simples, sino que pueden definirse
**constructores de tipos**, que toman tipos como argumento para generar
otros. Por ejemplo,

~~~Haskell
data Tree a = Empty
            | Node (Tree a) a (Tree a)
~~~

este código define un árbol binario con nodos de tipo `a` arbitrario. Así, para
crear un árbol de enteros podríamos escribir `Tree Int`, y para usar un árbol de
booleanos, `Tree Bool`. Observamos que hay dos formas de construir un árbol:
bien como el árbol vacío, que no toma argumentos, o bien como un nodo de árbol,
que toma como argumentos un subárbol izquierdo, un nodo de tipo `a` y un
subárbol derecho.


## Tipos básicos

Los tipos fundamentales de nuestro álgebra de tipos serán los tipos unidad y el
tipo vacío. El **tipo unidad** consiste en un sólo constructor, de la forma:

~~~Haskell
data Unit = Unit
~~~

Sólo se puede construir una instancia distinta del tipo, la propia `Unit`. En
Haskell existe implementado el tipo `()`, isomorfo al que acabamos de definir.


El **tipo vacío**, por otro lado, es un tipo sin constructores. No se puede
generar ninguna instancia de este tipo, simbólicamente podría notarse
como [^haskell-void-98]:

~~~Haskell
data Void
~~~

Como detalle, nótese que se puede definir una función desde este tipo a
cualquier otro por *pattern matching*.
El tipo no puede tomar ningún valor, así que una función que lo trate no tiene
que definirse para ningún valor. En la `Data.Void` está definida la función:

~~~Haskell
absurd :: Void -> a
~~~

Que va del tipo `Void` a un tipo arbitrario cualquiera `a`.

## Los tipos como categoría

Vamos a trabajar ahora con la categoría `Hask` de los tipos en Haskell. Una
lectura previa de la
[Introducción a teoría de categorías](http://dgiim.github.io/blog/2014/10/04/intro-categorias/)
sería interesante antes de tratar este punto, que aporta una visión muy clara a
lo que vamos a explicar luego. Si no te apetece leer categorías, puedes
saltar este punto y seguir leyendo, no debería afectar a la comprensión de lo
demás. Un isomorfismo puede entenderlo en el sentido conjuntista.

Veremos de esta categoría que tiene objeto inicial y final (¿puede el lector
adivinarlos de lo anterior?), que tiene productos
y coproductos para cualesquiera dos objetos (esto lo podrá ver más adelante), y
que es **cartesianamente cerrada** (los morfismos `a->b` son otro tipo). No
volveremos a hablar de categorías en este post, pero es útil que el lector
mantenga en mente la concepción de los tipos como categoría y que vaya
descubriendo como ejercicio las propiedades universales que se presentan.

Lo que vamos a extraer de la teoría de categorías es la noción de **isomorfismo**
entre tipos. Dos tipos serán isomorfos si existe un isomorfismo (función con
inversa a ambos lados) entre ellos. Que los tipos `X` e `Y` sean isomorfos quiere
decir que existen:

~~~Haskell
f :: X -> Y
g :: Y -> X

f . g == id == g . f
~~~

Así, el lector podrá observar la unicidad salvo isomorfismos de los universales
que irán surgiendo. Por ejemplo, todos los tipos con un sólo constructor son
isomorfmos por:

~~~Haskell
data UnitA = UnitA
data UnitB = UnitB

f :: UnitA -> UnitB
f UnitA = UnitB

g :: UnitB -> UnitA
g UnitB = UnitA

f . g == id == g .f
~~~

## Suma y producto

Empecemos el álgebra con sus dos operaciones básicas. El **producto** de dos
tipos es el tipo tupla `(a,b)`, que contiene una instancia de cada uno de ellos.
Es la tupla de la mayoría de lenguajes de programación y se construye tomando
como argumentos una instancia de `a` y otra de `b`. La podríamos escribir a
partir de ahora como $$a b$$.

La **suma** es el tipo `Either a b`, que contiene una instancia de un tipo o
del otro, como una unión disjunta de tipos (similar a la `union` de C++). Se
construye usando una instancia de cualquiera de los dos tipos. La podríamos
notar a partir de ahora como $$a+b$$.

Para llamarlas con propiedad *suma* y *producto* queremos que cumplan las
propiedades usuales del álgebra. La conmutatividad de ambas se conserva por
isomorfismo. Veamos que $$a+b=b+a$$ y que $$ab=ba$$. Las siguientes funciones
son isomorfismos:

~~~
prdcomm :: (a,b) -> (b,a)
prdcomm (x,y) = (y,x)

sumcomm :: Either a b -> Either b a
sumcomm (Left  x) = (Right x)
sumcomm (Right y) = (Left  y)
~~~
{: .haskell}

## Más información

La charla de Chris Taylor sobre este tema [^taylor-algebratypes] es bastante
amena y puede seguirse con unos conocimientos mínimos de Haskell. Para
profundizar más en la relación con teoría de categorías están los posts sobre
categorías para programadores de Bartosz Milewski[^milewski-functiontypes].

El lector que empiece a imaginar la teoría de categorías detrás de esto debería
seguir leyendo sobre categorías cartesianamente cerradas y el isomorfismo de
Curry-Howard-Lambert, que extiende al ya explicado por aquí isomorfismo de
[Curry-Howard](http://dgiim.github.io/blog/2014/12/04/curry-howard/).

[^taylor-algebratypes]: The Algebra of algebraic data types. Chris Taylor. <http://chris-taylor.github.io/blog/2013/02/10/the-algebra-of-algebraic-data-types/>
[^milewski-functiontypes]: Function types. Bartosz Milewski. <http://bartoszmilewski.com/2015/03/13/function-types/>
[^haskell-void-98]: Aunque para seguir el estándar **Haskell 98** requeriría de una definición ligeramente diferente. Puede consultarse el [código fuente](https://hackage.haskell.org/package/void-0.7/docs/src/Data-Void.html#Void).
