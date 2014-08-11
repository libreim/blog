---
layout: resource
title: Recursos
permalink: /resources/
---

<style type="text/css">.l-res { background: #fff; }</style>

## Matemáticas

<ul>
{% for resource in site.math_resources %}
    <li><a href="{{ site.baseurl }}{{ resource.url }}">{{ resource.title }}</a></li>
{% endfor %}
</ul>

## Informática

<ul>
{% for resource in site.cs_resources %}
    <li><a href="{{ site.baseurl }}{{ resource.url }}">{{ resource.title }}</a></li>
{% endfor %}
</ul>
