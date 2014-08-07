---
layout: chapter
title: La desigualdad de las medias
authors:
  - mario
category: matematicas
---

En varios problemas de optimización se pide
estudiar el mínimo o máximo de una función de varias variables
de las que se conoce su suma o su producto. Un procedimiento habitual es calcular la
derivada de una función sobre la que se ha aplicado ya la restricción que impone
la suma o el producto y buscar extremos absolutos entre los puntos críticos. 
Otro procedimiento común es usar los [multiplicadores de Lagrange](http://es.wikipedia.org/wiki/Multiplicadores_de_Lagrange).

Pero en ocasiones, es más simple usar desigualdades. La función puede
quedar acotada superior o inferiormente por alguna constante conocida,
como la suma de variables o el producto.
Entonces, si existe un caso de igualdad con la acotación, este debe ser el extremo
absoluto.

En este artículo se expone una de las desigualdades más útiles para acotación
de funciones de varias variables: la desigualdad de las medias.


## Generalizando la media

La desigualdad se basa en comparar las distintas formas de calcular una media
sobre un conjunto de números reales positivos. Cuando se habla de la *media* de un
conjunto de números, suele referirse a la media aritmética, pero hay varias formas de
generalizar este concepto de *media*.

Por un lado, hay varias *medias básicas* que funcionan en contextos específicos, como la
media geométrica en el cálculo de volúmenes o la media armónica en el cálculo de
velocidades. Por otro lado, las *medias de Hölder* son una generalización que
contiene a las medias básicas como caso particular.


### Generalizaciones básicas

#### La media aritmética
La **media aritmética**  ( $$\overline{x}$$ ) de una serie de valores positivos
$$x_1, x_2 \dots x_n$$ es su promedio.
Generaliza el punto medio entre dos valores $$\overline{x} = \frac{x_1+x_2}{2}$$,
definiendo un centro de gravedad que minimiza las desviaciones:

$$ \frac{1}{n} \sum_{i=1}^n x_i = \frac{x_1 + x_2 + \dots + x_n}{n}$$

Y podemos tomar una **media aritmética ponderada** otorgando a cada valor un peso
específico $$\{w_i\}$$:

$$ \displaystyle \frac{\sum_{i=1}^n x_iw_i}{\sum_{i=1}^n w_i} = \frac{x_1w_1 + x_2w_2 + \dots + x_nw_n}{w_1+w_2+\dots+w_n} $$

Aquí la media aritmética surge como caso particular tomando pesos: $$w_i = \frac{1}{n}$$.

#### La media geométrica
La **media geométrica** generaliza el punto que es al menor como el mayor es a él
$$\frac{x_1}{g} = \frac{g}{x_2}$$. Sería el lado del hipercubo que tuviera
igual volumen al hiperrectángulo que tiene como lados los valores dados:

$$\displaystyle \sqrt[n]{\prod_{i=1}^n x_i} = \sqrt[n]{x_1x_2 \dots x_n}$$

En su versión ponderada:

$$\displaystyle \left( \prod_{i=1}^n x_i^{w_i} \right)^{\frac{1}{\sum_{i=1}^n w_i}} = \sqrt[w_1+w_2+ \dots +w_n]{  x_1^{w_1} x_2^{w_2} \dots x_n^{w_n} }$$

#### La media armónica
La **media armónica**, (o *harmónica*, dependiendo de la pedantería del autor)
es inversa de la media aritmética de las inversas de los
elementos. Generaliza el punto en el que la razón de las diferencias a él
es igual a la razón entre los números: $$\frac{x_1-h}{h-x_2} = \frac{x_1}{x_2}$$.

Queda definida por:

$$\displaystyle \frac{n}{\sum_{i=1}^n \frac{1}{x_i}} = \frac{n}{\frac{1}{x_1} + \frac{1}{x_2} + \dots + \frac{1}{x_n}}$$

Y en su versión ponderada por:

$$\displaystyle \frac{\sum_{i=1}^n w_i}{\sum_{i=1}^n \frac{w_i}{x_i}} = \frac{w_1+w_2+\dots+w_n}{\frac{w_1}{x_1} + \frac{w_2}{x_2} + \dots + \frac{w_n}{x_n}}$$

Además, en un acorde mayor, la frecuencia de nota intermedia es la media armónica de las
otras dos notas que componen el acorde. Por ejemplo, el en el acorde de La Mayor
$$\mathtt{La-Do\#-Mi}$$:

$$
\begin{array}{l|c}
\text{Nota} & \text{Frecuencia} \\
\hline
\text{La} & \mathtt{440Hz} \\
\text{Do#} & \mathtt{528Hz} \\
\text{Mi} & \mathtt{660Hz} \\
\end{array}
$$

#### La media cuadrática
La **media cuadrática** es la raíz cuadrada de la media aritmética de los cuadrados
de los elementos. Queda definida por:

$$ \displaystyle \sqrt{\frac{\sum_{i=1}^n x_i^2}{n}} = \sqrt{\frac{x_1^2 + x_2^2 + \dots + x_n^2}{n}} $$

Y en su versión ponderada como:

$$ \displaystyle \sqrt{\frac{\sum_{i=1}^n x_i^2w_i}{\sum_{i=1}^n w_i}} = \sqrt{\frac{x_1^2w_1 + x_2^2w_2 + \dots + x_n^2w_n}{w_1+w_2+\dots+w_n}} $$

La desviación típica, por ejemplo, se define como la media cuadrática de las
desviaciones respecto a la media.

### Medias de Hölder

Las medias de Hölder generalizan estas medias básicas. [^holdermean]
La media de Hölder de exponente $$p \in \mathbb{R} \cup \{+\infty, -\infty\}$$, para $$x \in (\mathbb{R}^+)^n$$ es de la forma:

[^holdermean]: [Medias de Hölder](http://en.wikipedia.org/wiki/Generalized_mean)

$$ M_p ({x}) = \left(\frac{1}{n}\sum_{i=1}^n x_i^p \right)^{\frac{1}{p}} $$

Tomando límites para definirla cuando sea necesario:

$$ M_0 ({x}) = \lim_{p \to 0} M_p(x) $$

$$ M_{+\infty} ({x}) = \lim_{p \to +\infty} M_p(x) $$

$$ M_{-\infty} ({x}) = \lim_{p \to -\infty} M_p(x) $$

Las medias anteriores, así como el máximo y el mínimo son casos particulares
de las medias de Hölder. Además de los casos triviales, puede demostrarse
como ejercicio que los casos $$0,+\infty,-\infty$$ efectivamente se corresponden
con la media geométrica, el máximo y el mínimo.  [^gmeanproof]

[^gmeanproof]: [Derivación de la media geométrica como media de Hölder](http://planetmath.org/sites/default/files/texpdf/35741.pdf)

$$
\begin{array}{l|c|c}
\mathbf{Media} & \mathbf{Exponente} & \mathbf{Expresión} \\[1.5em]
\hline
\text{Mínimo} & p=-\infty & \min_i{(x_i)} \\[1em]
\text{Armónica} & p=-1 & \frac{n}{\frac{1}{x_1} + \frac{1}{x_2} + \dots + \frac{1}{x_n}} \\[1em]
\text{Geométrica} & p=0 &  \sqrt[n]{x_1x_2 \dots x_n} \\[1.5em]
\text{Aritmética} & p=1 & \frac{x_1 + x_2 + \dots + x_n}{n} \\[1em]
\text{Cuadrática} & p=2 & \sqrt{\frac{x_1^2 + x_2^2 + \dots + x_n^2}{n}}\\[1em]
\text{Máximo} & p=\infty &  \max_i{(x_i)} \\[1em]
\end{array}
$$

Podemos notar que las medias de Hölder para $$p \geq 1$$ son normas en 
$$\mathbb{R}^n$$ si se aplican sobre el vector de valores absolutos.
Las normas asociadas a $$p=1$$, $$p=2$$, $$p=+\infty$$ son
proporcionales a las normas de la suma, euclídea y del máximo, respectivamente. 
En general se puede definir la media de exponente $$p$$ como:

$$ \vert\vert x\vert\vert_p =  M_p(\vert x\vert) \sqrt[p]{n} $$

## La desigualdad

### Medias aritmética y geométrica

Las medias aritmética y geométrica cumplen la siguiente desigualdad, que se
convierte en igualdad si y sólo si todos los términos son iguales:

$$ \sqrt[n]{x_1x_2 \dots x_n} \leq \frac{x_1+x_2+\dots+x_n}{n} $$

Existen muchas demostraciones de la desigualdad, en Wikipedia se da una
[demostración inductiva](https://es.wikipedia.org/wiki/Desigualdad_de_las_medias_aritm%C3%A9tica_y_geom%C3%A9trica).
Para usar resultados más propios de Cálculo I, puede usarse la siguiente demostración:

*Tenemos que el logaritmo es una función creciente, biyectiva y convexa. Por ser
convexa se cumple la desigualdad siguiente:*

$$ \frac{ln(x_1)+ln(x_2)+\dots+ln(x_n)}{n} \leq ln\left(\frac{x_1+x_2+\dots+x_n}{n}\right) $$

$$ ln\left(\sqrt[n]{x_1x_2 \dots x_n}\right) \leq ln\left(\frac{x_1+x_2+\dots+x_n}{n}\right) $$

*Sabiendo además que es creciente, se obtiene la desigualdad buscada, con caso
de igualdad cuando todos los términos son iguales.*

### La desigualdad de las medias

La desigualdad de las medias usual incluye a las medias armónica y geométrica.
Como ejercicio, puede demostrarse la desigualdad armónica-geométrica desde la 
geométrica-aritmética y la desigualdad aritmética-cuadrática desde la desigualdad
de [Cauchy-Schwarz](http://es.wikipedia.org/wiki/Desigualdad_de_Cauchy-Schwarz).

La desigualdad completa queda como:

$$ \frac{n}{\frac{1}{x_1} + \frac{1}{x_2} + \dots + \frac{1}{x_n}} \leq \sqrt[n]{x_1x_2 \dots x_n} \leq \frac{x_1+x_2+\dots+x_n}{n} \leq \sqrt{\frac{x_1^2+x_2^2+\dots+x_n^2}{n}} $$

### Desigualdad con medias de Hölder

Todavía puede generalizarse más, notando que, fijado un vector 
$$ x \in (\mathbb{R^+})^n $$, la siguiente función $$ f: \mathbb{R} \to \mathbb{R} $$ es creciente:

$$ f(a) = \left\{ \begin{matrix} \left(\frac{x_1^a+x_2^a+\dots+x_n^a}{n}\right)^{1/a} & si & a \neq 0 \\ \displaystyle \sqrt[n]{x_1x_2 \dots x_n} & si & a = 0\end{matrix} \right.$$

Pueden hallarse varias demostraciones de la desigualdad. En particular, puede
probarse fácilmente desde la desigualdad de Jensen, la misma que hemos usado para
probar la desigualdad entre medias geométrica y aritmética. [^generalproof]

[^generalproof]: [Demostración de la desigualdad de las medias generalizada](http://planetmath.org/sites/default/files/texpdf/33619.pdf)

## Cálculo de extremos

Como ejemplos, tomamos dos ejercicios de los apuntes de [Cálculo diferencial en
una y varias variables](http://www.ugr.es/~fjperez/textos/Calculo_Diferencial_Varias_Variables.pdf), 
de Francisco Javier Pérez. Ambos se refieren a hallar extremos en el volumen de
figuras geométricas. Como la desigualdad de las medias llega a la igualdad cuando
todos los términos son iguales, las soluciones suelen ser aquellas que igualan lados
o dotan de algún tipo de simetría a la figura.

### Maximizando el área

La utilidad de la desigualdad viene dada precisamente por el caso de igualdad, 
que permite hallar el extremo absoluto de la suma dado el producto o viceversa. 
Puede verse en el siguiente problema:

**Hallar, entre todos los rectángulos de perímetro 4, aquel con área máxima.**

Llamando $$a,b$$ a los lados y $$p$$ al perímetro, aplicamos la desigualdad
entre las medias geométrica y aritmética:

$$ A = ab = \left(\sqrt{ab}\right)^2 \leq \left(\frac{a+b}{2}\right)^2 = \left(\frac{1}{4}p\right)^2 = 1$$

Hemos acotado el área posible. Y como el caso de igualdad se da con la igualdad 
entre términos, tenemos $$a=b=1$$.

### Minimizando el volumen
**Trazar un plano que pase por el punto $$(1,2,3)$$ y que forme con los ejes
coordenados un tetraedro de volumen mínimo.**

El plano podrá ser escrito como:

$$ \frac{x}{a} + \frac{y}{b} + \frac{z}{c} - 1 = 0$$

Y para que contenga al punto pedido, deberá cumplirse que:

$$ \frac{1}{a} + \frac{2}{b} + \frac{3}{c} - 1 = 0 $$

Como el plano cortará a los ejes en los puntos $$(a,0,0)$$, $$(0,b,0)$$ y $$(0,0,c)$$,
el área del tetraedro formado será $$V=\frac{1}{3}\left(\frac{1}{2}ab\right)c$$.
La acotaremos usando desigualdad entre las medias geométrica y armónica:

$$ V = a\frac{b}{2}\frac{c}{3} = \left( \sqrt[3]{a\frac{b}{2}\frac{c}{3}} \right)^3 \geq \left( \frac{3}{a + \frac{b}{2} + \frac{c}{3}} \right)^3 = 27 $$

Dándose el caso de igualdad con la igualdad entre elementos, es decir:

$$ a = \frac{b}{2} = \frac{c}{3} $$

Luego $$a=3, b=6, c=9$$.
