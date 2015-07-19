---
layout: post
title: Algoritmos Genéticos
authors:
  - andreshp
category: Heurísticas
---

El objetivo de un matemático e informático consiste en resolver problemas. Los problemas de optimización son un claro ejemplo de cuestiones resolubles mediante la aplicación conjunta de la informática y las matemáticas. Sin embargo, existen algunos problemas de optimización (como el *problema del viajante de comercio* y todos aquellos que sean NP Hard) para los que no se conoce ningún algoritmo polinomial que los resuelva. En estos casos la aplicación de algoritmos exactos que recorran de forma óptima todo el conjunto de soluciones no es viable por el tiempo necesario. Tenemos que recurrir a otras herramientas: las **heurísticas**.

<!--more-->

Dado determinado problema de optimización, una **heurística** es un proceso que calcula una solución que satisface determinados criterios de calidad. Puede no calcular la mejor solución posible. Sin embargo, sí intenta que esta sea suficiente para nuestros objetivos manteniendo una eficiencia aceptable.

Los **algoritmos genéticos** son heurísticas basadas en poblaciones y en los conceptos de evolución y genética. En la naturaleza, las poblaciones de individuos evolucionan con el tiempo gracias a tres factores: la **selección natural**, la **reproducción** y la **mutación**. Los algoritmos genéticos imitan estos procesos para conseguir evolucionar una población de soluciones iniciales.

En los repositorios del doble grado se encuentran unos [apuntes](https://github.com/dgiim/AlgoritmosGeneticos) que explican el funcionamiento de estos algoritmos de forma detallada. Se encuentran protegidos bajo licencia [CC BY-NC 4.0](http://creativecommons.org/licenses/by-nc/4.0/).
