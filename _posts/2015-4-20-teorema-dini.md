---
layout: post
title: Teorema de Dini
authors:
  - andreshp
category: Análisis
---

## Convergencia Puntual y Convergencia Uniforme

En el Análisis Matemático es frecuente que la función solución a determinado problema sea desconocida o no la podamos expresar en términos de las funciones elementales que conocemos. Incluso en las funciones más simples, como la exponencial o el logaritmo, nos encontramos esta situación. Conocemos su existencia y propiedades características pero tenemos ciertas dificultades a la hora de evaluarlas en un punto. Es frecuente para ello utilizar los famosos polinomios de Taylor, en cuyo caso estamos aproximando la función por polinomios.

En más situaciones es habitual disponer de funciones que se aproximan cada vez más a la solucion del problema. Para formalizar este hecho surge el concepto de convergencia para sucesiones de funciones. Podemos distinguir dos tipos de convergencia: convergencia puntual y convergencia uniforme.

Definición 1
: Sea $$A \subseteq \mathbb{R}$$ y $$\{f_n\}$$ una sucesión de funciones con $$\ f_n : A \rightarrow \mathbb{R}$$. Se dice que $$\{f_n\}$$ **converge puntualmente** en $$x \in A$$ si la sucesión $$\{f_n(x)\}$$ converge. Podemos considerar el conjunto $$C$$ de los elementos $$x \in A$$ en los que hay convergencia puntual y definir la **función límite**:
: $$f : C \rightarrow \mathbb{R}, \ f(x) = \lim f_n(x) \ \forall x \in C$$

<!--more-->

Nótese que la definición es puramente topológica para espacios con unicidad del límite (como los espacios de Hausdorff). Sin embargo, para que todo lector pueda seguir el texto sin un curso inicial de topología trabajaremos solamente con conjuntos de números reales.

Podemos exigirle más a la convergencia puntual y obtener la convergencia uniforme:

Definición 2
: Sea $$A \subseteq \mathbb{R}$$ y $$\{f_n\}$$ una sucesión de funciones con $$\ f_n : A \rightarrow \mathbb{R}$$. Se dice que $$\{f_n\}$$ **converge uniformemente** en $$B \subseteq A$$ si para cada $$\varepsilon > 0$$ existe $$n_o \in \mathbb{N}$$ tal que:
: $$\forall n \ge n_o : \left| f_n(x) - f(x) \right| < \varepsilon \ \forall x \in B$$

La convergencia uniforme implica la convergencia puntual, pero el recíproco no es cierto. Un ejemplo de este caso es el siguiente, que se deja como ejercicio para el lector.

Ejemplo 1
: Probar que la siguiente sucesión de funciones converge puntualmente pero no converge uniformemente en $$[0,1]$$:
: $$f_n : [0,1] \rightarrow \mathbb{R}, \ f_n(x) = x^n \ \forall x \in [0,1]$$

Cabe preguntarse para qué sirve la convergencia uniforme. Intuitivamente, nos dice que la sucesión de funciones converge con igual rapidez en todo $$B$$. Analíticamente podemos sacarle provecho al relacionarla con conceptos como la continuidad, la derivabilidad y la integral. Por ejemplo, en todo curso de análisis en el que se trate este tema se demuestra que si la convergencia es uniforme y las funciones que conforman la sucesión son continuas, entonces la función límite es continua. En definitiva, la convergencia uniforme nos permite obtener información analítica de la función límite exigiendo ciertas propiedades a las funciones que conforman la sucesión.

Sin embargo, muchos de los ejercicios a realizar en el correspondiente curso simplemente piden estudiar la convergencia uniforme de una sucesión de funciones. A veces esto se vuelve tedioso como es el caso del siguiente ejercicio [^ejercicios]:

Ejemplo 2
: Estudia la convergencia puntual y uniforme de la sucesión de funciones $$\{f_n\}$$ donde $$\ f_n : \mathbb{R} \rightarrow \mathbb{R}$$ está definida por:
: $$f_n(x) = \left(1+\frac{x^2}{n}\right)^n \ \forall x \in \mathbb{R}$$

**Solución.** Usando que

$$\lim_{x \rightarrow \infty}\left(1+\frac{1}{x}\right)^x = e$$

Se obtiene

$$\lim_{n \rightarrow \infty}\left(1+\frac{x^2}{n}\right)^n = \exp\left(x^2\right)$$

Luego la función límite es $$\ f(x) = \exp\left(x^2\right)$$ en todo $$\mathbb{R}$$.

No hay convergencia uniforme en ninguna semirrecta de $$\mathbb{R}$$ pues para $$x_n = \sqrt n$$ se tiene que

$$\lim_{n \rightarrow \infty} f_n(x_n) - f(x_n) = \lim_{n \rightarrow \infty}\left(1+\frac{n}{n}\right)^n - e^n = \lim_{n \rightarrow \infty} 2^n - e^n = -\infty$$

$$\lim_{n \rightarrow \infty} f_n(-x_n) - f(-x_n) = \lim_{n \rightarrow \infty} f_n(x_n) - f(x_n) = -\infty$$

y de haber convergencia uniforme para cualquier sucesión de números reales $$\{x_n\}$$ se verificaría que la sucesión $$\{f_n(x_n) - f(x_n)\}$$ converge a 0.

Sin embargo, sí hay convergencia uniforme en los intervalos del tipo $$[-\alpha, \alpha]$$ para $$\alpha > 0$$ como probaremos a continuación. Puede el lector saltarse este tedioso desarrollo ya que conseguiremos el mismo resultado aplicando el teorema de Dini.

Sea $$\alpha > 0$$. Definimos la siguiente función, que resulta ser continua:

$$\phi(t) = \frac{\log(1+t)}{t}, \ \forall -1 < t \neq 0, \phi(0) = 1$$

Tenemos que

$$\left| \left(1+\frac{x^2}{n}\right)^n - \exp\left(x^2\right) \right| =
\exp\left(x^2\right) \left| \left(\frac{\left(1+\frac{x^2}{n}\right)^\frac{n}{x^2}}{e}\right)^{x^2} - 1 \right| =$$

$$\exp\left(x^2\right) \left| \exp\left( x^2\left(\phi\left(\frac{x^2}{n}\right) - 1\right)\right) -1 \right| \le
\exp\left(\alpha^2  \right) \left| \exp\left( x^2\left(\phi \left(\frac{x^2}{n}\right) - 1\right)\right) -1 \right|$$

Sea $$\varepsilon > 0$$, utilizaremos la continuidad de $$\phi$$ junto con la continuidad de la función exponencial para obtener el resultado deseado.

Por la continuidad de la exponencial en 0, existe $$\delta_1 > 0$$ tal que si $$\vert u \vert < \delta_1$$ entonces $$\ \vert e^u -1 \vert < \frac{\varepsilon}{\exp\left(\alpha^2\right)}$$. Aplicamos ahora la continuidad de $$\phi$$ en 0 para obtener $$\delta_2 > 0$$ tal que si $$\ \vert t\vert < \delta_2$$ entonces $$\ \vert \phi(t) -1\vert < \frac{\delta_1}{\alpha^2}$$.

Tomemos $$n_0 \in \mathbb{N}$$ tal que $$\frac{\alpha^2}{n_0} < \delta_2$$. Entonces, para todo $$x \in [-\alpha, \alpha]$$ y $$n \ge n_0$$ se tiene que:

$$\frac{x^2}{n} < \delta_2 \Rightarrow
\left| \phi \left(\frac{x^2}{n}\right) -1\right| < \frac{\delta_1}{\alpha^2} \Rightarrow
\left| x^2 \left( \phi \left(\frac{x^2}{n}\right) -1 \right) \right| < \delta_1 \Rightarrow$$

$$\left| \exp\left(x^2\left(\phi \left(\frac{x^2}{n}\right) - 1\right)\right) - 1\right| < \frac{\varepsilon}{\exp(\alpha^2)}$$

De donde se deduce que

$$\left| \left(1+\frac{x^2}{n}\right)^n - \exp\left(x^2\right) \right| \le \exp\left(\alpha^2\right) \left| \exp\left( x\left(\phi \left(\frac{x^2}{n}\right) - 1\right)\right) -1\right| < \varepsilon $$

Se ha obtenido la definición de convergencia uniforme en $$[-\alpha, \alpha]$$. Nótese que esto implica que hay convergencia uniforme en cualquier intervalo cerrado y acotado.

$$\tag*{$\blacksquare$}$$

## Teorema de Dini

El teorema de Dini es uno de los pocos resultados que transforman la convergencia puntual en convergencia uniforme. Podremos aplicarlo en intervalos del tipo $$[a, b]$$ si se verifican ciertas condiciones, como veremos que sucede en el ejemplo anterior.

Enunciado
: Sean $$a,b \in \mathbb{R}$$ y $$\ f_n : [a,b] \rightarrow \mathbb{R}$$ continua para todo $$n \in \mathbb{N}$$. Se considera la sucesión de funciones $$\{f_n\}$$. Si la sucesión es monótona y converge puntualmente a $$\ f$$ continua, entonces la convergencia es uniforme.

**Demostración**

El gran salto de la convergencia puntual a la convergencia uniforme se va a producir gracias a la continuidad de todas las funciones, la monotonía de la sucesión y la compacidad del dominio.

En la prueba se utilizará el concepto de entorno de un punto para simplificar la redacción al aplicar la continuidad. Un entorno de $$x$$ es un conjunto que contiene a un abierto del espacio que a su vez contiene a $$x$$. En nuestro caso, los abiertos son los intervalos abiertos intersecados con $$[a, b]$$.

Supongamos en primer lugar que $$\{f_n\}$$ es creciente. Nótese que en tal caso $$\ f(x) \ge f_n(x)$$ para todo $$x$$ y $$n$$. Sea $$\varepsilon > 0$$:

1. De la convergencia puntual se tiene que para todo $$x \in [a,b]$$ existe un natural $$n_x$$ tal que

    $$\forall n \ge n_x : \left| f_n(x) - f(x) \right| < \frac{\varepsilon}{3}$$

2. De la continuidad de $$\ f$$ y $$\ f_n$$ se tiene que para todo $$x \in [a,b]$$ existe un entorno $$V_x$$ de $$x$$ tal que para todo elemento $$y$$ del entorno se verifica:

    $$\left| f_n(y) - f_n(x) \right| < \frac{\varepsilon}{3}$$

    $$\left| f(y) - f(x) \right| < \frac{\varepsilon}{3}$$

3. Utilizando la desigualdad triangular se obtiene que para todo $$y \in V_x$$ se cumple:

    $$\left| f(y) - f_{n_x}(y) \right| \le \left| f(y) - f(x) \right| + \left| f(x) - f_{n_x}(x) \right| + \left| f_{n_x}(x) - f_{n_x}(y) \right| < \frac{\varepsilon}{3} + \frac{\varepsilon}{3} + \frac{\varepsilon}{3} < \varepsilon$$

4. Como $$[a,b] = \cup_{x \in [a,b]} V_x$$, usando la caracterización topológica de la compacidad, existen $$x_1, \ldots, x_m \in [a,b]$$ tales que:

    $$ [a,b] = \bigcup_{i = 1}^m V_{x_i} $$

5. Tomamos $$n_0 = \max\{n_{x_i}: i = 1, \ldots, m\}$$. Veamos que efectivamente se da la convergencia uniforme. Sean $$n \ge n_0, y \in [a,b]$$. Aplicando la igualdad obtenida en **(4)**, debe existir $$i \in \{1, \ldots, m\}$$ tal que $$y$$ pertenece a $$V_{x_i}$$. Juntando este hecho con **(3)** y la monotonía:

    $$\left| f(y) - f_n(y) \right| = f(y) - f_n(y) \le f(y) - f_{n_0}(y) \le f(y) - f_{n_{x_i}}(y) < \varepsilon$$

Por otro lado, si $$\{f_n\}$$ es decreciente, basta aplicar lo anterior a  $$\{-f_n\}$$, que es creciente y converge a $$\ -f$$. Fácilmente se extrapola su convergencia uniforrme a la de $$\{f_n\}$$.

$$\tag*{$\blacksquare$}$$

Nótese que análogamente se podría haber probado este resultado:

Teorema de Dini (en espacios topológicos)
: Sean $$(X, \mathcal{T})$$ un espacio topológico compacto y sea $$\ f_n : X \rightarrow \mathbb{R}$$ continua para todo $$n \in \mathbb{N}$$. Se considera la sucesión de funciones $$\{f_n\}$$. Si la sucesión es monótona y converge puntualmente a $$f$$ continua, entonces la convergencia es uniforme.

La exigencia de continuidad a la función límite no supone una condición extra para poder aplicar el teorema. Recordemos que en caso de que haya convergencia uniforme se tiene automáticamente la continuidad de la función límite ya que las funciones $$\ f_n$$ son continuas.

Volvemos al Ejemplo 2 cuya resolución será una mera consecuencia del teorema de Dini.

Ejemplo 2
: Estudia la convergencia puntual y uniforme de la sucesión de funciones $$\{f_n\}$$ donde $$f_n : [0,1] \rightarrow \mathbb{R}$$ está definida por:
: $$f_n(x) = \left(1+\frac{x^2}{n}\right)^n \ \forall x \in \mathbb{R}$$

**Solución.** Se había obtenido que la sucesión convergía puntualmente a $$\exp\left(x^2\right)$$. Además, no había convergencia uniforme en ninguna semirrecta. Veamos que sí hay convergencia uniforme en los intervalos cerrados y acotados.

Sean $$a, b \in \mathbb{R}$$ con $$a < b$$. En $$[a, b]$$ la sucesión verifica las condiciones del teorema de Dini:

+ Las funciones $$\ f_n$$ y $$\ f$$ son continuas.
+ Las sucesiones $$\ f_n$$ son crecientes. En efecto, aplicando la desigualdad de las medias [^medias] para $$x_1 = 1, x_i = 1+\frac{x^2}{n} \ \forall i = 2, \ldots, n+1$$:

$$\sqrt[n+1]{\left(1+\frac{x^2}{n}\right)^n} < \frac{1 + n \left(1+\frac{x^2}{n}\right)}{n+1} = 1 + \frac{x^2}{n+1}$$

Por tanto, hay convergencia uniforme en $$[a, b]$$.

$$\tag*{$\blacksquare$}$$


## Referencias

[^ejercicios]: [Ejercicios de sucesiones y series de funciones. Javier Pérez](http://www.ugr.es/~fjperez/textos/sucesiones_series_funciones.pdf)
[^medias]: [La desigualdad de las medias. Mario Román](http://dgiim.github.io/blog/2014/04/12/desigualdad-medias/)
