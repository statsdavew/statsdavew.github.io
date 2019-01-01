---
layout: single
title: Publications
permalink: /publications/
author_profile: true
redirect_from: 
  - /publications/
  - /publications.html
classes: wide
header: 
 image: /assets/images/wordcloud.jpg
 image_description: "Word cloud from my Fellowship application" 
---


{% assign sorted = (site.publications | sort: 'year') | reverse %}


<h2>Working papers</h2>

<ul>
{% for publication in sorted %}
 {% if publication.type == "Misc" %}
 <li> {{ publication.authors}} ({{ publication.year }}). {{ publication.title }}.
	{{ publication.journal }} 
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

<h2>Journal papers</h2>

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
 		<i>{{ publication.content }}.</i>
 		</li>
 	{% endunless %}
{% endfor %}
</ul>