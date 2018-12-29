---
layout: archive
title: "Publications"
permalink: /publications/
author_profile: true
---

{% assign sorted = (site.publications | sort: 'year') | reverse %}

 <ul>
{% for publication in sorted %}
 <li> {{ publication.authors}} ({{ publication.year }})
 </li>
{% endfor %}