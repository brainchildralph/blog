---
layout: basic
pages: web
---
<div class="container">
{% for p in site.data[page.pages] %}
  <a href="{{ '/web/' | append: p.first | append: / | prepend:site.baseurl }}">{{ p[1].data.name }}</a>
{% endfor %}
</div>
