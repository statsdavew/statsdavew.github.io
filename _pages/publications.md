---
layout: single
title: Publications
permalink: /publications/
author_profile: true
classes: wide
---


{% assign sorted = (site.publications | sort: 'year') | reverse %}

{% comment %}
<h2>Working papers</h2>

<ul>
{% for publication in sorted %}
 {% if publication.type == "Misc" %}
 <li> {{ publication.authors}} ({{ publication.year }}). {{ publication.title }}.
	{{ publication.journal }}, 
	{% if publication.vol %}
	{{ publication.vol }}
	{% endif %}
	{% if publication.editors %}
	editors: {{ publication.editors }}
	{% endif %}
	{% if publication.publisher %}
	{{ publication.publisher }},
	{% endif %}
	{% if publication.location %}
	{{ publication.location }}
	{% endif %}
 	{% if publication.pages %} 
 	{{ publication.pages }}
 	{% endif %}
 	{% if publication.doi %}  
 	(<a href="https://doi.org/{{ publication.doi }}">doi:{{ publication.doi }}</a>).
 	{% endif %}
 	{% if publication.link %}  
 	(<a href="{{ publication.link }}">{{ publication.link }}</a>).
 	{% endif %}
 	{{ publication.content }}
 </li>
 {% endif %}
{% endfor %}
</ul>	
{% endcomment %}

<h2>Publications</h2>

 <ul>
{% for publication in sorted %}
{% unless publication.type == 'Misc' %}
 <li> {{ publication.authors}} ({{ publication.year }}). {{ publication.title }}.
	{{ publication.journal }}, 
	{% if publication.vol %}
	{{ publication.vol }}
	{% endif %}
	{% if publication.editors %}
	editors: {{ publication.editors }}
	{% endif %}
	{% if publication.publisher %}
	{{ publication.publisher }},
	{% endif %}
	{% if publication.location %}
	{{ publication.location }}
	{% endif %}
 	{% if publication.pages %} 
 	{{ publication.pages }}
 	{% endif %}
 	{% if publication.doi %}  
 	(<a href="https://doi.org/{{ publication.doi }}">doi:{{ publication.doi }}</a>).
 	{% endif %}
 	{% if publication.link %}  
 	(<a href="{{ publication.link }}">{{ publication.link }}</a>).
 	{% endif %}
 	{{ publication.content }}
 </li>
 {% end unless %}
{% endfor %}
</ul>