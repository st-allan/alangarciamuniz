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
          <img src="{{ note.image }}" alt="{{ note.title }}" class="w-100 mb2">
          <h2 class="f4 f3-ns"><a href="{{ note.url }}" class="link gray">{{ note.title }}</a></h2>
          <p class="measure lh-copy">{{ note.description }}</p>
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
