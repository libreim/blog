---
layout: resource
title: Recursos
permalink: /resources/
---

<style type="text/css">.l-res { background: #fff; }</style>

En esta sección encontrarás listas de enlaces y bibliografías útiles para estudiar
y conocer cada una de las ramas de estudio del Doble Grado. Puedes añadir tus recursos
siguiendo la [guía de recursos](http://dgiim.github.io/blog/resourcesguide).

## Matemáticas

{% for resource in site.math_resources %}
  [{{ resource.title }}]({{ site.baseurl }}{{ resource.url }})
{% endfor %}

## Informática

{% for resource in site.cs_resources %}
  [{{ resource.title }}]({{ site.baseurl }}{{ resource.url }})
{% endfor %}
