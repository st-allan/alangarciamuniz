---
layout: page
title: Home
id: home
permalink: /
---

<main class="mw7 center">
  <ul class="list pl0">
    {% for note in site.notes | sort: 'date' | reverse | slice: 0, 5 %}
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

    <!-- Add this somewhere in your index.html -->
  <a href="/tags/" class="link dim dark-gray">View all tags</a>
  </main>
