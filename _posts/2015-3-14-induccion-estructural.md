---
layout: post
title: Inducción Estructural
authors:
  - M42
category: Lógica
---

Normalmente aplicamos inducción sobre los números naturales, y cuando
necesitamos aplicar inducción en otro contexto, lo llevamos a los números
naturales. Por ejemplo, si queremos demostrar una propiedad sobre los árboles
binarios, la demostraríamos por inducción sobre la altura del árbol. Pero el
proceso de llevar todo a los naturales puede ser incómodo, tedioso y complicar
la demostración innecesariamente. En este post vamos a desarrollar una forma de
ampliar la inducción a la estructura de los tipos de datos para simplificar
todas esas demostraciones.


## Conjuntos bien fundados

Vamos a definir las relaciones bien fundadas, que nos permitirán definir una
inducción generalizada. [^stackexchangeblog-induction]

**Relación bien fundada**
: Una relación en un conjunto de elementos es bien fundada si todo subconjunto
no vacío tiene un elemento minimal. Dado un orden parcial, es bien fundado si
todo subconjunto no vacío tiene un elemento tal que ninguno es menor que él.

Y podemos realizar inducción sobre cualquier conjunto con una relación bien
fundada.

**Inducción noetheriana**
: Sea $$X$$ un conjunto bien fundado con $$A \subset X$$. Si se cumple:

  $$ (y<x \Rightarrow y \in A) \Rightarrow x \in A $$

  Entonces $$A = X$$.


[^stackexchangeblog-induction]: Sobre generalizaciones de la inducción <http://math.blogoverflow.com/2015/03/10/when-can-we-do-induction/>


## Inducción sobre tipos

Ahora vamos a aplicar esto a teoría de tipos. Sea un tipo con sus constructores.
Para todas las instancias constructibles del tipo (pueden generarse en un número
finito de pasos desde sus constructores), definimos un orden parcial:

**Orden constructivo**
: Para dos instancias del tipo: $$a,b::A$$, $$a$$ se construye con $$b$$ si el
  constructor de $$a$$ toma a $$b$$ como argumento. La clausura transitiva de
  esta relación forma un orden parcial:

    $$ a \leq b \Rightarrow a \mbox{ se usa en la construcción de } b$$

Y ahora tenemos una inducción sobre los constructores de los tipos, que
describimos ahora.

**Inducción sobre tipos**
: Sea un tipo $$A$$ con constructores y sea $$P :: A \rightarrow Bool $$ una propiedad.
  Siendo $$a_1, a_2 \dots a_i :: A$$ argumentos del constructor, si se
  cumple la condición de inducción:

    $$P(a_1) \wedge P(a_2) \wedge \dots P(a_i) \Rightarrow P(C0(a_1,a_2,\dots,b_0,b_1\dots))$$

  Entonces $$a::A \Rightarrow P(a)$$


## Ejemplo 1: Naturales

Nuestro primer ejemplo va a ser obtener la inducción sobre los naturales como
caso particular. Damos una definición de los naturales en lenguaje `Coq`, con
los axiomas de Peano, un natural es 0 o el siguiente de un natural:

~~~ Coq
Inductive nat : Type :=
  | O : nat
  | S : nat -> nat
~~~

Es decir, si lo demostramos para `0` y para `S n` sabiéndolo para `n`, lo
hemos demostrado para todos los naturales.
