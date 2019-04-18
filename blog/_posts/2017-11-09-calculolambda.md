---
layout: post
title: Recursos sobre cálculo lambda
authors:
    - Mario Román
lang: es
category: Lógica
---

> 1936 - Alonzo Church also invents every language that will ever be
> but does it better. His lambda calculus is ignored because it is
> insufficiently C-like. This criticism occurs in spite of the fact
> that C has not yet been invented.
>
> -- *[A Brief, Incomplete, and Mostly Wrong History of programming languages](http://james-iry.blogspot.com.es/2009/05/brief-incomplete-and-mostly-wrong.html)*

Alonzo Church desarrolló el cálculo lambda en los años 30 como un
sistema formal que capturaba una noción abstracta de función. Este
sistema puede interpretarse a su vez como un modelo de computación
equivalente a las máquinas de Turing.  Refinamientos posteriores
añadieron tipos al lenguaje, que serían la base de una correspondencia
entre modelos de computación y sistemas lógicos.

## Apuntes generales
Pueden encontrarse presentaciones generales sobre el cálculo lambda en:

 * Peter Selinger, [Lecture notes on the lambda calculus](http://www.mathstat.dal.ca/~selinger/papers/lambdanotes.pdf).
 * Raúl Rojas, [A Tutorial Introduction to the Lambda Calculus](https://www.utdallas.edu/%7Egupta/courses/apl/lambda.pdf)
 * H.P. Barendregt, The Lambda Calculus, its syntax and semantics.

<!--more-->

En particular, hemos publicado [tres capítulos sobre cálculo lambda](https://github.com/M42/lambda.notes)
como parte de una serie de notas sobre categorías y computación, y una [presentación](https://mroman42.github.io/talks/untypedlambda.pdf)
sobre las bases del cálculo lambda. Tratan

 1. cálculo lambda no tipado,
 2. cálculo lambda simplemente tipado, y
 3. el isomorfismo de Curry-Howard.

La mayoría de las demostraciones allí expuestas usan [inducción estructural](/blog/2015/03/14/induccion-estructural/).

## Intérpretes de cálculo lambda
Junto a esas notas, se ofrece un intérprete de cálculo lambda no tipado y
simplemente tipado.

 * [Mikrokosmos](https://mroman42.github.io/mikrokosmos/), intérprete de cálculo lambda.
 * [Tutorial de Mikrokosmos](https://mroman42.github.io/mikrokosmos/tutorial.html), explicando cómo programar en el cálculo lambda.
 * [Código fuente](https://github.com/M42/mikrokosmos), en Haskell y licenciado bajo GPLv3.

Muchos otros intérpretes de cálculo lambda pueden encontrarse en
Internet, así como tutoriales para escribir un intérprete

 * [The Glambda interpreter](https://github.com/goldfirere/glambda),
   cuyo código sirve como introducción a GADTs en Haskell;
 * [A λ-calculus interpreter](https://tadeuzagallo.com/blog/writing-a-lambda-calculus-interpreter-in-javascript/) un
   tutorial en Javascript.

## Isomorfismo de Curry-Howard
El isomorfismo de Curry-Howard es una correspondencia profunda entre tipos y lógica que
se manifiesta en correspondencias particulares entre ciertos sistemas de tipos y ciertos
sistemas lógicos. Por ejemplo, el sistema de tipos del *cálculo lambda simplemente tipado*
se corresponde con la *lógica proposicional intuicionista*.

Puede leerse más sobre este isomorfismo en

 * [Propositions as Types](http://homepages.inf.ed.ac.uk/wadler/papers/propositions-as-types/propositions-as-types.pdf), de Philip Wadler;
 * [Los apuntes sobre Curry-Howard](https://libreim.github.io/blog/2014/12/04/curry-howard/), de este mismo blog; y
 * [A tutorial on the Curry-Howard Correspondence](http://purelytheoretical.com/papers/ATCHC.pdf), de Darryl McAdams.

