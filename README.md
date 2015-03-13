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