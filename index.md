---
title: Today I Learned
---

{% for post in site.posts %}
- [{{ post.url }}]({{ post.title }})
{% endfor %}
