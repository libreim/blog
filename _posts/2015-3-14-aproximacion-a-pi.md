---
layout: post
title: Aproximación a Pi
authors:
  - oxcar103
category: Problemas
---

Como hoy es el día de $$\pi$$ (3/14), vamos a presentar una serie de aproximaciones a este numerito :wink:


## Serie de Leibniz
Uno de los métodos de aproximación a $$\pi$$ viene dada por la serie de Leibniz:

$$\frac{\pi}{4} = \displaystyle{\sum_{n=0}^\infty \frac{(-1)^n}{2n+1}} =
\displaystyle{\left(1 - \frac{1}{3} + \frac{1}{5} - \frac{1}{7} + \dots \right)}$$

Se basa en el desarrollo en serie de potencias de la arcotangente:

$$\arctan x = \displaystyle{\sum_{n=0}^{\infty} \frac{x^{2n+1}}{2n+1}}=
\displaystyle{\left(x - \frac{x^3}{3} + \frac{x^5}{5} - \frac{x^7}{7} + \dots \right)}$$

Y evaluarla en 1.
Esta fórmula tiene un pequeño inconveniente: es algo lenta para el cálculo de $$\pi$$.
Para más información general del método, visita [Wikipedia](https://en.wikipedia.org/wiki/Leibniz_formula_for_%CF%80) y para su demostración en [Proofwiki](https://proofwiki.org/wiki/Leibniz%27s_Formula_for_Pi)


## Fórmula de Madhava
Otra forma de aproximarlo  sería la dada por Madhava:

$$\pi = \displaystyle{\sqrt{12} \sum_{n=0}^{\infty} \frac{\left(-\frac{1}{3}\right)^n}{2n+1}} =
\displaystyle{\sqrt{12} \left(\frac{1}{1 \cdot 3^0} - \frac{1}{3 \cdot 3^1} + \frac{1}{5 \cdot 3^2} - \frac{1}{7 \cdot 3^3} + \cdots \right)}$$

También está basada en el desarrollo de la arcotangente y en evaluarla en un punto, concretamente, en $$\frac{1}{\sqrt{3}}$$:

$$\frac{\pi}{6} = \arctan \frac{1}{\sqrt{3}} = \displaystyle{\left(\frac{1}{\sqrt{3}} - \frac{\left(\frac{1}{\sqrt{3}}\right)^3}{3} +
\frac{\left(\frac{1}{\sqrt{3}}\right)^5}{5} - \frac{\left(\frac{1}{\sqrt{3}}\right)^7}{7} + \dots \right)} =
\displaystyle{\left(\frac{1}{\sqrt{3}} - \frac{\frac{1}{\sqrt{3}}}{3 \cdot 3} + \frac{\frac{1}{\sqrt{3}}}{5 \cdot 3^2} -
\frac{\frac{1}{\sqrt{3}}}{7 \cdot 3^3} + \dots \right)}$$

Y despejar $$\pi$$, la incluyo porque es anterior a la serie de Leibniz, aunque es algo menos conocida.
Para más información, visita [Wikipedia](https://en.wikipedia.org/wiki/Madhava_series).


## Producto de Wallis
El producto de Wallis:

$$\frac{\pi}{2} = \displaystyle{\prod_{n = 1}^{\infty} \left(\frac{2n}{2n-1} \cdot \frac{2n}{2n+1} \right)} =
\frac{2}{1} \cdot \frac{2}{3} \cdot \frac{4}{3} \cdot \frac{4}{5} \cdot \frac{6}{5} \cdot \frac{6}{7} \cdot \frac{8}{7} \cdot \frac{8}{9} \cdots$$

Éste producto se basa en que las raíces de $$\frac{\sin x}{x}$$ son $$\pm n\pi$$ con $$n \in \mathbb{N}$$ y, por tanto,
$$\frac{\sin x}{x} =
k \prod_{n=0}^{\infty}(x-n\pi)(x+n\pi) = k \prod_{n=0}^{\infty}\left(1-\frac{x}{n\pi}\right)\left(1+\frac{x}{n\pi}\right) =
k \prod_{n=0}^{\infty}\left(1-\frac{x^2}{n^2 \pi^2}\right)$$

con $$k \in \mathbb{R}$$ constante. Tomando límite a 0, se obtiene que $$k = 1$$.
Y para obtener el producto de Wallis, basta con evaluar

$$\left(\frac{1}{\frac{\sin x}{x}}\right)\left(\frac{\pi}{2}\right) =
\frac{1}{\displaystyle{\prod_{n=0}^{\infty}\left(1-\frac{x^2}{n^2 \pi^2}\right)}}\left(\frac{\pi}{2}\right) =
\frac{1}{\displaystyle{\prod_{n=0}^{\infty}\left(1-\frac{1}{4n^2}\right)}} = \displaystyle{\prod_{n = 1}^{\infty} \left(\frac{4n^2}{4n^2-1}\right)} =
\displaystyle{\prod_{n = 1}^{\infty} \left(\frac{2n}{2n-1} \cdot \frac{2n}{2n+1} \right)}$$

Para más información general del método, visita [Wikipedia](https://en.wikipedia.org/wiki/Wallis_product) y para su
demostración en [Proofwiki](https://proofwiki.org/wiki/Wallis%27s_Product).


## Algoritmo de Borwein
Aunque no he logrado entender cómo funciona, incluyo el algoritmo de Borwein [^study-in-analytic-number-theory]
por tener una convergencia nónica (es decir, en cada iteración, se multiplican por 9 el número de dígitos correctos),
establece como valores iniciales:

$$a_0 = \frac{1}{3} \mbox{, }r_0 = \frac{\sqrt{3} - 1}{2}\mbox{ y }s_0 = \sqrt[3]{1 - r_0^3}$$

[^study-in-analytic-number-theory]: *Jonathon M. Borwein, Peter B. Borwein, Pi and the AGM* - A Study in Analytic Number Theory and Computational Complexity, *Wiley, New York, 1987 Jorg Arndt, Christoph Haenel, Pi Unleashed, Springer, Berlin, 2001, ISBN 3-540-66572-2*.

Y a partir de ahí, para cada iteración se calcula:

$$t_{n+1} = 1 + 2r_n$$,

$$u_{n+1} = \sqrt[3]{9r_n(1+r_n+r_n^2)}$$,

$$v_{n+1} = t^2_{n+1} + t_{n+1} u_{n+1} + u^2_{n+1} $$,

$$w_{n+1} = 27 \frac{1 + s_n + s_n^2}{v_{n+1}}$$,

$$a_{n+1} = w_{n+1} a_n + 3^{2n-1}(1-w_{n+1})$$,

$$s_{n+1} = \frac{(1-r_n)^3}{(t_{n+1} + 2 u_{n+1}) v_{n+1}}$$,

$$r_{n+1} = \sqrt[3]{1-s_{n+1}^3}$$.

Y en este algoritmo, se obtiene que la sucesción $$\{a_n\} \rightarrow \frac{1}{\pi}$$.


Más información puede encontrarse [aquí](https://en.wikipedia.org/wiki/Borwein's_algorithm).
