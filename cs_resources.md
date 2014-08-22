---
layout: resource
title: Recursos de informática
permalink: /resources/cs/
---

{% for resource in site.cs_resources %}
  [{{ resource.title }}]({{ site.baseurl }}{{ resource.url }})
{% endfor %}
