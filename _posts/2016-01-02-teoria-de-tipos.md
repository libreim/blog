---
layout: post
title: Teoría de tipos
authors:
  - M42
category: Álgebra
---

## Álgebra de tipos

En un post anterior hemos tratado el álgebra de tipos.

[Álgebra de tipos](http://dgiim.github.io/blog/2015/03/24/algebra-tipos/)

El post se basó sobre estos tres posts de Chris Taylor.

[The algebra of algebraic data types, Part I](http://chris-taylor.github.io/blog/2013/02/10/the-algebra-of-algebraic-data-types/)
[The algebra of algebraic data types, Part II](http://chris-taylor.github.io/blog/2013/02/11/the-algebra-of-algebraic-data-types-part-ii/)
[The algebra of algebraic data types, Part III](http://chris-taylor.github.io/blog/2013/02/13/the-algebra-of-algebraic-data-types-part-iii/)

La teoría de funciones generadoras necesaria para entender el tratamiento de los
árboles binarios la explica Mike Spivey
[aquí](https://mikespivey.wordpress.com/2013/03/19/the-catalan-numbers-from-their-generating-function/).

Además, existe un resultado de Fiore y Leinster que afirma que si demostramos
una relacion polinómica para números complejos, también será válida para
cualquier semianillo. Y por tanto, para los tipos.
Esto quiere decir que, en la mayoría de las ocasiones, podemos usar
la resta o la división de tipos como si existieran. La demostración excluye
algunos casos particulares y se expone aquí:

[Objects of categories as complex numbers](http://arxiv.org/pdf/math/0212377v1.pdf)

Sobre el uso de las derivadas en el álgebra de tipos existe un resultado de
Conor McBride que relaciona las derivadas parciales con los *zippers* de Haskell
usados para representar contextos. Puede leerse aquí:

[The derivative of a regular type is its type of one-hole contexts](http://strictlypositive.org/diff.pdf).


<!--more-->
