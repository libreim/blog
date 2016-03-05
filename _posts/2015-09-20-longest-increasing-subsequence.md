---
layout: post
title: Problema de la sublista creciente más larga
authors:
  - andreshp
category: Algoritmos
---

El problema de la sublista creciente más larga, conocido en inglés por longest increasing subsequence problem y denotado LIS, es un problema clásico de la teoría de algoritmos. Este problema consiste en encontrar, dada una lista o secuencia finita de elementos, una sublista en la que los elementos estén ordenados de menor a mayor y sea lo más larga posible. En este post proporcionaremos algoritmos que lo resuelven en tiempo $$\theta(n \log n)$$ e introduciremos algunos resultados matemáticos asociados. Por último, mostraremos algunas aplicaciones y propondremos algunos problemas que lo requieran.

<!--more-->

## Definición del problema. Un primer algoritmo

Consideremos un conjunto totalmente ordenado, que denotaremos $$X$$, y una lista de elementos de este, $$(x_0, x_1, \ldots, x_n)$$. Una sublista ordenada es una lista dada por $$(x_{i_0}, x_{i_1}, \ldots, x_{i_m})$$ donde $$i_0, i_1, \ldots, i_m \in \{0, \ldots, n\}$$ con $$i_0 < i_1 < \ldots < i_m$$ y $$x_{i_0} \le x_{i_1} \le \ldots \le x_{i_m}$$. El problema de la sublista más larga consiste en encontrar una sublista ordenada de longitud máxima. Por ejemplo, podemos tomar $$\mathbb{Z}$$ y la lista $$(4,1,3,7,2,8)$$; una sublista ordenada es $$(4,7,8)$$ mientras que la sublista más larga es $$(1,3,7,8)$$. Aunque en este caso la solución es única, generalmente puede no serlo. La lista $$(4,1,5,3,7,2,8)$$ admite tres sublistas ordenadas de longitud máxima:

$$ (1,3,7,8), \ (1,5,7,8), \ (4,5,7,8) $$

Una lista de longitud $$n$$ tiene $$2^n$$ sublistas posibles. Sin embargo, podemos utilizar programación dinámica para formular un algoritmo con eficiencia cuadrática que resuelva el problema. La idea consiste en calcular para cada sublista $$(x_0, \ldots, x_i)$$ una sublista ordenada que utilice la componente $$x_i$$ y que tenga la mayor longitud posible. Vamos a crear un vector, que denotaremos $$LIS$$, cuya componente i-ésima contenga la longitud de la sublista escogida para $$(x_0, \ldots, x_i)$$. Para resolver el problema basta calcular este vector y utilizar la siguiente observación.

Observación 1
: La mayor longitud de una sublista ordenada de $$(x_0, x_1, \ldots, x_n)$$ es el máximo del vector $$LIS$$.

Estudiemos cómo calcular el vector $$LIS$$. Es claro que $$LIS[0] = 1$$. Supongamos que se han calculado las $$k$$ primeras componentes con $$k < n$$ y veamos como calcular $$k+1$$. Buscamos una sublista ordenada de longitud máxima que termine en $$x_{k+1}$$. Hay dos opciones:

- $$LIS[k+1] = 1$$, esto es, la única sublista ordenada posible es $$(x_{k+1})$$. Esto sucede si, y solo si, $$x_{k+1} < x_{i} \ \forall \ i \in \{0, \ldots, k\}$$.
- $$LIS[k+1] > 1$$, en cuyo caso podemos tomar una lista ordenada $$(x_{i_0}, \ldots, x_{i_m}, x_{k+1})$$ de longitud $$LIS[k+1]$$. En este contexto se debe cumplir la igualdad $$LIS[i_m] = m$$. En efecto, si $$LIS[i_m] > m$$, entonces se podría tomar una sublista asociada a $$LIS[i_m]$$ y añadirle al final $$x_{k+1}$$ ya que $$x_{i_m} \le x_{k+1}$$. Hemos obtenido una sublista ordenada que termina en $$x_{k+1}$$ con longitud mayor que $$(x_{i_0}, \ldots, x_{i_m}, x_{k+1})$$, contradicción. Por tanto, $$LIS[k+1] = 1 + LIS[i_m]$$.

Como consecuencia se obtiene la siguiente relación recurrente:

Proposición 1
: Sea $$J_{k+1} = \{i \in \{0, \ldots, k\} : x_i \le x_{k+1}\}$$. Si $$J_{k+1}$$ es vacío, entonces $$LIS[k+1] = 1$$. En caso contrario:
: $$ LIS[k+1] = 1 + \max_{i \ \in \ J_{k+1}}LIS[i] $$

A partir de esta proposición se puede calcular $$LSI$$ y, por tanto, la mayor longitud de una sublista ordenada. El Código 1 muestra este algoritmo en Python. Este aplica la Proposición 1 para cada componente del vector $$LIS$$. Como se había anticipado, la eficiencia es cuadrática pues hay que ejecutar $$\frac{n (n-1)} {2}$$ veces la línea 5.

{: .code}
~~~Python
def longestIncreasingSubsequenceLength(L):
    LIS = [1] * len(L)
    for i in range(1, len(L)):
        for j in range(0, i):
            if L[j] <= L[i]:
                LIS[i] = max(LIS[i], LIS[j]+1)
    return max(LIS)
~~~
**Código 1.** Algoritmo cuadrático para calcular la longitud de la sublista ordenada más larga.

Aunque el algoritmo dado en el Código 1 solamente calcula la longitud, lo podemos modificar sin mucha dificultad para que además permita devolver una sublista ordenada asociada. Para ello hay que almacenar durante todo el proceso las sublistas que se corresponden con las componentes del vector $$LIS$$. Si se almacenan tal cual se obtendría una eficiencia en memoria de $$\theta(n^2)$$ en el peor caso. Podemos arreglar este hecho con la siguiente idea. Definimos un vector $$P$$ cuya componente i-ésima indica cual es el penúltimo elemento de la sublista ordenada de mayor longitud que termina en la componente $$i$$. Este vector se calcula junto con $$LIS$$. Para reconstruir la sublista asociada a $$LIS[i]$$ basta calcular la sublista asociada a  $$LIS[P[i]]$$. Utilizando esta recurrencia obtenemos la mencionada sublista:

$$ [i, P[i], P[P[i]], ...] $$

El Código 2 muestra como implementar esta mejora del algoritmo.

{: .code}
~~~Python
def longestIncreasingSubsequence(L):
    LIS = [1] * len(L)
    P = [-1] * len(L)

    for i in range(1, len(L)):
        for j in range(0, i):
            if L[j] < L[i] and LIS[i] < LIS[j]+1:
                LIS[i] = LIS[j]+1
                P[i] = j

    i = LIS.index(max(LIS))
    sol = []
    while i != -1:
        sol.append(i)
        i = P[i]
    return  sol[::-1]
~~~
**Código 2.** Algoritmo cuadrático para calcular la sublista ordenada de mayor longitud.

## Solución utilizando segment trees

Anteriormente en el blog hemos tratado la estructura de datos denominada [segment trees o árboles de segmentos](http://tux.ugr.es/dgiimblog/2015/07/17/segment-tree/). Esta nos permite realizar consultas sobre sobre determinada información de los intervalos de un vector en un tiempo reducido. Vamos a utilizar esta estructura de datos para acelerar el algoritmo previo y obtener una implementación con eficiencia $$\theta(n \log n)$$.

Consideremos la permutación $$\sigma : \{0, \ldots, n\} \rightarrow \{0, \ldots, n\}$$ que ordena la lista $$L = (x_0, x_1, \ldots, x_n)$$. Si permitimos que haya elementos repetidos debemos elegir una entre las posibles permutaciones que ordenan la lista. Para que el algoritmo sea correcto necesitaremos tomar aquella que verifique que si $$i < j$$ y $$x_i = x_j$$, entonces $$\sigma^{-1}(i) < \sigma^{-1}(j)$$. Esto es, si dos elementos de la lista son iguales, entonces el que aparece antes en la lista ordenada es aquel que aparecía antes en la lista original. La necesidad de esta propiedad la justificaremos posteriormente.

Vamos a inicializar el segment tree con el vector $$LIS$$ de manera que nos permita consultar el máximo de sus intervalos en tiempo logarítmico. Al finalizar el algoritmo la i-ésima hoja del árbol contendrá la longitud de la mayor sublista ordenada que termina en la componente $$i$$. Inicialmente todos estos valores serán 0.

Calcularemos las componentes del vector $$LIS$$ siguiendo el orden que proporciona la permutación $$\sigma$$. El primer elemento visitado es aquel con el menor valor de $$L$$ que aparece en primer lugar. Es claro que el valor del vector $$LIS$$ para esta componente es 1. Si hubiese valores repetidos en la lista y se escogiese otra permutación distinta a la nuestra, no tendríamos garantizada esta propiedad. En efecto, si $$\sigma(0) > \sigma(1)$$ y $$x_{\sigma(0)} = x_{\sigma(1)}$$, entonces $$LIS[\sigma(0)] \ge 2$$.

Supongamos que hemos calculado $$LIS[\sigma(i)]$$ para todo $$0 \le i \le k$$ con $$k < n$$ y veamos cómo obtener $$LIS[\sigma(k+1)]$$. Tenemos que $$J_{\sigma(k+1)} = \{i \in \{0, \ldots, k\} : x_i \le x_{k+1}\} = \{\sigma(i) : i \in \{0, \ldots, k\} \text{ y } \sigma(i) < \sigma(k+1)\} \ne \emptyset$$. Recordemos que las componentes no calculadas del vector $$LIS$$ tienen el valor 0. Teniendo en cuenta este detalle y que $$J_{k+1} \subset \{0, 1, \ldots, \sigma(k+1)-1\}$$ podemos aplicar la Proposición 1 y obtener la siguiente proposición:

Proposición 2
: En este contexto se verifica la siguiente igualdad:
: $$ LIS[\sigma(k+1)] = 1 + \max_{i \ \in \ J_{k+1}}LIS[i] = 1 + \max_{0 \le i \le \sigma(k)}LIS[i] $$

El segment tree nos permite calcular el último máximo en tiempo logarítmico, basta realizar la consulta para el intervalo $$[0, \ldots, \sigma(k)-1]$$. Por último, actualizamos el valor de $$LIS[\sigma(k+1)]$$ en el segment tree también en tiempo logarítmico.

Este razonamiento prueba que el algoritmo dado en el Código 3 es correcto. Hemos utilizado la sintaxis de nuestra [implementación de los segment trees](https://github.com/andreshp/Algorithms/tree/master/DataStructures/SegmentTree). La eficiencia del algoritmo es $$\theta(n \log n)$$ ya que en cada iteración se realiza una consulta y una actualización del segment tree.

{: .code}
~~~Python
def longestIncreasingSubsequenceLength(L):
    st = SegmentTree([0]*len(L), SegmentTreeNodeMax)
    # The list B contains the permutation which sorts L and verify that if
    # B[i] < B[j] and L[i] = L[j], then i < j.
    B = list(map(lambda x : -x[1], sorted([(L[i],-i) for i in range(0,len(L))])))
    for i in range(0,len(B)):
        st.update(B[i],st.getInfo(0,B[i])+1)
    return st.getInfo(0,len(L)-1)
~~~
**Código 3.** Algoritmo basado en segment trees para calcular la mayor longitud de las sublistas ordenadas.

Podemos modificar el Código 3 para obtener una implementación que devuelva la sublista ordenada de mayor longitud. Para ello utilizamos la misma idea que en el Código 2. La dificultad añadida reside en el uso de los segment trees. Tenemos que modificar la implementación de los nodos para que el árbol también devuelva el índice que alcanza el máximo de la consulta. El Código 4 contiene dicha modificación así como la nueva implementación del algoritmo.

{: .code}
~~~Python
def longestIncreasingSubsequenceIndexes(L):
    st = SegmentTree([0]*len(L),SegmentTreeNodeMax)
    B = list(map(lambda x : -x[1], sorted([(L[i],-i) for i in range(0,len(L))])))
    P = [-1]*len(L)
    for i in range(0,len(L)):
        # The method getInfo returns the maximum value in the interval and
        # the index which reachs that value.
        length, P[B[i]] = st.getInfo(0, B[i])
        st.update(B[i],length+1)

    LIS = []; i = st.getInfo(0,len(L)-1)[1]
    while  i != -1:
        LIS.append(i)
        i = P[i]
    return LIS[::-1]
~~~
**Código 4.** Algoritmo basado en segment trees para calcular la sublista ordenada de mayor longitud.

## Aplicaciones

http://stackoverflow.com/questions/12458641/applications-of-longest-increasing-subsquence

## Referencias

[^book]: [The Surprising Mathematics of Longest Increasing Subsequences - Dan Romik](http://www.maa.org/press/maa-reviews/the-surprising-mathematics-of-longest-increasing-subsequences)
