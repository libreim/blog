---
layout: chapter
title: Guía de estilo
authors:
 - fdavidcl
category: meta
permalink: /styleguide/
---

Esta guía recoge algunos consejos sobre el estilo a seguir
a la hora de escribir un post, y además podrá servir de [plantilla](https://raw.githubusercontent.com/dgiim/blog/gh-pages/guia-de-estilo.md).

## Datos del post
Los datos del post forman la cajita que debe aparecer al principio
de cada publicación. No serán interpretados por el procesador
Markdown sino por Jekyll, para poder incrustar el post en la página
web correcta y añadir los datos necesarios:

    ---
    layout: chapter
    title: Guía de estilo
    authors:
     - fdavidcl
    category: meta
    ---

Algunas aclaraciones:

 * El `layout` debe ser siempre `chapter`. Existen otros layouts
 para otras páginas, pero no para los posts.
 * El título debe ser conciso y son preferibles los sustantivos a
 los verbos (por ejemplo, mejor "*Introducción a Javascript*" que
     "*Cómo programar en Javascript*" y que "*Una introducción a la
     programación en el lenguaje Javascript*"). No debe acabar en
     punto, aunque si tiene varias frases se pueden separar por
     puntos. Por ejemplo, "*Introducción a Javascript. Programación
     con prototipos*".
 * El autor es el identificador que hayáis añadido a `config.yml`.
 Si aún no tenéis un identificador, añadidlo.
 * En `category` solo puede haber una categoría. Debe ser más genérica
 que el tema que trate el post, pero no tanto como *informática*. Se
 pueden (y se deben) poner acentos.

También es un dato del post el nombre del archivo, que será del tipo
`2014-5-17-guia-de-estilo.md`. De él se extraerá la fecha y el enlace
permanente del post, así que no lo hagais largo (en general debe
    contener las palabras más importantes del título) y separad por
    guiones y no por mayúsculas. No introduzcáis símbolos ni acentos
    (números sí son válidos).

> **Nota**: Es importante que la codificación del archivo sea *UTF-8
> sin BOM*. Si escribís en Linux la codificación *UTF-8* bastará.

## Contenido del post

### Texto y formato
No hace falta decir que cuidéis la ortografía y
la gramática :). Si usáis un editor con vista previa de Markdown
(como [Atom](http://www.webupd8.org/2014/05/install-atom-text-editor-in-ubuntu-via-ppa.html),
o [StackEdit](https://stackedit.io/)) mejor que mejor, así no hay
problemas de formato tampoco. Pero no os paséis con el formato. Reservad
la negrita para cosas muy importantes, nunca destaquéis párrafos enteros.

> **Nota**: Hay algunas diferencias entre el intérprete de Markdown del
> blog y el de Atom/Github. En general, el del blog es más estricto con las
> líneas en blanco. Añadid siempre líneas en blanco para separar elementos
> y párrafos de cualquier otra cosa (listas, código, etc.).

#### Teoremas, definiciones
Usad la siguiente notación para denotar teoremas, lemas, definiciones y
todo lo que tenga un "enunciado":

~~~markdown

Teorema
: No existen números naturales mayores que 7.
~~~

Teorema
: No existen números naturales mayores que 7.

#### Referencias
Para añadir referencias lo podemos hacer mediante notas a pie de página.
Kramdown incluye una sintaxis específica para esta tarea[^kram]:

[^kram]: [Kramdown Syntax](http://kramdown.gettalong.org/syntax.html#footnotes)

~~~markdown
Kramdown incluye una sintaxis específica para esta tarea[^kram]

[^kram]: [Kramdown Syntax - Footnotes](http://kramdown.gettalong.org/syntax.html#footnotes)
~~~

> **Nota**: ¡Usad un identificador suficientemente descriptivo para la referencia!
> Jekyll no distingue entre referencias de posts distintos por lo que
> si dos referencias tienen el mismo identificador se generarán enlaces que
> llevarán a una de ellas nada más. 

En general trataremos de seguir el siguiente formato para las referencias
de libros:

~~~markdown
Libro, Autor - Sección (página NN)
~~~

y este para las referencias a sitios web:

~~~markdown
[Página web](http://example.org)
~~~

Si no tenéis un sitio concreto para ubicar la marca de referencia, añadid
una frase al final al estilo de:

Más información [^camino], [^mathandp]

[^camino]: Constant Mean Curvature Surfaces with Boundary, Rafael López Camino -  The Dirichlet Problem in Hyperbolic Space
[^mathandp]: [Math and Programming](http://jeremykun.com/)

### Títulos y secciones
Tenéis disponibles los títulos desde el nivel 2 (`##`) hasta nivel 6
(`######`), aunque no os recomendaría usar tantos niveles. El nivel 1
se utiliza automáticamente para el título del
post. De nuevo, no escribáis un punto al final de un título. Evitad
utilizar cualquier otro tipo de separación entre apartados, no uséis
líneas horizontales (`* * *`) ni otro tipo de marcas. Si véis que la
estructura de los posts no es suficientemente visible, mandadme un
mensaje y mejoro el estilo de los títulos de sección.

> **Nota**: El procesador de Markdown del blog requiere una línea en
> blanco antes de cada título.

Ejemplos:

## Título 2

### Título 3

#### Título 4

##### Título 5

###### Título 6

### El código
Para escribir código tenemos dos sintaxis. o bien dejar 4 espacios de
margen, como el siguiente ejemplo

~~~markdown
    def codigo_en_ruby
      "Una prueba"
    end
~~~
que genera

    def codigo_en_ruby
      "Una prueba"
    end

o bien utilizar las marcas `~~~`, que además permiten especificar el
lenguaje:

~~~~markdown
~~~ruby
def codigo_en_ruby
  "Una prueba"
end
~~~
~~~~

que genera

~~~ruby
def codigo_en_ruby
  "Una prueba"
end
~~~

### Las matemáticas
Para incrustar ecuaciones en `$\LaTeX$`, hay que hacerlo entre tildes
invertidas y dólares, dos dólares para las ecuaciones
en modo *display*. Ejemplos:

~~~markdown
`$E = mc^2$`
~~~

genera `$E = mc^2$`, y

~~~markdown
`$$ \sqrt[n]{x_1x_2 \dots x_n} \leq \frac{x_1+x_2+\dots+x_n}{n} $$`
~~~

`$$ \sqrt[n]{x_1x_2 \dots x_n} \leq \frac{x_1+x_2+\dots+x_n}{n} $$`

Las tildes invertidas nos evitan problemas con los caracteres de
formato de Markdown (como `_`, `*`, etc.).
