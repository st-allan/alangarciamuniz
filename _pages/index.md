---
layout: page
title: Home
id: home
permalink: /
---

<div class="dn db-l w-75 pv4 center tc">

 <img src="{{ site.baseurl }}/assets/alan-world.png"/>

</div>


<div class="w-100 ph3-ns">
  <div class="cf ph2-ns">
    {% assign notes = site.pages | where_exp: "item", "item.layout == 'note'" %}
    {% for note in notes %}
      <article class="fl w-100 w-50-m w-third-l pa2">
        <!-- Preview card content here -->
      </article>
    {% endfor %}
  </div>
</div>


<!-- Mobile SVG-->
<div class="dn-l w-100 ph2 pv3 center tc">

 <img src="{{ site.baseurl }}/assets/alan-world-mobile.png"/>

 </div>