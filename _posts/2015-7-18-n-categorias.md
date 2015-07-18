---
layout: post
title: N-Categorías
authors:
  - M42
category: Álgebra
---

Las n-categorías
Tienen aplicación en física teórica, topología y computación (en temas de
concurrencia).

En este post vamos a usar conceptos básicos de teoría de categorías sin
explicarlos. Para una introducción a la teoría de categorías, tenemos un post en
este mismo blog, que será útil antes de empezar a leer sobre n-categorías.

## Introducción: funtores y transformaciones naturales

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
que permiten también morfismos entre los morfismos.

El último caso es el de las $$\infty$$-categorías, que simplemente poseen
n-morfismos para todo natural.

## La composición de n-morfismos

## Ejemplo: n-categorías fundamentales

## Ejemplo: variedades

## Ejemplo: espacios topológicos

## Definiciones formales de n-categoría

## (-1)-categorías

## La tabla periódica de categorías


## Referencias

https://www.youtube.com/watch?v=6bnU7_6CNa0
