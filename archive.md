---
title: Archivo
layout: content
permalink: /archive/
paginate:
  collection: blog
  reversed: true
  per_page: 50
---

<style type="text/css">.l-arc { background: #fff; }</style>

{% for post in paginator.blog %}
- [{{ post.title }}]({{ post.url }}) por {{ post.authors | join: ", " }}{% endfor %}

{% include pagination.html %}
