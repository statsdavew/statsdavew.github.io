---
layout: archive
title: "Publications"
permalink: /publications/
author_profile: true
classes: wide
---

{% assign sorted = (site.publications | sort: 'year') | reverse %}

 <ul>
{% for publication in sorted %}
 <li> {{ publication.authors}} ({{ publication.year }}). {{ publication.title }}.
 	{% if publication.comment %}
 	({{ publication.comment }}).
 	{% endif %}
	{{ publication.journal }}, {{ publication.vol }}
 	{% if publication.pages %} 
 	, {{ publication.pages }}
 	{% endif %}  
 	(<a href="https://doi.org/{{ publication.doi }}">doi:{{ publication.doi }}</a>).
 </li>
{% endfor %}
