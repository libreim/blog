[/blog](http://dgiim.github.com/blog)
====

[![Travis badge](https://travis-ci.org/dgiim/blog.svg?branch=gh-pages)](https://travis-ci.org/dgiim/blog)

Blog de los estudiantes del Doble Grado. Si tienes algo que contar o algún 
recurso que aportar, añade un post siguiendo las 
[reglas de estilo](http://dgiim.github.com/blog/styleguide). Este blog está 
participando en el [hackatón UGR](http://sl.ugr.es/hackathonugr).

## Jekyll

El blog se genera usando [Jekyll](http://jekyllrb.com), un generador de sitios 
estáticos escrito en Ruby.

### Instalación

Para utilizar y probar el blog localmente es necesario instalar Ruby y la gema
[github-pages](https://github.com/github/pages-gem). Esto se puede conseguir
utilizando el `Gemfile` provisto con el blog:

~~~bash
git clone git@github.com:dgiim/blog.git dgiim-blog
cd dgiim-blog
bundle install
~~~

o bien instalándola mediante `gem`:

~~~bash
sudo gem install github-pages
~~~

### Uso

Jekyll cuenta con un comando que genera el sitio estático (en `_site/`):

~~~bash
jekyll serve
~~~

Ahora el blog estará disponible en `localhost:4000/blog/`.

### Directorios

Un blog de Jekyll se estructura en varios directorios, todos ellos empezando con
un guion bajo `_`:

* `_layouts` Aquí se guardan las plantillas que se utilizan para generar cada
  página del blog. Este blog tiene una plantilla `post` y otra `resource`, 
  ambas heredando de la plantilla `default`. La plantilla de un archivo se
  especifica con la opción `layout` de la caja YAML al inicio del mismo. Si 
  queremos que no se aplique ninguna plantilla a un archivo utilizaremos 
  `layout: none`.
* `_includes` Contiene archivos `.ext` que son fragmentos de código HTML que se
  pueden incluir en cualquier parte de una página mediante 
  `{% include ejemplo.ext %}`. Este blog cuenta con *includes* para la cabecera
  y el pie de la página, para renderizar un post, una lista de posts y para
  incluir el script de Disqus.
* `_posts` Incluye todos los posts que se han de mostrar en la página principal,
  en general escritos en Markdown. El nombre de cada archivo debe indicar la
  fecha del post y el camino del URL en el que se encontrará. Por ejemplo, el
  archivo `2015-3-14-pi-day.md` se mostraría en `/2015/03/14/pi-day`.