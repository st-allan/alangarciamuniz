---
layout: page
title: Home
id: home
permalink: /
---

  <!-- <div class="dn db-l w-75 pv4 center tc">

 <img src="{{ site.baseurl }}/assets/alan-world.png"/>

</div>


<div class="w-100 ph3-ns">
  <div class="cf ph2-ns">
    {% assign notes = site.pages | where_exp: "item", "item.layout == 'note'" %}
    {% for note in notes %}
      <article class="fl w-100 w-50-m w-third-l pa2">
        <!-- Preview card content here
      </article>
    {% endfor %}
  </div>
</div> 

-->

<main class="mw7 center">
    <ul class="list pl0">
      {% for note in site.notes | sort: 'date' | reverse | slice: 0, 5 %}
        <li class="pa3 ba b--black-10 mb3">
          <img src="{{ note.image }}" alt="{{ note.title }}" class="w-100 mb2">
          <h2 class="f3"><a href="{{ note.url }}" class="link blue">{{ note.title }}</a></h2>
          <p class="measure">{{ note.description }}</p>
          <ul class="list pl0 flex flex-wrap">
            {% assign note_tags = note.tags %}
            {% for tag in note_tags limit:5 %}
              <li class="mr2 mb2">{{ tag }}</li>
            {% endfor %}
            {% if note_tags.size > 5 %}
              <li class="mr2 mb2">... <a href="{{ note.url }}" class="link blue">Read more</a></li>
            {% endif %}
          </ul>
        </li>
      {% endfor %}
    </ul>
  </main>


<!-- Mobile SVG
<div class="dn-l w-100 ph2 pv3 center tc">

 <img src="{{ site.baseurl }}/assets/alan-world-mobile.png"/>

 </div>-->