---
layout: page
title: notas
permalink: /notas
---
 
 <main class="mw7 center">
  <h1 class="dark-gray f5 f4-l mt0">notas</h1>
  <strong>Notas actualizadas recientemente</strong>
  <ul class="list pl0">
    {% for note in site.notes | sort: 'date' | reverse %}
    <li class="pa3 pa4-ns mb3">
      <a href="{{ note.url }}" class="db overflow-hidden image-container">
        <img src="{{ note.image }}" alt="{{ note.title }}" class="w-100 mb2 note-image">
      </a>
      <h2 class="f4 f3-ns"><a href="{{ note.url }}" class="link dim dark-gray">{{ note.title }}</a></h2>
      <p class="measure lh-copy f6 dark-gray tj-ns">{{ note.description | truncatewords: 25, "..." }}</p>
          <ul class="list pl0 flex flex-wrap">
            {% assign note_tags = note.tags %}
            {% for tag in note_tags limit:5 %}
              <li class="mr2 mb2">
                <a href="/tags/{{ tag | slugify }}" class="tag">{{ tag }}</a>
              </li>
            {% endfor %}
            {% if note_tags.size > 5 %}
              <li class="mr2 mb2"><a href="{{ note.url }}" class="tag">...</a></li>
            {% endif %}
          </ul>
        </li>
      {% endfor %}
    </ul>
  </main>

<style>
  .wrapper {
    max-width: 46em;
  }
</style>
