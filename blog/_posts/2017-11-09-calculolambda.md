---
layout: post
title: Recursos sobre cálculo lambda
authors:
    - Mario Román
lang: es
category: Lógica
---

## Apuntes generales
Apuntes generales sobre el cálculo lambda pueden encontrarse en:

 * Peter Selinger, [Lecture notes on the lambda calculus](http://www.mathstat.dal.ca/~selinger/papers/lambdanotes.pdf).
 * Raúl Rojas, [A Tutorial Introduction to the Lambda Calculus](https://www.utdallas.edu/%7Egupta/courses/apl/lambda.pdf)
 * H.P. Barendregt, The Lambda Calculus, its sintax and semantics.

<!--more-->

Como parte del trabajo fin de grado, he publicado un repositorio con [tres capítulos sobre cálculo lambda](https://github.com/M42/lambda.notes) que se irá extendiendo conforme avance. Actualmente
contiene notas sobre:

 * 1. cálculo lambda no tipado,
 * 2. cálculo lambda simplemente tipado, y
 * 3. el isomorfismo de Curry-Howard.

La mayoría de las demostraciones allí expuestas usan [inducción estructural](/blog/2015/03/14/induccion-estructural/).

## Intérpretes de cálculo lambda
Como parte de ese mismo trabajo, se ofrece un intérprete de cálculo
lambda tipado y simplemente tipado.

 * [Mikrokosmos](https://m42.github.io/mikrokosmos/), intérprete de cálculo lambda.
 * [Tutorial de Mikrokosmos](https://m42.github.io/mikrokosmos/tutorial.html), explicando cómo programar en el cálculo lambda.
 * [Código fuente](https://github.com/M42/mikrokosmos), en Haskell y licenciado bajo GPLv3.

Muchos otros intérpretes de cálculo lambda están disponibles, así como tutoriales para escribir un
intérprete

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

