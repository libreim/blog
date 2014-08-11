---
layout: resource
title: Recursos de informática
permalink: /resources/cs/
---

<ul>
{% for resource in site.cs_resources %}
    <li><a href="{{ site.baseurl }}{{ resource.url }}">{{ resource.title }}</a></li>
{% endfor %}
</ul>
