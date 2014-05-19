---
layout: chapter
title: La desigualdad de las medias
authors:
  - mario
category: matematicas
---

## Introducción

En varios problemas de optimización se pide
estudiar el mínimo o máximo de una función de varias variables
fijando su suma o su producto. El procedimiento estándar es calcular la
derivada de una función sobre la que se ha aplicado ya la restricción y buscar
extremos absolutos entre sus puntos críticos o aplicar el método de los
[multiplicadores de Lagrange](http://es.wikipedia.org/wiki/Multiplicadores_de_Lagrange).

Pero existe otra forma de proceder, en ocasiones más simple. La función puede
quedar acotada superior o inferiormente por la suma que tenemos condicionada,
quedando acotada por una constante.
Al comprobar que la acotación da un caso de igualdad, obtenemos el extremo
absoluto.


## Generalizando la media

### Las medias pitagóricas

##### La media aritmética ponderada
La **media aritmética** `$\overline{x}$` de una serie de valores positivos `$\{x_i\}$` es su promedio.
Generaliza el punto medio entre dos valores `$\overline{x} = \frac{x_1+x_2}{2}$`,
definiendo un centro de gravedad entre los valores:

`$$ \frac{1}{n} \sum_{i=1}^n x_i = x_1 + x_2 + \dots + x_n $$`

Y podemos tomar una **media aritmética ponderada** otorgando a cada valor un peso
específico `$\{w_i\}$`:

`$$ \frac{\sum_{i=1}^n x_iw_i}{\sum_{i=1}^n w_i}  $$`

Aquí la media aritmética surge como caso particular tomando pesos: `$w_i = \frac{1}{n}$`.

##### La media geométrica



#### Medias de Hölder




## La desigualdad

### Medias aritmética y geométrica

Las medias aritmética y geométrica cumplen la siguiente desigualdad, que se
convierte en igualdad si y sólo si todos los términos son iguales:

`$$ \sqrt[n]{x_1x_2 \dots x_n} \leq \frac{x_1+x_2+\dots+x_n}{n} $$`

Existen muchas demostraciones de la desigualdad, en Wikipedia se da una
[demostración inductiva](https://es.wikipedia.org/wiki/Desigualdad_de_las_medias_aritm%C3%A9tica_y_geom%C3%A9trica).
Para usar resultados más propios de Cálculo I, puede usarse la siguiente demostración:

*Tenemos que el logaritmo es una función creciente, biyectiva y convexa. Por ser
convexa se cumple la desigualdad siguiente:*
`$$ \frac{ln(x_1)+ln(x_2)+\dots+ln(x_n)}{n} \leq ln\left(\frac{x_1+x_2+\dots+x_n}{n}\right) $$`
`$$ ln\left(\sqrt[n]{x_1x_2 \dots x_n}\right) \leq ln\left(\frac{x_1+x_2+\dots+x_n}{n}\right) $$`
*Sabiendo además que es creciente, se obtiene la desigualdad buscada, con caso
de igualdad cuando todos los términos son iguales.*

### La desigualdad de las medias

La desigualdad de las medias completa incluye a la media cuadrática y armónica, de esta forma:
`$$ \frac{n}{\frac{1}{x_1} + \frac{1}{x_2} + \dots + \frac{1}{x_n}} \leq \sqrt[n]{x_1x_2 \dots x_n} \leq \frac{x_1+x_2+\dots+x_n}{n} \leq \sqrt{\frac{x_1^2+x_2^2+\dots+x_n^2}{n}} $$`
Todavía puede generalizarse más, notando que, fijado un vector `$ x \in (\mathbb{R^+})^n $`, la siguiente función `$ f: \mathbb{R} \to \mathbb{R} $` es creciente:
`$$ f(a) = \left\{ \begin{matrix} \left(\frac{x_1^a+x_2^a+\dots+x_n^a}{n}\right)^{1/a} & si & a \neq 0 \\ \displaystyle \sqrt[n]{x_1x_2 \dots x_n} & si & a = 0\end{matrix} \right.$$`



## Cálculo de extremos

### Un ejemplo simple

La utilidad de la desigualdad viene dada precisamente por el caso de igualdad, que permite hallar el extremo absoluto de la suma dado el producto o viceversa. Puede verse en el siguiente ejemplo simple:

**Hallar, entre todos los rectángulos de perímetro 4, aquel con área máxima.**

Llamando `$a,b$` a los lados y `$p$` al perímetro, tenemos:
`$$ A = ab = \left(\sqrt{ab}\right)^2 \leq \frac{a+b}{2} = \frac{1}{4}p = 1$$`
Hemos acotado el área posible. Y como el caso de igualdad se da con la igualdad entre términos, tenemos `$a=b=1$`.
