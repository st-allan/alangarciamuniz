---
layout: default
title: 5 wikipedia articles
permalink: /wikipedia/
---

<!--
  _pages/wikipedia.md
  ─────────────────────
  Drop this file into your Jekyll _pages/ folder.
  Articles are driven by _data/articles.yaml — add or edit entries there.
  No JavaScript framework required.
-->

<style>
  *, *::before, *::after { box-sizing: border-box; }

  .wiki-page {
    max-width: 560px;
    margin: 0 auto;
    padding: 0 16px 64px;
    font-family: 'Libre Franklin', -apple-system, sans-serif;
  }

  /* ── Header ── */
  .wiki-heading {
    padding-top: 24px;
    margin-bottom: 0;
  }
  .wiki-heading h1 {
    font-weight: 300;
    font-size: 1rem;
    color: hsl(0,0%,10%);
    margin: 0 0 2px;
  }
  .wiki-heading p {
    font-size: 0.8rem;
    color: hsl(0,0%,45%);
    margin: 0;
  }

  /* ── Counter ── */
  .wiki-counter {
    padding-top: 36px;
    padding-bottom: 16px;
    text-align: center;
  }
  .wiki-number {
    font-weight: 300;
    font-size: 5rem;
    line-height: 1;
    color: hsl(0,0%,10%);
    letter-spacing: -0.03em;
    margin-bottom: 6px;
  }
  .wiki-goal-label {
    font-size: 0.875rem;
    color: hsl(0,0%,40%);
    margin-bottom: 28px;
  }

  /* ── Five dots ── */
  .five-dots {
    display: flex;
    gap: 12px;
    align-items: center;
    justify-content: center;
    padding: 0 0 8px;
  }
  .five-dot {
    width: 14px;
    height: 14px;
    border-radius: 50%;
    border: 1.5px solid hsl(0,0%,72%);
    background: transparent;
  }
  .five-dot.filled      { background: hsl(0,0%,10%); border-color: hsl(0,0%,10%); }
  .five-dot.in-progress { background: transparent;   border-color: hsl(0,0%,10%); }

  /* ── Legend ── */
  .wiki-legend {
    display: flex;
    gap: 20px;
    justify-content: center;
    margin-top: 12px;
  }
  .wiki-legend-item {
    font-size: 0.72rem;
    color: hsl(0,0%,55%);
    display: flex;
    align-items: center;
    gap: 5px;
  }
  .legend-dot {
    display: inline-block;
    width: 8px;
    height: 8px;
    border-radius: 50%;
    flex-shrink: 0;
  }
  .legend-dot-live        { background: hsl(0,0%,10%); }
  .legend-dot-inprogress  { border: 1.5px solid hsl(0,0%,10%); background: transparent; }
  .legend-dot-notstarted  { border: 1.5px solid hsl(0,0%,72%); background: transparent; }

  /* ── Divider ── */
  .wiki-divider {
    border: none;
    height: 1px;
    background: hsl(0,0%,90%);
    margin: 4px 0 24px;
  }

  /* ── Articles count ── */
  .wiki-count {
    font-size: 0.78rem;
    color: hsl(0,0%,55%);
    margin-bottom: 4px;
  }

  /* ── Article cards ── */
  .article-card {
    padding: 20px 0 28px;
    border-bottom: 1px solid hsl(0,0%,92%);
  }
  .article-card:first-child { border-top: 1px solid hsl(0,0%,92%); }

  .article-img {
    width: 100%;
    aspect-ratio: 16 / 7;
    object-fit: cover;
    border-radius: 4px;
    display: block;
    margin-bottom: 14px;
  }

  .article-header {
    display: flex;
    align-items: baseline;
    justify-content: space-between;
    gap: 12px;
    flex-wrap: wrap;
    margin-bottom: 4px;
  }
  .article-title {
    font-weight: 300;
    font-size: 1.05rem;
    color: hsl(0,0%,10%);
    line-height: 1.3;
    text-decoration: none;
  }
  .article-title:hover { opacity: 0.5; }
  .article-date {
    font-size: 0.8rem;
    color: hsl(0,0%,45%);
    margin-bottom: 8px;
  }
  .article-description {
    font-size: 0.875rem;
    color: hsl(0,0%,32%);
    line-height: 1.55;
    font-weight: 300;
    margin: 0 0 10px;
  }

  /* ── Chip ── */
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

  /* ── Status pipeline ── */
  .pipeline {
    display: flex;
    align-items: center;
    margin: 12px 0 0;
  }
  .pipeline-step {
    display: flex;
    align-items: center;
    gap: 6px;
    font-size: 0.72rem;
    letter-spacing: 0.03em;
    color: hsl(0,0%,68%);
    font-family: 'Libre Franklin', sans-serif;
  }
  .pipeline-step.active { color: hsl(0,0%,10%); }
  .pipeline-step.done   { color: hsl(0,0%,42%); }
  .pipeline-dot {
    width: 6px;
    height: 6px;
    border-radius: 50%;
    background: hsl(0,0%,82%);
    flex-shrink: 0;
  }
  .pipeline-dot.active { background: hsl(0,0%,10%); }
  .pipeline-dot.done   { background: hsl(0,0%,10%); }
  .pipeline-line {
    width: 20px;
    height: 1px;
    background: hsl(0,0%,82%);
    flex-shrink: 0;
  }
  .pipeline-line.done { background: hsl(0,0%,40%); }

  @media (max-width: 640px) {
    .wiki-number { font-size: 3.8rem; }
  }
</style>

<!-- ── DATA (driven by _data/articles.yaml) ─────────────────── -->
{% assign articles = site.data.articles %}
{% assign statuses = "idea,researching,draft,submitted,live" | split: "," %}
{% assign goal = 5 %}
{% assign live_count = 0 %}
{% assign inprogress_count = 0 %}
{% for article in articles %}
  {% if article.status == "live" %}
    {% assign live_count = live_count | plus: 1 %}
  {% else %}
    {% assign inprogress_count = inprogress_count | plus: 1 %}
  {% endif %}
{% endfor %}

<div class="wiki-page">

  <!-- Heading -->
  <div class="wiki-heading">
    <h1>5 wikipedia articles</h1>
    <p>a goal to author 5 new wikipedia pages before the end of 2026.</p>
  </div>

  <!-- Counter -->
  <div class="wiki-counter">
    <div class="wiki-number">{{ live_count }}</div>
    <div class="wiki-goal-label">of {{ goal }} articles live &mdash; end of 2026</div>

    <!-- Five dots -->
    <div class="five-dots">
      {% for i in (1..goal) %}
        {% if i <= live_count %}
          <div class="five-dot filled"></div>
        {% elsif i <= live_count | plus: inprogress_count %}
          <div class="five-dot in-progress"></div>
        {% else %}
          <div class="five-dot"></div>
        {% endif %}
      {% endfor %}
    </div>

    <!-- Legend -->
    <div class="wiki-legend">
      <span class="wiki-legend-item">
        <span class="legend-dot legend-dot-live"></span>live
      </span>
      <span class="wiki-legend-item">
        <span class="legend-dot legend-dot-inprogress"></span>in progress
      </span>
      <span class="wiki-legend-item">
        <span class="legend-dot legend-dot-notstarted"></span>not started
      </span>
    </div>
  </div>

  <hr class="wiki-divider">

  <!-- Count -->
  <div class="wiki-count">
    {{ articles | size }} {% if articles.size == 1 %}article{% else %}articles{% endif %} tracked
  </div>

  <!-- Article cards — live sorted last -->
  {% assign in_progress_articles = articles | where_exp: "a", "a.status != 'live'" | sort: "started_date" | reverse %}
  {% assign live_articles = articles | where: "status", "live" | sort: "live_date" | reverse %}

  <div class="wiki-articles-list">
    {% for article in in_progress_articles %}
    <div class="article-card">
      {% if article.image %}
      <img class="article-img" src="{{ article.image | relative_url }}" alt="{{ article.title }}">
      {% endif %}

      <div class="article-header">
        <span class="article-title">{{ article.title }}</span>
        <span class="chip">{{ article.category }}</span>
      </div>

      <div class="article-date">
        started {{ article.started_date | date: "%-d %b %Y" }}
      </div>

      {% if article.description %}
      <p class="article-description">{{ article.description }}</p>
      {% endif %}

      <!-- Pipeline -->
      <div class="pipeline">
        {% for status in statuses %}
          {% assign s_idx = forloop.index0 %}
          {% assign a_idx = statuses | index_of: article.status %}
          {% if forloop.index0 > 0 %}
            {% if s_idx <= a_idx %}
              <div class="pipeline-line done"></div>
            {% else %}
              <div class="pipeline-line"></div>
            {% endif %}
          {% endif %}
          {% if s_idx < a_idx %}
            <div class="pipeline-step done"><div class="pipeline-dot done"></div><span>{{ status }}</span></div>
          {% elsif s_idx == a_idx %}
            <div class="pipeline-step active"><div class="pipeline-dot active"></div><span>{{ status }}</span></div>
          {% else %}
            <div class="pipeline-step"><div class="pipeline-dot"></div><span>{{ status }}</span></div>
          {% endif %}
        {% endfor %}
      </div>
    </div>
    {% endfor %}

    {% for article in live_articles %}
    <div class="article-card">
      {% if article.image %}
      <img class="article-img" src="{{ article.image | relative_url }}" alt="{{ article.title }}">
      {% endif %}

      <div class="article-header">
        {% if article.url %}
        <a class="article-title" href="{{ article.url }}" target="_blank" rel="noopener noreferrer">{{ article.title }}</a>
        {% else %}
        <span class="article-title">{{ article.title }}</span>
        {% endif %}
        <span class="chip">{{ article.category }}</span>
      </div>

      <div class="article-date">
        published {{ article.live_date | date: "%-d %b %Y" }}
      </div>

      {% if article.description %}
      <p class="article-description">{{ article.description }}</p>
      {% endif %}

      <!-- Pipeline — all steps done -->
      <div class="pipeline">
        {% for status in statuses %}
          {% if forloop.index0 > 0 %}
            <div class="pipeline-line done"></div>
          {% endif %}
          {% if status == "live" %}
            <div class="pipeline-step active"><div class="pipeline-dot active"></div><span>{{ status }}</span></div>
          {% else %}
            <div class="pipeline-step done"><div class="pipeline-dot done"></div><span>{{ status }}</span></div>
          {% endif %}
        {% endfor %}
      </div>
    </div>
    {% endfor %}

    {% if articles.size == 0 %}
    <p style="font-size:0.875rem;color:hsl(0,0%,55%);padding:32px 0;text-align:center">
      no articles yet.
    </p>
    {% endif %}
  </div>

</div>
