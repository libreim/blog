---
title: Archivo
layout: resource
permalink: /archive/
---

<style type="text/css">.l-arc { background: #fff; }</style>

{% for post in site.posts %}
  {% include list_post.ext %}
{% endfor %}
