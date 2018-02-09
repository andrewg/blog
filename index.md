---
title: Today I Learned
---

{% for post in site.posts %}
- [{{ post.title }}]({{ post.url }})
{% endfor %}
