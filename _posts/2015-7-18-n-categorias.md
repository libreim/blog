---
layout: post
title: N-Categorías
authors:
  - M42
category: Álgebra
---

Las n-categorías son la base de la
Tienen aplicación en física teórica, topología y computación (en temas de
concurrencia).

En este post vamos a usar conceptos básicos de teoría de categorías sin
explicarlos. Para una introducción a la teoría de categorías, tenemos un post en
este mismo blog, que será útil antes de empezar a leer sobre n-categorías.

## Introducción: la categoría de las categorías

Vamos a empezar motivando la definición posterior empezando a pensar sobre
categorías. En particular, vamos a considerar la categoría de las categorías,
**Cat**. En esta categoría, los objetos son categorías y los morfismos serán los
funtores, que cumplen las propiedades que se esperan de los morfismos.

(Hablar del problema de tener categorías de categorías)

En esta categoría podemos ir más allá de los funtores y empezar a considerar a
las transformaciones naturales como morfismos entre los funtores. Es decir,
tenemos tres niveles:

* Los objetos, que son categorías.
* Los morfismos, que son los funtores que unen categorías.
* Los morfismos entre morfismos, que son las transformaciones naturales.

Podemos comprobar que, dadas dos categorías fijas $$A,B$$, las transformaciones
naturales entre los funtores que van de una a otra cumplen las reglas que se
esperan de los morfismos. Es decir:

* Existe una transformación natural identidad.

   $$<imagen>$$

* Se componen de manera asociativa.

   $$<imagen>$$

Esta es la llamada **composición vertical**, pero no es la única que puede
definirse entre transformaciones naturales.
Las transformaciones naturales pueden dotarse de otra composición, la
**composición horizontal**, que se da entre transformaciones naturales entre dos
pares de funtores tales que cada uno pueda componerse con el otro. En una imagen
puede apreciarse mejor:

   $$<imagen>$$

Para diferenciar ambas composiciones, notaremos la composición vertical con el
signo usual $$(\circ)$$ y la composición horizontal con el signo $$(\ast)$$.

Lo que tenemos aquí es un ejemplo de **2-categoría**. La idea de considerar
morfismos sobre morfismos puede repetirse tantas veces como se quiera, dando
lugar a las **n-categorías**.


## Una definición informal

Para un $$n \in \mathbb{N} \cup \infty$$, una **n-categoría** consta de:

* Un conjunto de objetos, similar al que posee una categoría:

    $$A,B,\dots $$

* 1-morfismos entre objetos, similares a los morfismos de una categoría:

    $$A \rightarrow B$$

* 2-morfismos, que serán morfismos entre 1-morfismos:

    $$ <imagen> $$

* 3-morfismos, que se definirán como morfismos entre 2-morfismos:

    $$ <imagen> $$

* ...

* n-morfismos, en general, que serán morfismos entre los (n-1)-morfismos.

Es decir, además de los morfismos entre objetos, que es lo que dotaba de
estructura a las categorías usuales, consideramos a su vez, morfismos entre
estos morfismos. Una vez dado este primer paso, nada nos impide considerar
morfismos
entre los morfismos entre los morfismos y repetir el proceso tantas veces
como queramos. Con inducción podemos terminar de
definirlo hasta cualquier $$n$$.

De esta forma, las **2-categorías** son una generalización de las categorías
que permiten también morfismos entre los morfismos. Y de la misma forma, las
**n-categorías** son una generalización permitiendo morfismos entre
(n-1)-morfismos.

El último caso es el de las $$\infty$$-categorías, que simplemente poseen
n-morfismos para todo natural.

## La composición de n-morfismos

## Ejemplo: n-categorías fundamentales

De la misma manera que el ejemplo prototípico de una categoría es **Set**, un
ejemplo prototípico para una **(n+1)-categoría** es la colección de todas las
**n-categorías**.

En el ejemplo inicial, ya mostramos cómo la categoría **Cat**, de las
1-categorías, era un ejemplo de **2-categoría**.


## Ejemplo: variedades

## Ejemplo: espacios topológicos

Un ejemplo de $$\infty$$-categoría es **Top**, la categoría de los espacios
topológicos:

* Los objetos son los espacios topológicos.
* Los 1-morfismos son las funciones continuas.
* Los 2-morfismos son las homotopías entre funciones continuas.
* Los 3-morfismos son las homotopías entre homotopías.
* ...

## Definiciones formales de n-categoría

## (-1)-categorías

## La tabla periódica de categorías


## Referencias

https://www.youtube.com/watch?v=6bnU7_6CNa0
http://www.cs.ox.ac.uk/quantum/slides/clap4-eugeniacheng.pdf
