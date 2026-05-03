---
layout: default
title: 1000 km
permalink: /1000km/
---

<!--
  _pages/1000km.md
  ─────────────────
  Drop this file into your Jekyll _pages/ folder.
  Rides are driven by _data/rides.yaml — add a new entry there for each ride.
  No JavaScript framework required.
-->

<style>
  *, *::before, *::after { box-sizing: border-box; }

  .km-page {
    max-width: 560px;
    margin: 0 auto;
    padding: 0 16px 64px;
    font-family: 'Libre Franklin', -apple-system, sans-serif;
  }

  /* ── Header ── */
  .km-heading {
    padding-top: 24px;
    margin-bottom: 0;
  }
  .km-heading h1 {
    font-weight: 300;
    font-size: 1rem;
    color: hsl(0,0%,10%);
    margin: 0 0 2px;
  }
  .km-heading p {
    font-size: 0.8rem;
    color: hsl(0,0%,45%);
    margin: 0;
  }

  /* ── Counter ── */
  .km-counter {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 16px;
    padding: 32px 0 24px;
  }
  .route-track {
    stroke: hsl(0,0%,88%);
    stroke-width: 3;
    fill: none;
    stroke-linecap: round;
    stroke-linejoin: round;
  }
  .route-fill {
    stroke: hsl(0,0%,10%);
    stroke-width: 3;
    fill: none;
    stroke-linecap: round;
    stroke-linejoin: round;
    transition: stroke-dashoffset 1.4s cubic-bezier(0.4, 0, 0.2, 1);
  }
  .route-dot {
    fill: hsl(0,0%,10%);
  }
  .km-stats {
    width: 100%;
    text-align: center;
  }
  .km-number {
    font-weight: 300;
    font-size: 5rem;
    line-height: 1;
    color: hsl(0,0%,10%);
    letter-spacing: -0.03em;
    margin-bottom: 6px;
  }
  .km-goal-label {
    font-size: 0.875rem;
    color: hsl(0,0%,40%);
    margin-bottom: 20px;
  }
  .km-bar-wrap {
    width: 100%;
    max-width: 260px;
    height: 2px;
    background: hsl(0,0%,88%);
    border-radius: 2px;
    margin: 0 auto 6px;
  }
  .km-bar-fill {
    height: 100%;
    background: hsl(0,0%,10%);
    border-radius: 2px;
    transition: width 1.4s cubic-bezier(0.4,0,0.2,1);
    width: 0;
  }
  .km-pct-label {
    font-size: 0.78rem;
    color: hsl(0,0%,55%);
  }

  /* ── Divider ── */
  .km-divider {
    border: none;
    height: 1px;
    background: hsl(0,0%,90%);
    margin: 4px 0 24px;
  }

  /* ── Rides header row ── */
  .km-rides-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 4px;
  }
  .km-rides-count {
    font-size: 0.78rem;
    color: hsl(0,0%,55%);
  }

  /* ── Ride cards ── */
  .ride-card {
    padding: 20px 0 28px;
    border-bottom: 1px solid hsl(0,0%,92%);
  }
  .ride-card:first-child { border-top: 1px solid hsl(0,0%,92%); }
  .ride-img-wrap {
    display: block;
    overflow: hidden;
    border-radius: 4px;
    margin-bottom: 12px;
  }
  .ride-img {
    width: 60%;
    aspect-ratio: 9 / 16;
    object-fit: cover;
    object-position: center;
    border-radius: 4px;
    display: block;
    margin: 0 auto;
  }
  .ride-title {
    font-weight: 300;
    font-size: 1.05rem;
    color: hsl(0,0%,10%);
    line-height: 1.3;
    margin: 0 0 4px;
  }
  .ride-date {
    font-size: 0.8rem;
    color: hsl(0,0%,45%);
    margin-bottom: 10px;
  }
  .ride-chips {
    display: flex;
    gap: 6px;
    flex-wrap: wrap;
  }
  .chip {
    display: inline-flex;
    align-items: center;
    background: #f4f4f4;
    color: #333;
    font-size: 0.78rem;
    padding: 0.15rem 0.5rem;
    border-radius: 0.25rem;
    font-family: 'Libre Franklin', sans-serif;
  }
  .chip-km {
    background: hsl(0,0%,10%);
    color: #fff;
  }

  @media (max-width: 640px) {
    .km-number { font-size: 3.8rem; }
  }
</style>

<!-- ── DATA (driven by _data/rides.yaml) ───────────────────── -->
{% assign rides = site.data.rides | sort: "date" | reverse %}
{% assign total_km = 0 %}
{% for ride in rides %}
  {% assign total_km = total_km | plus: ride.km %}
{% endfor %}
{% assign goal = 1000 %}
{% assign pct_raw = total_km | times: 100.0 | divided_by: goal %}
{% assign pct = pct_raw | floor %}
{% assign remaining = goal | minus: total_km %}

<div class="km-page">

  <!-- Heading -->
  <div class="km-heading">
    <h1>1000 km</h1>
    <p>a goal to ride 1,000 km before the end of 2026.</p>
  </div>

  <!-- Counter -->
  <div class="km-counter">
    <svg id="route-svg" width="340" height="310" viewBox="0 0 510 425" style="display:block">
      <path class="route-track"
        d="M 20 340 C 30 300, 15 270, 35 240 C 55 210, 70 230, 80 210 C 90 190, 75 165, 95 145 C 115 125, 140 145, 155 125 C 170 105, 155 75, 175 58 C 195 42, 220 55, 240 45 C 260 35, 270 18, 290 20 C 310 22, 315 42, 335 48 C 355 54, 370 42, 385 52 C 400 62, 398 82, 412 90 C 426 98, 445 88, 455 100 C 465 112, 452 135, 460 150 C 468 165, 485 168, 488 185 C 491 202, 475 215, 472 232 C 469 249, 482 265, 476 282 C 470 299, 450 305, 445 322 C 440 339, 452 355, 445 370" />
      <path id="route-fill" class="route-fill"
        d="M 20 340 C 30 300, 15 270, 35 240 C 55 210, 70 230, 80 210 C 90 190, 75 165, 95 145 C 115 125, 140 145, 155 125 C 170 105, 155 75, 175 58 C 195 42, 220 55, 240 45 C 260 35, 270 18, 290 20 C 310 22, 315 42, 335 48 C 355 54, 370 42, 385 52 C 400 62, 398 82, 412 90 C 426 98, 445 88, 455 100 C 465 112, 452 135, 460 150 C 468 165, 485 168, 488 185 C 491 202, 475 215, 472 232 C 469 249, 482 265, 476 282 C 470 299, 450 305, 445 322 C 440 339, 452 355, 445 370"
        style="opacity:0" />
      <!-- start -->
      <circle cx="20" cy="340" r="4" fill="hsl(0,0%,78%)" />
      <text x="20" y="365" text-anchor="middle"
        style="font-family:'Libre Franklin',sans-serif;font-size:18px;font-weight:300;fill:hsl(0,0%,62%)">start</text>
      <!-- progress dot -->
      <circle id="route-dot" class="route-dot" cx="20" cy="340" r="6" style="opacity:0" />
      <!-- finish -->
      <circle cx="445" cy="370" r="4" fill="hsl(0,0%,78%)" />
      <text x="438" y="390" text-anchor="middle"
        style="font-family:'Libre Franklin',sans-serif;font-size:18px;font-weight:300;fill:hsl(0,0%,62%)">finish</text>
    </svg>

    <div class="km-stats">
      <div class="km-number">{{ total_km }}</div>
      <div class="km-goal-label">of {{ goal }} km &mdash; end of 2026</div>
      <div class="km-bar-wrap">
        <div class="km-bar-fill" id="km-bar" style="width:0%"></div>
      </div>
      <div class="km-pct-label">{{ pct }}% &middot; {{ remaining }} km to go</div>
    </div>
  </div>

  <hr class="km-divider">

  <!-- Rides header -->
  <div class="km-rides-header">
    <span class="km-rides-count">{{ rides | size }} {% if rides.size == 1 %}ride{% else %}rides{% endif %} logged</span>
  </div>

  <!-- Ride cards -->
  <div class="km-rides-list">
    {% for ride in rides %}
    <div class="ride-card">
      {% if ride.image %}
      <div class="ride-img-wrap">
        <img class="ride-img" src="{{ ride.image | relative_url }}" alt="{{ ride.route }}">
      </div>
      {% endif %}
      <div class="ride-title">{{ ride.route }}</div>
      <div class="ride-date">
        {% assign d = ride.date | date: "%-d %b %Y" %}{{ d }}
      </div>
      <div class="ride-chips">
        <span class="chip chip-km">{{ ride.km }} km</span>
        <span class="chip">{{ ride.bike }}</span>
      </div>
    </div>
    {% endfor %}
    {% if rides.size == 0 %}
    <p style="font-size:0.875rem;color:hsl(0,0%,55%);padding:32px 0;text-align:center">
      no rides yet.
    </p>
    {% endif %}
  </div>

</div>

<!-- ── Route animation (vanilla JS) ────────────────────────── -->
<script>
(function() {
  var PCT = {{ pct_raw | divided_by: 100.0 }};
  var fill = document.getElementById('route-fill');
  var dot  = document.getElementById('route-dot');
  var bar  = document.getElementById('km-bar');

  if (!fill) return;

  // Measure path length after layout
  requestAnimationFrame(function() {
    var len = fill.getTotalLength();

    // Set up dash
    fill.style.strokeDasharray  = len;
    fill.style.strokeDashoffset = len;
    fill.style.opacity = '1';

    // Animate on next frame so transition fires
    requestAnimationFrame(function() {
      fill.style.strokeDashoffset = len * (1 - PCT);

      // Progress bar
      if (bar) bar.style.width = (PCT * 100) + '%';

      // Moving dot
      if (dot && PCT > 0) {
        var pt = fill.getPointAtLength(len * PCT);
        dot.setAttribute('cx', pt.x);
        dot.setAttribute('cy', pt.y);
        dot.style.opacity = '1';
      }
    });
  });
})();
</script>
