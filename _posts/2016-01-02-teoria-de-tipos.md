---
layout: post
title: Teoría de tipos
authors:
  - M42
category: Álgebra
---

Los sistemas de tipos tienen su utilidad en las matemáticas. Sirven para modelar
una fundamentación de las matemáticas distinta de la usual fundamentación
conjuntista; y tienen varias aplicaciones interesantes en lenguajes funcionales
y asistentes de demostración. En particular, sobre los tipos se puede definir un
álgebra y se pueden representar sistemas lógicos. Vamos a tratar esas
aplicaciones referenciando en cada caso artículos donde se exponen en profundidad.


## Álgebra de tipos

En un post anterior de este mismo blog hemos tratado el álgebra de tipos. Ese
post se basó sobre otros tres publicados en el blog de Chris Taylor:

* [Álgebra de tipos - Blog DGIIM](http://dgiim.github.io/blog/2015/03/24/algebra-tipos/)
* [The algebra of algebraic data types, Part I - Chris Taylor](http://chris-taylor.github.io/blog/2013/02/10/the-algebra-of-algebraic-data-types/)
* [The algebra of algebraic data types, Part II - Chris Taylor](http://chris-taylor.github.io/blog/2013/02/11/the-algebra-of-algebraic-data-types-part-ii/)
* [The algebra of algebraic data types, Part III - Chris Taylor](http://chris-taylor.github.io/blog/2013/02/13/the-algebra-of-algebraic-data-types-part-iii/)

En el segundo de los artículos se usan funciones generadoras para probar
resultados sobre los números de Catalan y los árboles binarios. La teoría de
funciones generadoras necesaria para entender el tratamiento de los árboles
binarios la explica Mike Spivey en
*[The catalan numbers from their generating function](https://mikespivey.wordpress.com/2013/03/19/the-catalan-numbers-from-their-generating-function/)*.

<!--more-->
Además, existe un resultado de **Fiore y Leinster** que afirma que si demostramos
una relacion polinómica para números complejos, también será válida para
cualquier semianillo. Y por tanto, para los tipos.
Esto quiere decir que, en la mayoría de las ocasiones, podemos usar
la resta o la división de tipos como si existieran. La demostración excluye
algunos casos particulares y se expone aquí:

* [Objects of categories as complex numbers - Marcelo Fiore y Tom Leinster](http://arxiv.org/pdf/math/0212377v1.pdf)

Sobre el uso de las derivadas en el álgebra de tipos existe un resultado de
**Conor McBride** que relaciona las derivadas parciales con los *zippers* de Haskell
usados para representar contextos. Puede leerse aquí:

* [The derivative of a regular type is its type of one-hole contexts](http://strictlypositive.org/diff.pdf).


## Lógica con tipos

La aplicación de los tipos a la lógica y las demostraciones parte del
isomorfismo de Curry-Howard, que relaciona los sistemas de tipos con sistemas
lógicos. Los apuntes sobre
[**Curry-Howard**](https://github.com/dgiim/curryHoward/blob/master/CurryHoward.pdf)
de los repositorios del doble grado explican el isomorfismo sobre la deducción
natural, un sistema de lógica intuicionista basado en la implicación. El
[código fuente](https://github.com/dgiim/curryHoward/tree/master/src)
acompañando los apuntes está escrito en Coq y Haskell.

El isomorfismo completo sobre los tipos en Haskell lo expone Philip Wadler aquí:

* [The Girard-Reynolds Isomorphism - Philip Wadler](http://homepages.inf.ed.ac.uk/wadler/papers/gr2/gr2.pdf)


## Parametricidad

La parametricidad limita las instancias posibles de los tipos de la forma
`forall a. p(a)`, y nos permite obtener teoremas sobre todas las instancias de
esos tipos. Se explica a nivel intuitivo en el siguiente post de Bartosz
Milewski y más formalmente en este paper de Philip Wadler:

* [Parametricity: Money for Nothing and Theorems for Free - Bartosz Milewski](http://bartoszmilewski.com/2014/09/22/parametricity-money-for-nothing-and-theorems-for-free/)
* [Theorems for free! - Philip Wadler](http://ttic.uchicago.edu/~dreyer/course/papers/wadler.pdf)


## Inducción estructural

Sobre la inducción estructural hemos escrito previamente en el blog una
introducción:

* [Inducción Estructural - Blog DGIIM](http://dgiim.github.io/blog/2015/03/14/induccion-estructural/)

En ese post se escriben ejemplos sobre los naturales y los
árboles. El artículo sobre el que se basa es:

* [When can we do induction? - math.blogoverflow](http://math.blogoverflow.com/2015/03/10/when-can-we-do-induction/)

Ejemplos y más detalles sobre inducción estructural y sus usos pueden
encontrarse en:

* [Some notes on Structural Induction - Michael Erdmann](http://www.cs.cmu.edu/~me/212/handouts/structural.pdf)
* [Structural Induction Principles for Functional Programmers - James Caldwell](http://arxiv.org/pdf/1312.2696.pdf)

Y varias demostraciones por inducción estructural implementadas en Coq en este
repositorio sobre [**recorridos en árboles**](https://github.com/M42/recorridosArboles).
