---
layout: post
title: Segment Trees y Range Minimum Query
authors:
  - andreshp
category: Estructuras de Datos
---

Paradójicamente, en los cursos de estructuras de datos y algoritmos el número de estructuras de datos que se estudian es bastante reducido. Generalmente se introducen heaps, árboles binarios de búsqueda balanceados (AVL), tablas Hash y algunos algoritmos sobre grafos. Sin embargo, el mundo de las estructuras de datos es mucho más [amplio](https://en.wikipedia.org/wiki/List_of_data_structures) y probablemente requeriría  una asignatura de estructuras de datos avanzadas como sucede en muchas universidades. El MIT, por ejemplo, proporciona [vídeos](http://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-851-advanced-data-structures-spring-2012/lecture-videos/) con el contenido de esta asignatura. Por ello, intentaré escribir entradas en el blog que profundicen en esta temática.

En este caso trataremos los **segment trees** o árboles de segmentos. Introduciremos en primer lugar un problema importante de la teoría de algoritmos, **range minimum query problem**, que servirá como motivación para los segment trees. Posteriormente se explicará el funcionamiento de estos, proporcionando para cada operación su correspondiente código en Python. Por último, se proporcionan algunos problemas resolubles mediante segment trees.

<!--more-->

## Range Minimum Query Problem

Consideremos un vector con objetos de un tipo $$T$$ sobre el que se ha definido una relación de orden total. Por claridad, ejemplificaremos el problema sobre números enteros. Sea $$n$$ la longitud del vector, se define $$RMQ(i,j)$$ como el mínimo del subvector formado por las componentes entre $$i$$ y $$j$$ (inclusive) para $$i, j$$ en $$\{1,\ldots,n\}$$ con $$i \le $$.  El problema consiste en proporcionar el valor de $$RMQ(i,j)$$ para cualquier número posible de consultas.

Normalmente se denomina subintervalo del vector a un subvector formado por componentes consecutivas, como los que se estudian en este caso. Una posible traducción al castellano de range minimum query sería problema de las consultas del mínimo de cualquier subintervalo (mantendremos el nombre en inglés por ser el estándar).

La solución trivial para el problema consiste en calcular para cada consulta el mínimo del subintervalo correspondiente de forma lineal. Esto proporciona una eficiencia media de $$\theta(n)$$ para las consultas. Se pretende reducir esta eficiencia significativamente para poder atender el mayor número de consultas posible. 

La forma habitual de abordar el problema consiste en hacer un preprocesamiento de los datos. Un primer preprocesamiento puede ser calcular directamente el mínimo para cada subintervalo del vector, lo que puede conseguirse sin mucha dificultad en $$\theta(n^2)$$. Posteriormente, las consultas pueden ser realizadas en tiempo constante. Esta solución tiene dos grandes problemas:

1. Un preprocesamiento de eficiencia $$\theta(n^2)$$ es excesivo cuando se trate con vectores de tamaño mayor o igual que $$10^4$$. Esto nos hace distinguir dos eficiencias a la hora de resolver el problema, la eficiencia del preprocesamiento y la eficiencia de la consulta. La solución trivial minimizaba el preprocesamiento mientras que la nueva solución minimiza el tiempo de consulta, no siendo ninguna de las dos óptimas. 
2. El problema suele complicarse permitiendo actualizar el valor de una componente del vector entre consultas, lo que no consigue el segundo algoritmo, que requiere un tiempo $$\theta(n)$$ para actualizar también la matriz $$RMQ$$.

Los segment trees o árboles de segmentos surgieron para resolver este problema. Se pueden formular de forma incluso más general, teniendo más aplicaciones en problemas relacionados con subintervalos de un vector. Como veremos a continuacióm, los segment trees tienen un preprocesamiento de eficiencia lineal y proporcionan un tiempo logarímico para las consultas y actualizaciones del vector.

## Segment Trees

Un segment tree es una estructura de datos que permite, a partir de un vector $$V$$, dos operaciones:

1. Realizar consultas del valor de una determinada propiedad para cualquiera de los subinvertalos del vector.
2. Actualizar una componente del vector.

Como caso particular esta propiedad puede ser el mínimo del subintervalo, en cuyo caso ambas operaciones pueden llevarse a cabo en tiempo logarítmico.

Suponemos que el vector tiene longitud $$n = 2^m$$. En caso contrario, lo extendemos con elementos nulos a la potencia de dos más cercana.

La idea subyacente consiste en almacenar la información necesaria para los subintervalos del tipo $$V[k2^l+1, (k+1)2^l]$$ donde $$l$$ pertenece a $$\{0, 1, \ldots, \log_2 n\}$$ y $$k$$ pertenece a $$\{0, 1, \ldots, \frac{n}{2^l}-1\}$$. Esto es, dividiremos el vector en subintervalos consecutivos cuya longitud sea una potencia de $$2$$ y preprocesaremos estos. La información de estos intervalos se almacenará en un árbol binario. Posteriormente para un subintervalo $$V[i, j]$$ podemos expresarlo como la unión de subintervalos consecutivos como los ya preprocesados. Por ejemplo:

$$ V = [3,2,8,5,6,1,7,4] , V[2,7] = V[2,2] \cup V[3,4] \cup V[5,6] \cup V[7,7] $$

Si la información que deseamos consultar puede obtenerse a partir de la información de una partición de subintervalos entonces habremos resuelto el problema. Este es el caso del range minimum query. El mínimo del subintervalo $$V[i, j]$$ es el mínimo de los mínimos obtenidos para los subintervalos preprocesados que formen una partición de $$V[i, j]$$. En el ejemplo anterior:

$$ V = [3,2,8,5,6,1,7,4] , \min(V[2,7]) = \min\{\min(V[2,2]), \min(V[3,4]), \min(V[5,6]), \min(V[7,7])\} = \min\{2, 5, 1, 7\} = 1 $$

### Nodos del segment tree

La información relativa a los subintervalos del tipo $$V[k2^l+1, (k+1)2^l]$$ debe almacenarse en un nodo. Los subintervalos $$V[i,i]$$ son los casos base y sus nodos formarán las hojas del segment tree. Los nodos deben mantener 3 operaciones: 

1. Asignar la información correspondiente al nodo en el caso de que este sea una hoja del árbol.
2. Generar la información del nodo a partir de dos nodos cuyos subintervalos sean una partición del subintervalo actual. Esta operación se denomina `merge`.
3. Devolver la información del subintervalo que el nodo representa.

Una plantilla para un nodo del segment tree sería la siguiente:

~~~
# Node of the Segment Tree.
# It contains the information related with a subinterval 
class SegmentTreeNode(object):
    
    # Init the node. 
    # info = Subinterval information
    def __init__(self):
        self.info = None

    # Given the value of an array element,
    # build the information for this leaf.
    def assignLeaf(self, value):
        # Insert the code to build the leaf information
            
    # Merge the information of left and right
    # children to form the parent node information.
    def merge(self, left, right):
        # Insert the merge code

    # Return information contained in this node.
    def getInfo(self):
        return self.info
~~~

En el caso del range minimum query asignar la información a una hoja es asignarle el valor de la componente y realizar un `merge` es tomar el mínimo de los nodos `left` y `right`.

~~~
    def assignLeaf(self, value):
        self.info = value
    def merge(self, left, right):
        self.info = min(left.getInfo(), right.getInfo())
~~~

Veremos que para que la eficiencia de las dos operaciones soportadas por el segment tree sea logarítmica las operaciones anteriores deben ser realizadas en tiempo constante.

### Construcción del segment tree

Los subintervalos preprocesados se almacenan en nodos. Estos pueden ver como un árbol binario. Cada nodo que no sea una hoja tiene un hijo izquierda y un hijo derecha que se corresponden con dividir el subintervalo del nodo en dos. La Imagen 1 muestra el árbol resultante para el ejemplo $$V = [3,2,8,5,6,1,7,4]$$.

![](https://raw.githubusercontent.com/dgiim/blog/post-segment-trees/images/segment_trees/segment_trees_visualizacion.png)

Nótese que el árbol binario es completo. Por tanto, podemos almacenarlo en memoria de forma análoga a un heap [^heap]. Esto es, embebemos el árbol en un vector mediante un recorrido por niveles como sucede en la Imagen 2.

![](https://raw.githubusercontent.com/dgiim/blog/post-segment-trees/images/segment_trees/segment_trees_heap.png)





## Problemas 

Los siguientes problemas sirven como ejemplo de aplicación de los segment tree:

- [Hackerrank - Minimum Product Subinterval](https://www.hackerrank.com/contests/indeed-prime-challenge/challenges/minimum-product-sub-interval)
- [Hackerrank - Almost Equal](https://www.hackerrank.com/challenges/almost-equal-advanced)

## Referencias

[^heap]: [Heaps and Heapsort, MIT 6.006 Introduction to Algorithms, Fall 2011](https://www.youtube.com/watch?v=B7hVxCmfPtM)