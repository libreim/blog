---
layout: post
title: N-Categorías
authors:
  - M42
category: Álgebra
---

Las n-categorías son la base de la teoría de categorías en altas dimensiones
([higher category theory](http://ncatlab.org/nlab/show/higher+category+theory)). Tienen aplicaciones en física teórica, topología y
computación. Por ejemplo, son relevantes en el estudio de problemas de
concurrencia, para la consecución de varias transacciones concurrentes y en el
estudio de la
[teoría topológica cuántica de campo](https://es.wikipedia.org/wiki/Teor%C3%ADa_topol%C3%B3gica_cu%C3%A1ntica_de_campo). [^ncats-applications]

En este post vamos a usar conceptos básicos de teoría de categorías sin
explicar ninguno. Hay una
[introducción a la teoría de categorías](http://0.0.0.0:4000/blog/2014/10/04/intro-categorias/)
en este mismo
blog, que puede ser útil antes de empezar a leer sobre **n-categorías**.

## Introducción: la categoría de las categorías

Vamos a empezar motivando la definición de las n-categorías empezando a pensar
sobre categorías. Consideremos la categoría de las categorías, una categoría en
la que los objetos fueran las distintas categorías y los morfismos fueran los
funtores, que cumplen las propiedades que se esperan de los morfismos. A esta
categoría la llamamos **Cat**, y está formada por:

* **Objetos:** los objetos de esta categoría serán a su vez categorías en sí
  mismas (!). En concreto, *categorías pequeñas*.
  Es decir, aquellas cuyos objetos y morfismos forman un conjunto, no una clase.
  La diferencia entre conjunto y clase consiste en que al primero no le
  permitimos que tenga entre sus elementos a otros conjuntos. Con todo esto, lo
  que evitamos son las paradojas que surgen en teoría de conjuntos cuando
  permitimos que  un
  conjunto pueda contenerse a sí mismo. Por ejemplo, la
  [paradoja de Russell](https://es.wikipedia.org/wiki/Paradoja_de_Russell).

* **Morfismos:** los *funtores* pueden ser vistos como morfismos entre
  categorías. Son asociativos con la composición y tienen una identidad para
  cada categoría, así que cumplen todo lo que debe cumplir un morfismo.


Hasta aquí tendríamos la estructura de una categoría usual. Pero además, en esta
categoría podemos ir más allá de los funtores. Podemos dotarla de más estructura
de la que ya posee empezando a considerar las **transformaciones naturales**
como morfismos entre los funtores.

* **Morfismos entre morfismos**: las transformaciones naturales nos sirven como
  morfismos entre los funtores. Fijadas dos categorías, tendríamos un conjunto
  de funtores entre ellas, y las transformaciones naturales actuarían como
  morfismos en este conjunto.

Podemos comprobar que, dadas dos categorías fijas $$A,B$$, las transformaciones
naturales entre los funtores que van de una a otra vuelven a cumplir las reglas
que se esperan de los morfismos. Es decir:

* Existe una transformación natural identidad.

![]({{ site.baseurl }}/images/n-categories/f-id.svg)
{: .fig.med}

* Se componen de manera asociativa.

![]({{ site.baseurl }}/images/n-categories/f-comp.svg)
![]({{ site.baseurl }}/images/n-categories/f-comp2.svg)
{: .fig.med}

Esta es la llamada **composición vertical**, pero no es la única que puede
definirse entre transformaciones naturales. Las transformaciones naturales
pueden dotarse de otra composición, la
**composición horizontal**, que se da entre transformaciones naturales entre dos
pares de funtores tales que uno pueda componerse con el otro. En una imagen
puede apreciarse mejor:

   $$<imagen>$$

Para diferenciar ambas composiciones, notaremos la composición vertical con el
signo usual $$(\circ)$$ y la composición horizontal con el signo $$(\ast)$$.

Esta categoría de las categorías que hemos definido aquí es un ejemplo de **2-categoría**. La idea de considerar
morfismos sobre morfismos puede repetirse tantas veces como se quiera, dando
lugar a las **n-categorías**.


## Una definición informal

Para un $$n \in \mathbb{N} \cup \infty$$, una **n-categoría** consta de:

* Un conjunto de **objetos**, similar al que posee una categoría:

    $$A,B,\dots $$

* **1-morfismos** entre objetos, similares a los morfismos de una categoría:

    $$A \rightarrow B$$

* **2-morfismos**, que serán morfismos entre 1-morfismos:

    $$ <imagen> $$

* **3-morfismos**, que se definirán como morfismos entre 2-morfismos:

    $$ <imagen> $$

* ...

* **n-morfismos**, en general, que serán morfismos entre los (n-1)-morfismos.

Es decir, además de los morfismos entre objetos, que son lo que dotaba de
estructura a las categorías usuales, consideramos morfismos entre
estos morfismos. Y una vez dado este primer paso, nada nos impide considerar
morfismos
entre los morfismos entre los morfismos y repetir el proceso tantas veces
como queramos. Con inducción podemos terminar de definirlo hasta cualquier $$n$$.

De esta forma, las **2-categorías** son una generalización de las categorías
que permiten también morfismos entre los morfismos. Y de la misma forma, las
**n-categorías** son una generalización permitiendo morfismos entre
(n-1)-morfismos.

El último caso es el de las **$$\infty$$-categorías**, que simplemente poseen
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

Conforme la literatura sobre n-categorías aumentaba, quedaba una cuestión
fundamental: "*¿qué es exactamente una n-categoría?*" El problema surge porque
existen numerosas definiciones de n-categoría, sin que se
hayan probado equivalentes entre sí. Sorprendentemente, no tenemos una
definición única de n-categoría. Ocurre además, que para comparar dos
definiciones, lo razonable sería acudir a la categoría que generan los objetos
definidos por ellas. Por ejemplo, si quisiéramos comparar dos definiciones de
espacio topológico, podríamos acudir a las categorías de los espacios topológicos
que dan cada una de las definiciones y comprobar que fueran iguales. Pero si
hacemos esto para comprobar la igualdad en las **n-categorías**, nos
encontraríamos comprobando la igualdad entre dos **(n+1)-categorías**. Claro,
pero no tenemos definición de **(n+1)-categoría** y podríamos seguir ascendiendo
indefinidamente.

Entre las referencias está el trabajo de **Tom Leinster**, que recopila varias
definiciones [^ncats-def] y una lista de definiciones en **nLab**. [^ncats-nlab]




## (-1)-categorías

## La tabla periódica de categorías


## Referencias

https://www.youtube.com/watch?v=6bnU7_6CNa0
http://www.cs.ox.ac.uk/quantum/slides/clap4-eugeniacheng.pdf

[^ncats-applications]: Higher Categorical Structures and their Applications. [Proposed Research](http://www.math.uchicago.edu/~may/NCATS/ForWeb.pdf).
[^ncats-def]: A Survey of Definitions of n-Category. Tom Leinster. [ArXiv Jul 2001](http://arxiv.org/pdf/math/0107188v1.pdf)
[^ncats-nlab]: NLab: [N-Category](http://ncatlab.org/nlab/show/n-category#list_of_definitions)
