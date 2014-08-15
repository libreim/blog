---
layout: resource
title: Categorías
permalink: /categories/
---

<style type="text/css">.l-cat { background: #fff; }</style>

#### Lista de categorías

{% for category in site.categories %}
  * [{{ category | first }}](#{{ category | first }})
{% endfor %}

{% for category in site.categories %}
  <h2 id="{{ category | first }}">{{ category | first }}</h2>
  {% assign posts = category | last %}
  {% for post in posts %} {% include list_post.ext %} {% endfor %}
{% endfor %}
