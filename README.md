[/blog](http://dgiim.github.com/blog)
====

[![Travis badge](https://travis-ci.org/dgiim/blog.svg?branch=gh-pages)](https://travis-ci.org/dgiim/blog)

Blog de los estudiantes del Doble Grado. Este blog
participó en el [hackatón UGR 2015](http://sl.ugr.es/hackatonugr).

## Colaborar con posts

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
necesitarás tener Ruby instalado. Para crear un nuevo post, clona este repositorio
y escribe en tu terminal

~~~sh
$ rake post
~~~

Esto lanzará una serie de preguntas (el título del post, el nombre del autor
en [`_config.yml`](https://github.com/dgiim/blog/blob/gh-pages/_config.yml), etc.),
creará una rama del repositorio para que trabajes a gusto y creará el archivo
Markdown del post para que puedas escribir.

### Contenido

La [guía de estilo](http://dgiim.github.com/blog/styleguide) te servirá de
chuleta para la sintaxis de Markdown y algunas peculiaridades acerca de como dar
formato correctamente a tu post.

### Construir localmente

Para comprobar si tu post queda como quieres, puedes construir y servir el blog
de forma local. Para ello necesitarás tener Ruby instalado en tu máquina. La
primera vez que vayas a construir el blog tendrás que obtener las dependencias:

~~~sh
$ gem install bundler
$ bundle
~~~

Tras este paso, cada vez que quieras construir el blog, simplemente ejecuta

~~~sh
$ rake
~~~

y lo tendrás disponible en `http://localhost:4000/blog/`.

### Enviar a revisión

Revisamos los posts entre colaboradores para asegurar en la medida de lo posible
la corrección de los posts. Cuando creas que tu post está listo para revisar,
solo tienes que utilizar el siguiente comando:

~~~sh
$ rake submit
~~~

Se abrirá una pestaña de navegador preparada para que crees una *pull request*
al repositorio original del blog. Rellena un poco la descripción y créala. A
partir de entonces espera a que al menos dos colaboradores den su visto bueno,
y pide a alguno de ellos que mezcle la *pull request*.

## Otras formas de colaborar

Este blog no solo vive de los posts escritos. También puedes ayudar de otras
maneras.

### Revisión

Si el blog recibe un post mediante una [*pull request*](https://github.com/dgiim/blog/pulls)
y crees que tienes conocimientos generales sobre el tema suficientes para
revisarlo y corregir posibles errores, clona el repositorio y cambia a la rama
conveniente:

~~~sh
git clone https://github.com/dgiim/blog.git
cd blog
git checkout post-nombre-del-post
~~~

Utiliza `rake` para [construir el blog localmente](#construir-localmente).
Los errores que encuentres y correcciones que quieras realizar puedes comentarlos
en la *pull request* asociada.

Cuando consideres que el post esté listo para ser publicado, asegúrate de dejar
un comentario en la *pull request* dando tu visto bueno.
