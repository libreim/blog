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
* `_drafts` Esta carpeta guarda los posts que aún son borradores. Se pueden 
  incluir en el blog localmente ejecutando `jekyll serve --drafts`.
* `_plugins` Normalmente este directorio almacenaría plugins para Jekyll 
  escritos en Ruby, pero Github Pages no permite añadir plugins por seguridad.
* `_site` Este directorio se crea automáticamente al ejecutar `jekyll serve`, y
  contiene el sitio estático generado por Jekyll.

Además de estos directorios, Jekyll permite añadir más para almacenamiento de
otros datos y páginas. Por ejemplo, en este blog usamos `_cs_resources` y 
`_math_resources` para los listados de recursos de informática y de matemáticas
respectivamente. Estos directorios son escaneados por el archivo `resources.md`
gracias a que Jekyll los representa en las variables `site.cs_resources` y 
`site.math_resources`.

### Sintaxis de Jekyll

Jekyll utiliza una sintaxis de marcado llamada 
[Liquid](http://liquidmarkup.org/) simple pero potente y segura para la 
generación de código HTML a partir de plantillas. Básicamente hay dos tipos de 
mensajes que acepta. El primero es la sustitución:

~~~
{{ nombre_variable }}
~~~

Esto sustituye el contenido de la variable especificada en el lugar donde se
encuentre. Si es necesario, se interpretará como Markdown mediante el parser
especificado en `_config.yml` ([kramdown](http://kramdown.gettalong.org/) en
nuestro caso).

El otro mensaje es la evaluación de órdenes, para estructuras *if*, *for* y 
similares:

~~~
{% for post in site.posts %}
  {% if post.mola %}
    {{ post.content }}
  {% endif %}
{% endfor %}
~~~

El ejemplo es muy simple. Jekyll almacena todos los posts bajo `site.posts`, por
el que podemos iterar y renderizar cada uno si tienen asignada la variable 
`mola` a *true*.