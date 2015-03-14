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
inducción generalizada.

**Relación bien fundada**
: Una relación en un conjunto de elementos es bien fundada si todo subconjunto
no vacío tiene un elemento minimal.

**Inducción noetheriana**
: Sea $X$ un conjunto bien fundado. Sea $A \subset X$, si se cumple:
$$ (y<x \longrigtharrow y \in A) \longrigtharrow x \in A $$
Entonces $A = X$.

[^stackexchangeblog-induction]: http://math.blogoverflow.com/2015/03/10/when-can-we-do-induction/
