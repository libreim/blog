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

No sólo existen tipos simples, sino que pueden definirse
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
lo que vamos a explicar luego. El lector al que no le apetezca leer sobre categorías, puede
saltar este punto y seguir leyendo: no debería afectar a la comprensión de lo
demás. Un isomorfismo puede entenderse en el sentido conjuntista.

Veremos de esta categoría que tiene objeto inicial y final (¿puede el lector
adivinarlos de lo anterior?), que tiene productos
y coproductos para cualesquiera dos objetos (esto lo podrá ver más adelante), y
que es **cartesianamente cerrada** (a lo anterior se une que los morfismos
`a->b` son también un tipo, un objeto de la categoría en sí mismos). No
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
isomorfos por:

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
propiedades usuales del álgebra. La **conmutatividad** de ambas se conserva por
isomorfismo. Veamos que

$$a+b=b+a$$

$$ab=ba$$

Las siguientes funciones son isomorfismos:

~~~
prdcomm :: (a,b) -> (b,a)
prdcomm (x,y) = (y,x)

sumcomm :: Either a b -> Either b a
sumcomm (Left  x) = (Right x)
sumcomm (Right y) = (Left  y)
~~~
{: .haskell}

La **asociatividad**,

$$(ab)c \cong a(bc)$$

$$(a+b)+c \cong a+(b+c)$$

se comprueba de igual manera. Son isomorfismos:

~~~
prdasoc :: (a,(b,c)) -> ((a,b),c)
prdasoc (x,(y,z)) = ((x,y),z)

sumasoc :: (Either a (Either b c)) -> ((Either a b) c)
sumasoc (Left x)          = (Left (Left x))
sumasoc (Right (Left y))  = (Left (Right y))
sumasoc (Right (Right y)) = (Right y)
~~~
{: .haskell}

Y la **distributividad** del producto sobre la suma, que se obtiene también por
isomorfismos. Veamos que

$$(a+b)c \cong ac+bc$$

~~~
distrib :: ((Either a b),c) -> Either (a,c) (b,c)
distrib (Left  x, z) = Left  (x,z)
distrib (Right y, z) = Right (y,z)

commonf :: Either (a,c) (b,c) -> ((Either a b), c)
commonf Left  (x,z) = (Left  x, z)
commonf Right (y,z) = (Right y, z)
~~~
{: .haskell}


## Contando

Con la suma y producto definidas, podemos ver que `Void` y `()` son el $$1$$ y
el $$0$$ de nuestro álgebra, y que cumplen el ser neutros para la suma y el
producto y el resto de propiedades que se esperan de ellos. Notándolos como
$$0$$ y $$1$$, se puede demostrar:

$$0a \cong 0$$

$$0+a \cong a \cong 1a$$

Y desde aquí, definir naturalmente los naturales. Sumando unidades:

$$ 2 \cong 1 + 1 $$

$$ 3 \cong 2 + 1 $$

$$ \dots $$

Nótese que, por ejemplo, $$2 \cong \mathtt{Bool}$$.

Pero además ocurre que, para tipos con un número finito de instancias, tenemos
que el número de instancias de la suma de dos tipos es la suma del número de
instancias de cada tipo, y análogamente ocurre con el producto. Realmente,
tenemos un homomorfismo del álgebra de tipos al álgebra de los naturales, que, de
paso, respeta nuestros *tipos naturales* recién definidos. Compruébese que con
$$\phi(\mathtt{A}) = \#\mathtt{A}$$, se cumple:

$$\begin{matrix}
\phi(\mathtt{A}\mathtt{B}) = \phi(\mathtt{A}) \phi(\mathtt{B}) \\
\phi(\mathtt{A}+\mathtt{B}) = \phi(\mathtt{A}) + \phi(\mathtt{B}) \\
\phi(\mathtt{n}) = n
\end{matrix}$$

Para cualquier *tipo natural* $$\mathtt{n}$$.

## Tipos función

Los **tipos función**, `->` van a hacer el papel de la exponencial.
Una función `a->b` la notamos por $$b^a$$ y se puede comprobar que la
exponencial se distribuye correctamente.

$$(bc)^a \cong b^ac^a $$

Porque esta función, que realmente lo que hace es enunciar la propiedad
universal del producto, es isomorfismo.

~~~
expdist :: (a -> (b,c)) -> (a -> b, a -> c)
expdist f = (fst . f, snd . f)
~~~
{: .haskell}

Esta definición conserva el sentido con la suma de tipos:

$$a^{b+c} \cong a^ba^c$$

Gracias a que esta función es isomorfismo:

~~~
expsum :: (Either b c -> a) -> ((b -> a),(c -> a))
expsum f = Either (f . Left) (f . Right)
~~~

Y además, los tipos función conservan el homomorfismo anterior:

$$\phi(\mathtt{A}\rightarrow\mathtt{B}) = \phi(\mathtt{B}) ^{\phi(\mathtt{A})}$$


## Ecuaciones. Listas y árboles

Vamos a ver los constructores de tipos como funciones de nuestro álgebra. Así,
para cada constructor de tipos, tendremos una ecuación que lo defina. Veremos
que estas ecuaciones de constructores de tipos pueden servir para aportarnos qué
es esencialmente el constructor de tipos. Las manipularemos con las reglas del
álgebra antes definidas. Como ejemplos, hablaremos de listas y de
árboles.

Por ejemplo, el tipo **lista** podemos definirlo como:[^haskell-list-def]

~~~
data [a] = []
         | a : [a]
~~~
{: .haskell}

Pero esto nos da una ecuación en $$a$$ para cualquier tipo. Sabiendo que
$$1 \cong []$$, tenemos:

$$[a] = 1 + a[a]$$

Y si lo desarrollamos, simplemente sustituyendo, obtendremos:

$$[a] \cong 1 + a + a^2 + a^3 + \dots \cong \sum_{i=0}^\infty a^i$$

Lo que tiene perfecto sentido. Una lista puede ser un número cualquiera de
elementos de $$a$$.

Por otro lado, el tipo **árbol** lo definimos antes como:

~~~Haskell
data Tree a = Empty
            | Node (Tree a) a (Tree a)
~~~
{: .haskell}

Y esto nos da la ecuación, llamando $$T = \mathtt{Tree\ a}$$:

$$ T = 1 + aT^2 $$

Que cuando se desarrolla nos deja:

$$ T = 1 + a + 2a^2 + 5a^3 + 14a^4 + \dots = \sum_{i=0}^\infty C_i a^i $$

Donde $$C_i$$ es el $$i$$-ésimo
[número de Catalan](http://en.wikipedia.org/wiki/Catalan_number).
Que es exactamente el número de árboles binarios de $$i$$ elementos.

[^haskell-list-def]: Definición de lista en el preludio de Haskell. <https://www.haskell.org/onlinereport/standard-prelude.html>

## Más información

El álgebra de tipos puede seguir expandiéndose. En los recursos que se dejan a
continuación se definen las derivadas (usando *one-hole contexts*), se estudian
tipos no regulares (como los conjuntos) y se termina de relacionar con teoría de
categorías.

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
