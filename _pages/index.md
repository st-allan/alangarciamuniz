---
layout: default
subtitle: blog.
permalink: /
---
<div class="pt2 pt3-l pb2 ph3 ph0-l center">

 <div class="flex flex-wrap bg-light-gray shadow-4 pa4 lh-copy f4 br2 mv4 w-third-l w-two-thirds-m center">
  <a href="/about" class="db overflow-hidden">
   <img class="w-auto h-auto mw-100 mw-90-ns mw-80-l note-image image-container" style="transform:rotate(-2deg)" src="assets/alan.jpg">
  </a>
    <!--<div class="w-75-l pl4-l">
    <strong class="f3">Hi, I'm Tom Critchlow 👋</strong>
    <br><br>
    I'm based in Brooklyn, NY and work as an independent consultant.
    <br><br>
    Welcome to my digital garden 🌱
  </div>-->
</div>
<main class="mw7 center">
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
