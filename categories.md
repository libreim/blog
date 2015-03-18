---
layout: resource
title: Categorías
permalink: /categories/
---

<style type="text/css">.l-cat { background: #fff; }</style>

#### Lista de categorías

{% for category in site.categories %}
  * [{{ category | first | capitalize }}](#{{ category | first }})
{% endfor %}

{% for category in site.categories %}
  <h2 id="{{ category | first }}">{{ category | first | capitalize }}</h2>
  {% assign posts = category | last %}
  {% for post in posts %} {% include list_post.ext %} {% endfor %}
{% endfor %}
