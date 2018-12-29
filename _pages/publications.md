---
layout: archive
title: "Publications"
permalink: /publications/
author_profile: true
---

{% assign sorted = (site.publications | sort: 'year') | reverse %}

 <ul>
{% for publication in sorted %}
 <li> {{ publication.authors}} ({{ publication.year }}). {{ publication.title }}. {{ publication.journal }}, {{ publication.vol }} 
 	(<a href="https://doi.org/{{ publication.doi }}">doi:{{ publication.doi }}</a>).
 </li>
{% endfor %}
