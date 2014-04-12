---
layout: chapter
title: La desigualdad de las medias.
---

### Introducción

En varios problemas de extremos, tanto en Cálculo como en Análisis I se pide estudiar el mínimo o máximo de una función determinada de varias variables, condicionando su suma o producto. Habitualmente, se procede a calcular la derivada de una función sobre la que se ha aplicado ya la restricción y a buscar extremos absolutos entre sus puntos críticos.

Pero existe otra forma de proceder, en ocasiones más simple. La función puede quedar acotada superior o inferiormente por la suma que tenemos condicionada, y al comprobar que la acotación da un caso de igualdad, obtenemos el extremo absoluto.



### Media Geométrica y Aritmética

Las medias aritmética y geométrica cumplen la siguiente desigualdad, que se convierte en igualdad si y sólo si todos los términos son iguales:

`$$ \sqrt[n]{x_1x_2 \dots x_n} \leq \frac{x_1+x_2+\dots+x_n}{n} $$`

Existen muchas demostraciones de la desigualdad, en Wikipedia se da una [demostración inductiva](https://es.wikipedia.org/wiki/Desigualdad_de_las_medias_aritm%C3%A9tica_y_geom%C3%A9trica). Para usar resultados más propios de Cálculo I, puede usarse la siguiente demostración:

*Tenemos que el logaritmo es una función creciente, biyectiva y convexa. Por ser convexa se cumple la desigualdad siguiente:*
`$$ \frac{ln(x_1)+ln(x_2)+\dots+ln(x_n)}{n} \leq ln\left(\frac{x_1+x_2+\dots+x_n}{n}\right) $$`
`$$ ln\left(\sqrt[n]{x_1x_2 \dots x_n}\right) \leq ln\left(\frac{x_1+x_2+\dots+x_n}{n}\right) $$`
*Sabiendo además que es creciente, se obtiene la desigualdad buscada, con caso de igualdad cuando todos los términos son iguales.*


### Cálculo de extremos

La utilidad de la desigualdad viene dada precisamente por el caso de igualdad, que permite hallar el extremo absoluto de la suma dado el producto o viceversa. Puede verse en el siguiente ejemplo simple:

**Hallar, entre todos los rectángulos de perímetro 4, aquel con área máxima.**

Llamando `$a,b$` a los lados y `$p$` al perímetro, tenemos:
`$$ A = ab = \left(\sqrt{ab}\right)^2 \leq \frac{a+b}{2} = \frac{1}{4}p = 1$$`
Hemos acotado el área posible. Y como el caso de igualdad se da con la igualdad entre términos, tenemos `$a=b=1$`.


### La desigualdad de las medias

La desigualdad de las medias completa incluye a la media cuadrática y armónica, de esta forma:
`$$ \frac{n}{\frac{1}{x_1} + \frac{1}{x_2} + \dots + \frac{1}{x_n}} \leq \sqrt[n]{x_1x_2 \dots x_n} \leq \frac{x_1+x_2+\dots+x_n}{n} \leq \sqrt{\frac{x_1^2+x_2^2+\dots+x_n^2}{n}} $$`
Todavía puede generalizarse más, notando que, fijado un vector `$ x \in (\mathbb{R^+})^n $`, la siguiente función `$ f: \mathbb{R} \to \mathbb{R} $` es creciente:
`$$ f(a) = \left\{ \begin{matrix} \left(\frac{x_1^a+x_2^a+\dots+x_n^a}{n}\right)^{1/a} & si & a \neq 0 \\ \displaystyle \sqrt[n]{x_1x_2 \dots x_n} & si & a = 0\end{matrix} \right.$$`