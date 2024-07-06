---
layout: page
title: notas
permalink: /notas
---
 <h1 class="dark-gray f5 f4-l mt0">notas</h1>


<strong>Recently updated notes</strong>

<ul>
  {% assign recent_notes = site.notes | sort: "last_modified_at_timestamp" | reverse %}
    <li>
      {{ note.last_modified_at | spanish_date }} — <a class="internal-link" href="{{ site.baseurl }}{{ note.url }}">{{ note.title }}</a>
    </li>
  {% endfor %}
</ul>

<style>
  .wrapper {
    max-width: 46em;
  }
</style>
