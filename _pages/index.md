---
layout: default
subtitle: blog.
permalink: /
---
<main class="mw7 center ph3 pt3 pt4-ns">
  <div class="pa4 br2 bg-light-gray shadow-4 mw6 center">
    <a href="/about" class="db overflow-hidden image-container">
    <img class="mw-100 db center" style="transform:rotate(-2deg)" src="assets/alan.jpg" alt="Alan in Mexico City">
   </a>
  </div>

  <ul class="list pl0">
    {% assign sorted_notes = site.notes | sort: 'date' | reverse %}
    {% assign sliced_notes = sorted_notes | slice: 0,5 %}
    {% for note in sliced_notes %}
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
