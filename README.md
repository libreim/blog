[/blog](http://dgiim.github.com/blog)
====

[![Travis badge](https://travis-ci.org/dgiim/blog.svg?branch=gh-pages)](https://travis-ci.org/dgiim/blog)

Blog de los estudiantes del Doble Grado. Este blog
participó en el [hackatón UGR 2015](http://sl.ugr.es/hackatonugr).

## Colaborar

Puedes añadir un post siguiendo las
[reglas de estilo](http://dgiim.github.com/blog/styleguide).

Un post puede tratar sobre cualquier tema que te parezca interesante relacionado
con matemáticas e informática. Exponer características de un lenguaje de programación,
resolver un problema de geometría clásica, explicar un sistema de paquetes, una
aplicación de la programación lineal, qué es un comonoide, cómo trata Ruby la
visibilidad de los métodos o la sintaxis del cálculo lambda son ideas
muy válidas para un post. Además, entre las [issues de este repositorio](https://github.com/dgiim/blog/labels/post) podrás encontrar
varios temas que querríamos tratar y que están todavía abiertos.

### Añadir un nuevo post

Hemos tratado de ponerlo fácil, y para las tareas sistemáticas de creación de
ramas y posts tenemos un archivo `Rakefile` que las automatiza. Para usarlo
necesitarás tener Ruby instalado. Para crear un nuevo post, escribe en tu
terminal

~~~shell
$ rake post
~~~

Esto lanzará una serie de preguntas (el título del post, el nombre del autor
en [`_config.yml`](https://github.com/dgiim/blog/blob/gh-pages/_config.yml), etc.),
creará una rama del repositorio para que trabajes a gusto y creará el archivo
Markdown del post para que puedas escribir.

### Construir localmente

Para comprobar si tu post queda como quieres, puedes construir y servir el blog
de forma local. Para ello necesitarás tener Ruby instalado en tu máquina. La
primera vez que vayas a construir el blog tendrás que obtener las dependencias:

~~~shell
$ gem install bundler
$ bundle
~~~

Tras este paso, cada vez que quieras construir el blog, simplemente ejecuta

~~~shell
$ rake
~~~

y lo tendrás disponible en `http://localhost:4000/blog/`.
