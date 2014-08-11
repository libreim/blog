---
layout: post
title: Introducción a la teoría de categorías
authors:
  - mario
category: matematicas
---

Introducción
---
*Motivación relacionando categorías en espacios vectoriales, grupos, anillos, espacios topológicos y métricos.*

Definición de categoría
---
Una categoría $\mathtt{C}$ está formada por:
> 1. La clase de objetos de la categoría, $Obj(\mathtt{C})$
> 2. Un conjunto de morfismos $Hom(A,B)$ entre cada dos objetos $A,B \in \mathtt{C}$.

Y debe cumplir las siguientes propiedades:
>    1. Para dos morfismos $f \in Hom(A,B)$, $g \in Hom(B,C)$, existe su composición $f \circ g$:
        $$ Fig. 1$$
>    2. La composición es asociativa: $ f \circ (g \circ h) = (f \circ g) \circ h $
        $$ Fig. 2 $$
>    3. Existe la identidad como morfismo entre un objeto consigo mismo $\exists\ 1_{A} \in Hom(A,A)$. Será neutra para la composición: $\forall f \in Hom(A,B): f \circ 1_{A} = 1_{B} \circ f = f$
        $$ Fig. 3 $$



Diagramas conmutativos
---
En teoría de cateforías usaremos diagramas conmutativos para expresar relaciones entre morfismos y objetos. Un morfismo entre dos conjuntos $f \in Hom(A,B)$ lo notaremos por:
$$ \require{AMScd} \begin{CD} A @>{f}>> B \end{CD}$$

Y un diagrama de morfismos será conmutativo cuando todas las formas de recorrerlo componiendo los morfismos den lugar al mismo morfismo composición. Entre las propiedades se pueden ver ejemplos.

*Explicar diagramas conmutativos, su uso y sus propiedades. Lo que representan formalmente.*


Ejemplos de categorías
---
*Categoría de los conjuntos $\mathtt{Set}$.*
*Categoría derivada de una relación en un conjunto $(\sim,\mathcal{S})$.*
*Categoría de los grupos $\mathtt{Grp}$ y subcategoría de los grupos abelianos $\mathtt{Ab}$.*

Propiedades universales
---
*Objetos y morfismos iniciales y finales.*

Referencias
---
**Algebra: Chapter 0** - *Paolo Aluffi*
**Math & Programming** - [Introducing Categories](http://jeremykun.com/2013/04/24/introducing-categories/) - *Jeremy Kun*
