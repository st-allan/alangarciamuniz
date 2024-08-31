---
layout: page
title: Home
id: home
permalink: /
---

<main class="mw7 center">
  <div class="mb4 flex justify-center">
    <img src="assets/alan.jpg" class="w-auto h-auto mw-25 mw-80-ns mw-80-l" alt="Photo of outer space">
  </div>
  <ul class="list pl0">
    {% assign sorted_notes = site.notes | sort: 'date' | reverse %}
    {% for note in sorted_notes | slice: 0, 5 %}
    <li class="pa3 pa4-ns mb3">
      <a href="{{ note.url }}" class="db overflow-hidden image-container">
        <img src="{{ note.image }}" alt="{{ note.title }}" class="w-100 mb2 note-image">
      </a>
      <h2 class="f4 f3-ns"><a class="link dim dark-gray" href="{{ note.url }}">{{ note.title }}</a></h2>
      <p class="measure-max lh-copy f6 dark-gray tj-ns">{{ note.description | truncatewords: 25, "..." }}</p>
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
