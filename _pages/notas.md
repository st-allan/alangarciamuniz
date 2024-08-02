---
layout: page
title: notas
permalink: /notas
---
 
 <main class="mw7 center">
  <h1 class="pa3 pa4-ns fw1 dark-gray f5 f4-l mt0">notas</h1>
  <strong class="pa3 pa4-ns mb3">Notas actualizadas recientemente</strong>
  <ul class="list pl0">
    {% for note in site.notes | sort: 'date' | reverse %}
    <li class="pa3 pa4-ns mb3">
      <a href="{{ note.url }}" class="db overflow-hidden image-container">
        <img src="{{ note.image }}" alt="{{ note.title }}" class="w-100 mb2 note-image">
      </a>
      <h2 class="fw1 f4 f3-ns"><a href="{{ note.url }}" class="link dim dark-gray">{{ note.title }}</a></h2>
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

<section class="mw7 center">
  <h2 class="fw1 ph3 ph0-l">News</h2>
  <article class="bt bb b--black-10">
    <a class="db pv4 ph3 ph0-l no-underline black dim" href="#0">
      <div class="flex flex-column flex-row-ns">
        <div class="pr3-ns mb4 mb0-ns w-100 w-40-ns">
          <img src="http://mrmrs.github.io/photos/cpu.jpg" class="db" alt="Photo of a dimly lit room with a computer interface terminal.">
        </div>
        <div class="w-100 w-60-ns pl3-ns">
          <h1 class="f3 fw1 mt0 lh-title">Tech Giant Invests Huge Money to Build a Computer Out of Science Fiction</h1>
          <p class="f6 f5-l lh-copy">
            The tech giant says it is ready to begin planning a quantum
            computer, a powerful cpu machine that relies on subatomic particles instead
            of transistors.
          </p>
          <p class="f6 lh-copy mv0">By Robin Darnell</p>
        </div>
      </div>
    </a>
  </article>
  <article class="bb b--black-10">
    <a class="db pv4 ph3 ph0-l no-underline black dim" href="#0">
      <div class="flex flex-column flex-row-ns">
        <div class="pr3-ns mb4 mb0-ns w-100 w-40-ns">
          <img src="http://mrmrs.github.io/photos/warehouse.jpg" class="db" alt="Photo of a warehouse with stacked shelves.">
        </div>
        <div class="w-100 w-60-ns pl3-ns">
          <h1 class="f3 fw1 mt0 lh-title">Warehouse Prices Are Fast on the Rise</h1>
          <p class="f6 f5-l lh-copy">
            A warehouse is a commercial building for storage of goods.
            Warehouses are used by manufacturers, importers, exporters,
            wholesalers, transport businesses, customs, etc. They are
            usually large plain buildings in industrial areas of cities,
            towns and villages.
          </p>
          <p class="f6 lh-copy mv0">By Robin Darnell</p>
        </div>
      </div>
    </a>
  </article>
  <article class="bb b--black-10">
    <a class="db pv4 ph3 ph0-l no-underline black dim" href="#0">
      <div class="flex flex-column flex-row-ns">
          <div class="pr3-ns mb4 mb0-ns w-100 w-40-ns">
           <img src="http://mrmrs.github.io/photos/whale.jpg" class="db" alt="Photo of a whale's tale coming crashing out of the water.">
          </div>
          <div class="w-100 w-60-ns pl3-ns">
            <h1 class="f3 fw1 mt0 lh-title">Giant Whale Invests Huge Money to Build a Computer Out of Plankton</h1>
            <p class="f6 f5-l lh-copy">
            Whale is the common name for a widely distributed and diverse
            group of fully aquatic placental marine mammals. They are an
            informal grouping within the infraorder Cetacea, usually
            excluding dolphins and porpoises.
           </p>
            <p class="f6 lh-copy mv0">By Robin Darnell</p>
          </div>
        </div>
      </a>
    </article>
  </section>
  </main>

<style>
  .wrapper {
    max-width: 46em;
  }
</style>
