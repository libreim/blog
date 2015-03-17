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

En Haskell, los tipos se escriben como un conjunto de constructores, que actúan
como funciones teniendo como codominio el tipo definido. Por ejemplo,

~~~Haskell
data Colour = RGB Int Int Int
            | HSV Int Int Int
~~~

este código define un tipo `Colour` con dos formas de construirlo, como `RGB` y
como `HSV`. Ambos constructores usan como argumento tres enteros. Con tres
enteros podremos construir un color de dos formas distintas.

Pero además, no sólo existen tipos simples, sino que pueden definirse
constructores de tipos, que toman tipos como argumento para generar otros. Por
ejemplo,

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

Las unidades de nuestro álgebra de tipos serán los tipos unidad y el tipo
vacío. El tipo unidad consiste en un sólo constructor, de la forma:

~~~Haskell
data Unit = Unit
~~~

En Haskell existe implementado el tipo `()`, con

## Más información

La charla de Chris Taylor sobre este tema [^taylor-algebratypes] es bastante
amena y puede seguirse con unos conocimientos mínimos de Haskell. Para
profundizar más en la relación con teoría de categorías están los posts sobre
categorías para programadores de Bartosz Milewski[^milewski-functiontypes].

[^taylor-algebratypes]: The Algebra of algebraic data types. Chris Taylor. <http://chris-taylor.github.io/blog/2013/02/10/the-algebra-of-algebraic-data-types/>
[^milewski-functiontypes]: Function types. Bartosz Milewski. <http://bartoszmilewski.com/2015/03/13/function-types/>
