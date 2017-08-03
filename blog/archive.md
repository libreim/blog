---
title: Archivo
layout: content
paginate:
  category: blog
  per_page: 50
---

<style type="text/css">.l-arc { background: #fff; }</style>

{% for post in paginator.posts %}
- [{{ post.title }}]({{ post.url }}) por {{ post.authors | join: ", " }}{% endfor %}

{% include pagination.html %}
