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

Consideremos un vector con objetos de un tipo $$T$$ sobre el que se ha definido una relación de orden total. Por claridad, ejemplificaremos el problema sobre números enteros. Sea $$n$$ la longitud del vector, se define $$RMQ(i,j)$$ como el mínimo del subvector formado por las componentes entre $$i$$ y $$j$$ (inclusive) para $$i, j$$ en $$\{1,\ldots,n\}$$ con $$i \le j$$.  El problema consiste en proporcionar el valor de $$RMQ(i,j)$$ para cualquier número posible de consultas.

Normalmente se denomina subintervalo del vector a un subvector formado por componentes consecutivas, como los que se estudian en este caso. Una posible traducción al castellano de range minimum query sería problema de las consultas del mínimo de cualquier subintervalo (mantendremos el nombre en inglés por ser el estándar).

La solución trivial para el problema consiste en calcular para cada consulta el mínimo del subintervalo correspondiente de forma lineal. Esto proporciona una eficiencia media de $$\theta(n)$$ para las consultas. Se pretende reducir esta eficiencia significativamente para poder atender el mayor número de consultas posible. 

La forma habitual de abordar el problema consiste en hacer un preprocesamiento de los datos. Un primer preprocesamiento puede ser calcular directamente el mínimo para cada subintervalo del vector, lo que puede conseguirse sin mucha dificultad en $$\theta(n^2)$$. Posteriormente, las consultas pueden ser realizadas en tiempo constante. Esta solución tiene dos grandes problemas:

1. Un preprocesamiento de eficiencia $$\theta(n^2)$$ es excesivo cuando se trate con vectores de tamaño mayor o igual que $$10^4$$. Esto nos hace distinguir dos eficiencias a la hora de resolver el problema, la eficiencia del preprocesamiento y la eficiencia de la consulta. La solución trivial minimizaba el preprocesamiento mientras que la nueva solución minimiza el tiempo de consulta, no siendo ninguna de las dos óptimas. 
2. El problema suele complicarse permitiendo actualizar el valor de una componente del vector entre consultas, lo que no consigue el segundo algoritmo, que requiere un tiempo $$\theta(n)$$ para actualizar también la matriz $$RMQ$$.

Los segment trees o árboles de segmentos surgieron para resolver este problema. Se pueden formular de forma incluso más general, teniendo aplicaciones en problemas relacionados con los subintervalos de un vector. Como veremos a continuacióm, los segment trees aplicados a este problema tienen un preprocesamiento con eficiencia lineal y proporcionan un tiempo logarímico para las consultas y actualizaciones del vector.

## Segment Trees

Un segment tree es una estructura de datos que permite, a partir de un vector $$V$$, dos operaciones:

1. Consultar determinada información para cualquiera de los subinvertalos del vector.
2. Actualizar una componente del vector.

Como caso particular esta información puede ser el mínimo del subintervalo, en cuyo caso ambas operaciones pueden llevarse a cabo en tiempo logarítmico.

Supongamos por el momento que el vector tiene longitud $$n = 2^m$$.

La idea subyacente consiste en almacenar la información necesaria para los subintervalos del tipo $$V[k2^l+1, (k+1)2^l]$$ donde $$l$$ pertenece a $$\{0, 1, \ldots, \log_2 n\}$$ y $$k$$ pertenece a $$\{0, 1, \ldots, \frac{n}{2^l}-1\}$$. Esto es, dividiremos el vector en subintervalos consecutivos cuya longitud sea una potencia de $$2$$ y preprocesaremos estos. La información de estos intervalos se almacenará en un árbol binario. Posteriormente para un subintervalo $$V[i, j]$$ podemos expresarlo como la unión de subintervalos consecutivos como los ya preprocesados. Por ejemplo, para $$V = [3,2,8,5,6,1,7,4]$$ se tiene:

$$ V[2,7] = V[2,2] \cup V[3,4] \cup V[5,6] \cup V[7,7] $$

Si la información que deseamos consultar puede obtenerse a partir de la información de una partición de subintervalos entonces habremos resuelto el problema. Este es el caso del range minimum query. El mínimo del subintervalo $$V[i, j]$$ es el mínimo de los mínimos obtenidos para los subintervalos preprocesados que formen una partición de $$V[i, j]$$. En el ejemplo anterior:

$$ \min(V[2,7]) = \min\{\min(V[2,2]), \min(V[3,4]), \min(V[5,6]), \min(V[7,7])\} = \min\{2, 5, 1, 7\} = 1 $$

### Nodos del segment tree

La información relativa a los subintervalos del tipo $$V[k2^l+1, (k+1)2^l]$$ debe almacenarse en un nodo. Los subintervalos $$V[i,i]$$ son los casos base y sus nodos formarán las hojas del segment tree. Los nodos deben mantener 3 operaciones: 

1. Asignar la información correspondiente al nodo en el caso de que este sea una hoja del árbol.
2. Generar la información del nodo a partir de dos nodos cuyos subintervalos sean una partición del subintervalo actual. Esta operación se denomina `merge`.
3. Devolver la información del subintervalo que el nodo representa.

Una plantilla para un nodo del segment tree sería la siguiente:

~~~python
# Template for a Segment Tree Node.
# A node contains the information related with a vector subinterval.
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

    # Return the information contained in this node.
    def getInfo(self):
        return self.info
~~~

En el caso del range minimum query asignar la información a una hoja es asignarle el valor de la componente y realizar un `merge` es tomar el mínimo de la información de los nodos `left` y `right`.

~~~python
    def assignLeaf(self, value):
        self.info = value
    def merge(self, left, right):
        self.info = min(left.getInfo(), right.getInfo())
~~~

Veremos que para que la eficiencia de las dos operaciones soportadas por el segment tree sea logarítmica las operaciones anteriores deben ser realizadas en tiempo constante, como sucede para este problema.

### Construcción del segment tree

Los subintervalos preprocesados se almacenan en nodos. Estos pueden ver como un árbol binario. Cada nodo que no sea una hoja tiene un hijo izquierda y un hijo derecha que se corresponden con dividir el subintervalo del nodo en dos mitades. La Imagen 1 muestra el árbol resultante para el ejemplo $$V = [3,2,8,5,6,1,7,4]$$.

![](https://raw.githubusercontent.com/dgiim/blog/post-segment-trees/images/segment_trees/segment_trees_visualizacion.png)

$$ \textbf{Imagen 1.} \text{ Segment tree asociado al vector } V = [3,2,8,5,6,1,7,4] \text{ representado como un árbol binario.} $$

Nótese que el árbol binario es completo. Por tanto, podemos almacenarlo en memoria mediante un heap [^heap]. Esto es, embebemos el árbol en un vector mediante un recorrido por niveles como sucede en la Imagen 2. Cada nodo le corresponde un índice del vector y para estos índices se verifica: 

1. $$IndiceHijoIzquierda(nodo) = 2nodo$$
2. $$IndiceHijoDerecha(nodo) = 2nodo+1$$

Estas relaciones nos permiten acceder a los hijos de forma constante. Además, la longitud del vector que representa al segment tree es $$2n-1$$ donde $$n$$ es la longitud de $$V$$.

![](https://raw.githubusercontent.com/dgiim/blog/post-segment-trees/images/segment_trees/segment_trees_heap.png)

$$ \textbf{Imagen 2.} \text{ Segment tree asociado al vector } V = [3,2,8,5,6,1,7,4] \text{ representado como un heap.} $$

Nótese que el subintervalo correspondiente a cada nodo se deduce de su índice, por lo que no es necesario almacenar esta información. Se puede construir el árbol recursivamente. Si el nodo actual es una hoja se obtiene su información mediante el método `assignLeaf`. Si no se da este caso, se construyen recursivamente los dos hijos y se obtiene la información para el nodo actual aplicando el método `merge` a ambos hijos. 

Con el proceso de construcción anterior contruiremos sin problemas el árbol aunque el vector no tenga como tamaño una potencia de dos. En tal caso el árbol resultante puede no ser completo. Por tanto, habrá componentes del heap en memoria sin usar. Esto nos es irrelevante puesto que el tamaño del heap será a lo sumo $$2m-1$$ donde $$m$$ es la menor potencia de 2 mayor que $$n$$ (si extendemos el vector con elementos nulos hasta que tenga longitud $$m$$ y construimos este heap necesitaremos un vector de longitud $$2m-1$$). Por tanto, la memoria utilizada será $$\theta(n)$$ en cualquier caso.

El siguiente código proporciona un constructor para la clase SegmentTree.

~~~python
class SegmentTree(object):

    # Build a segment tree from the given array.
    # array: Array from which the segment tree is built.
    # st_index: current segment tree node index.
    # lo and hi : Range of input array subinterval that this node is responsible of.
    def _buildTree(self, array, st_index, lo, hi):
        if lo == hi: 
            # The node is a leaf responsible of V[lo,lo]
            self.nodes[st_index].assignLeaf(array[lo])
        else: 
            # The node is not a leaf.
            # Both children are built and merged afterwards for this node.
            left = 2 * st_index
            right = left + 1
            mid = (lo + hi) // 2
            self._buildTree(array, left, lo, mid)
            self._buildTree(array, right, mid + 1, hi)
            self.nodes[st_index].merge(self.nodes[left], self.nodes[right])

    # Get the segment tree size for a input of size N.
    # It compute the smallest 2 to the power of m greater than N.
    def _getSegmentTreeSize(N):
        size = 1
        while size < N:
            size <<= 1
        return size << 1

    # Initializes a Segment Tree.
    # array : Array from which the segment tree is built.
    # Node : Class that will be used as a segment tree node. 
    #   It obtains the desired information from the array.
    def __init__(self, array, SegmentTreeNode):
        self.SegmentTreeNode =  Node
        # Segment tree size (number of nodes)
        self.size = SegmentTree._getSegmentTreeSize(len(array))
        # Heap with the nodes
        self.nodes = [self.SegmentTreeNode() for i in range(0,self.size+1)]
        self.array = array
        # The tree is built
        self._buildTree(array, 1, 0, len(array)-1)
~~~


Como se construyen menos de $$4n-1$ nodos, el proceso anterior es $$\theta(n \max(a(n), m(n)))$$ donde $$a(n)$$ es la eficiencia del método `assignLeaf` y $$m(n)$$ es la eficiencia del método `merge`.

En el caso del range minimum query la eficiencia obtenida es lineal.

### Operación 1: Consultas

Para realizar una consulta debemos encontrar la descomposición de $$V[i,j]$$ en el menor número posible de nodos del árbol. Esto se puede consequir de forma recursiva. Partimos del nodo raíz. Se distinguen los siguientes casos:

1. Si $$V[i,j]$$ es el subintervalo que corresponde al nodo actual se devuelve la información correspondiente.
2. Si $$V[i,j]$$ es un subintervalo del subintervalo del hijo izquierda se devuelve el resultado de la búsqueda obtenida para el hijo izquierda.
3. Si $$V[i,j]$$ es un subintervalo del subintervalo del hijo derecha se devuelve el resultado de la búsqueda obtenida para el hijo derecha.
4. Si $$V[i,j]$$ tiene elementos en ambos hijos se obtiene el valor de la consulta haciendo un `merge` de la información obtenida para el sector relativo al hijo izquierda y el sector relativo al hijo derecha.

El siguiente código realiza la operación descrita:

~~~python
    # Get recursively a SegmentTreeNode with the information associated with the range [lo, hi].
    # stIndex : Current Segment Tree Node. It is responsible of [left, right] range.
    def _getValue(self, stIndex, left, right, lo, hi):
        # Check if the range is the current node in the tree.
        # In that case return it.
        if left == lo and right == hi:
            return self.nodes[stIndex]

        # Look for the range in the children of the current node
        # if it could be just there.
        mid = (left + right) // 2
        if lo > mid:
            return self._getValue(2*stIndex+1, mid+1, right, lo, hi)
        if hi <= mid:
            return self._getValue(2*stIndex, left, mid, lo, hi)

        # If we keep executing the method then the range is divided between 
        # the left child and the right child of the current node. Let's get 
        # each part of the range and merge it.           
        leftResult = self._getValue(2*stIndex, left, mid, lo, mid);
        rightResult = self._getValue(2*stIndex+1, mid+1, right, mid+1, hi);
        result = self.SegmentTreeNode()
        result.merge(leftResult, rightResult)
        return result

    # Get the value associated with the range [lo, hi]
    def getValue(self, lo, hi):
        result = self._getValue(1, 0, len(self.array)-1, lo, hi)
        return result.getValue() 
~~~

Es claro que si el subintervalo es precisamente uno de los que se tienen almacenados en el árbol entonces el tiempo de la consulta es $$O(\log n)$$. ¿Qué sucede en cualquier otro caso?

Proposición
: El tiempo de consulta para cualquier subintervalo es $$O(m(n)\log n)$$.

**Demostración**

The claim is that there are at most 2 nodes which are expanded at each level. We will prove this by contradiction.

Consider the segment tree given below.

Segment Tree

Let's say that there are 3 nodes that are expanded in this tree. This means that the range is from the left most colored node to the right most colored node. But notice that if the range extends to the right most node, then the full range of the middle node is covered. Thus, this node will immediately return the value and won't be expanded. Thus, we prove that at each level, we expand at most 2 nodes and since there are logn levels, the nodes that are expanded are 2⋅logn=Θ(logn)

$$\tag*{$\blacksquare$}$$

## Problemas 

Los siguientes problemas sirven como ejemplo de aplicación de los segment tree:

- [Hackerrank - Minimum Product Subinterval](https://www.hackerrank.com/contests/indeed-prime-challenge/challenges/minimum-product-sub-interval)
- [Hackerrank - Almost Equal](https://www.hackerrank.com/challenges/almost-equal-advanced)

## Referencias

[^list]: [List of Data Structures](https://en.wikipedia.org/wiki/List_of_data_structures)
[^heap]: [Heaps and Heapsort, MIT 6.006 Introduction to Algorithms, Fall 2011](https://www.youtube.com/watch?v=B7hVxCmfPtM)