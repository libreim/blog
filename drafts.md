---
title: Propuestas de posts
layout: resource
permalink: /drafts/
---

Conjetura de Frankl
----------------------
[mathOverflow](http://mathoverflow.net/questions/232821/why-is-the-frankl-conjecture-hard?rq=1)
Más información, #121


¿Cómo contribuir a un proyecto de software libre?
----------------------
1. Conocer git
2. Abrirse una cuenta en GitHub
3. Hacer un fork de algún repositorio que interese, por el tema, porque es una dependencia de uno en el que se está trabajando, por lo que sea.
3. Mirar el fichero CONTRIBUTING.md que tienen muchos repositorios.
4. Mirar los issues abiertos y/o los pull request que hay abiertos. Si hay muchos pull requests abiertos, quizás no los estén aceptando. Los issues, sin embargo, sirven para saber qué cosas le puede interesar al desarrollador.
5. Hacer el pull request y completarlo con lo que requiera el autor del repo.

Algunos consejos para colaboraciones fáciles:

1. Seguir las instrucciones de instalación del repo y, si algo no funciona, modificar el README.md y hacer un pull request sobre el mismo.
2. Mirar la ortografía o la gramática de comentarios y documentación, modificar y mejorar la misma.
3. Si no tiene integración continua con Travis u otro sistema, añadir .travis.yml.
4. Borrar ficheros que no sirvan.
5. Muy importante: hacer commits "atómicos", no un sólo commit con todas las modificaciones, especialmente si no están relacionadas. Si se cambia la ortografía, uno por párrafo o incluso frase. Un commit por función, un commit por nuevo fichero añadido o borrado. Así es más fácil a quien acepta el pull request aceptarlo haciendo "cherry-picking"

Por último, consejos para encontrar proyectos a los que contribuir. Afortunadamente, en la UGR hay cientos de proyectos iniciados por grupos de investigación o compañeros, del ámbito académico o pachangas propias. No tienes que contribuir tu primera vez, o posiblemente nunca, a LLVM o al kernel de linux; puede ser a la práctica de 2º de carrera de tu compañero o al TFM de alguien de tu pueblo, o quizás a un trabajo de investigación de algún grupo como GeNeura http://github.com/geneura-papers. Si quieres sugerencias, en la lista de Telegram de software libre de la UGR seguro que hay alguien que necesite ayuda.

6. Traducir al castellano, si el CONTRIBUTING.md y el contenido del repositorio facilitan la labor y no está hecha.

Adicionalmente se podría hablar de cómo animar al resto de usuarios a que contribuyan a tu propio proyecto: cómo presentar un buen README, cómo redactar un buen CONTRIBUTING...

Y cómo se debería colaborar si el proyecto que nos interesa no tiene CONTRIBUTING ni issues abiertos sin asignar.

Más información, #120


Introducción a la Topología Algebraica
---------------------
He pensado que un post introductorio a la teoría de lazos y el grupo fundamental sería interesante, tanto por su valor académico como por servir de apuntes de la parte inicial de la asignatura de Topología II. Me encargaré de ir redactándolo cuando tenga tiempo. De momento abro nueva rama para hacer ahí los cambios.

Más información, #113


¿Cómo estudiar matemáticas?
---------------------
Más información, #104


Estándar MIDI
---------------------
Explicar el MIDI a bajo y alto nivel y cómo usarlo. Mostrar ejemplos de uso y control desde la terminal.

Más información, #100


¿Cómo funciona el blog?
---------------------
Explicar cómo funciona internamente y cómo es posible colaborar con el blog. Cómo funciona jekyll, y todo el proceso que tiene alguien que seguir para subir un post al blog.

Más información, #97


Problemas abiertos en matemáticas
---------------------
Como por ejemplo:
* Conjetura de Collatz
* Existencia de impares perfectos
* Normalidad de pi
* Conjetura de Goldbach

Me interesan aquí los de enunciado fácil. A los grandes (Riemann, por ejemplo) se les puede dedicar un post aparte.

Más información, #85


Longest Increasing Subsequence
---------------------
Explicar el problema y proporcionar varios algoritmos para resolverlo en O(n log n) (programación dinámica, segment trees, binary  indexed trees). Demostrar varios resultados matemáticos al respecto, como el teorema de Erdős–Szekeres. Mostrar varias aplicaciones.

Más información, #84



Topological Sort
---------------------
Explicar en qué consiste el orden topológico de un grafo dirigido, deducir cuándo existe y proporcionar un algoritmo O(|V| + |E|) para calcularlo.

Tiene un comienzo en #91

Más información, #83


Page Rank
---------------------
Explicar el algoritmo Page Rank utilizado por el motor de búsqueda de google desde un punto de vista matemático.

Más información, #78


Futurama theorem
---------------------
[Futurama theorem](http://theinfosphere.org/Futurama_theorem)

Más información, #74


Números ordinales
---------------------
Introducir los números ordinales. El ordinal ω, conjuntos bien ordenados, ordinales sucesores y ordinales límite. Inducción transfinita.

Más información, #69


Introducción a la geometría proyectiva
---------------------
Explicar las definiciones básicas y algunos ejemplos de uso. Como idea, hablar de coordenadas baricéntricas y homografías. Razón doble y cuaternas armónicas.

Más información, #68


Análisis de redes eléctricas
---------------------
Hacer un post sobre la formalización del análisis de circuitos utilizando la teoría de grafos.

**Recursos:**
- [Circuit Theory I - John Baez](http://ncatlab.org/johnbaez/show/Circuit+theory+I)
- [Network Theory Series](http://math.ucr.edu/home/baez/networks/)

Más información, #67


Gerrymandering
---------------------
[Wikipedia](http://es.wikipedia.org/wiki/Gerrymandering)
[Relación con las matemáticas](http://www.maa.org/sites/default/files/pdf/upload_library/22/Polya/Hodge2011.pdf))
[StackExchange](http://math.stackexchange.com/questions/38772)

Más información, #63


Evaluación perezosa
---------------------
Hacer un post sobre evaluación perezosa en *Haskell* y cómo evaluar la eficiencia.

Más información, #61


Word problem
---------------------
Explicar el [word problem](http://en.wikipedia.org/wiki/Word_problem_%28mathematics%29) y los algoritmos para su resolución, como [Knuth-Bendix](http://en.wikipedia.org/wiki/Knuth%E2%80%93Bendix_completion_algorithm).

Más información, #59


Disjoint-set forests
---------------------
Estudiar las posibles estructuras de datos para representar conjuntos disjuntos, como los [bosques de conjuntos disjuntos](http://en.wikipedia.org/wiki/Disjoint-set_data_structure). Son estructuras que soportan las funciones:
* `find`: Busca el subconjunto al que pertenece un elemento.
* `union`: Une dos subconjuntos en uno solo.
Quien quiera escribirlo puede asignarse.

Más información, #58


Hadwiger-Nelson problem
---------------------
El problema de [Hadwiger-Nelson](http://en.wikipedia.org/wiki/Hadwiger%E2%80%93Nelson_problem) pregunta el mínimo número de colores con los que colorear el plano de forma que no existan dos puntos a distancia 1 con el mismo color. **Es un problema abierto.**

Más información, #57


Fast inverse square root
---------------------
Acabo de encontrarme este [método](http://en.wikipedia.org/wiki/Fast_inverse_square_root) para calcular la inversa de la raíz cuadrada usando logaritmos y la representación binaria de un `float`. No tiene artículo en Wikipedia en castellano, así que escribir un artículo sobre esto podría ser interesante. Puede asignarse quien quiera escribirlo.

Más información, #56


Teorema Incompletitud Gödel
---------------------
Introducir de forma amena y sencilla el Teorema de Incompletitud de Gödel.
http://blog.plover.com/math/Gdl-Smullyan.html

Más información, #41


Curvas elípticas
---------------------
Escribir un post introduciendo la teoría de curvas elípticas. Usarla con ejemplos de código y llegar hasta criptografía si es posible.

Más información, #27


P-NP
---------------------
Explicar el problema, definiendo las clases P y NP.

Más información, #26


Banach-Tarski
---------------------
Explicar la paradoja, enlazar a una demostración o demostrarla y analizarla.
[Vídeo](https://www.youtube.com/watch?v=s86-Z-CbaHA)
[Apuntes de Carlos Ivorra](http://www.uv.es/~ivorra/Libros/Banach_Tarski.pdf)

Más información, #25
