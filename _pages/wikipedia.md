---
layout: default
title: 5 wikipedia articles
permalink: /wikipedia/
---

<!--
  _pages/wikipedia.md
  ──────────────────────────────────────────────────────────────
  Drop this file into your Jekyll _pages/ folder.
  Articles are injected from _data/articles.yaml via Jekyll at
  build time — no runtime editing needed.

  Requires React + Babel CDN scripts. Simplest approach: add
  these three lines to _includes/head.html (or equivalent):

  <script src="https://unpkg.com/react@18.3.1/umd/react.production.min.js" crossorigin></script>
  <script src="https://unpkg.com/react-dom@18.3.1/umd/react-dom.production.min.js" crossorigin></script>
  <script src="https://unpkg.com/@babel/standalone@7.29.0/babel.min.js"></script>

  Or scope them to this page only by checking
  {{ page.title == "5 wikipedia articles" }} in your layout.
-->

<style>
  *, *::before, *::after { box-sizing: border-box; }

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

  .five-dots {
    display: flex;
    gap: 12px;
    align-items: center;
    justify-content: center;
    padding: 32px 0 8px;
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
</style>

<!-- Jekyll injects article data at build time -->
<div id="wiki-root"></div>
<script>
  window.__JEKYLL_ARTICLES__ = [
    {% for article in site.data.articles %}
    {
      id: {{ forloop.index }},
      title: {{ article.title | jsonify }},
      description: {{ article.description | default: '' | jsonify }},
      category: {{ article.category | jsonify }},
      status: {{ article.status | jsonify }},
      startedDate: "{{ article.started_date }}",
      liveDate: "{{ article.live_date | default: '' }}",
      url: "{{ article.url | default: '' }}",
      image: "{{ article.image | default: '' }}"
    }{% unless forloop.last %},{% endunless %}
    {% endfor %}
  ];
</script>

<script src="https://unpkg.com/react@18.3.1/umd/react.production.min.js" crossorigin="anonymous"></script>
<script src="https://unpkg.com/react-dom@18.3.1/umd/react-dom.production.min.js" crossorigin="anonymous"></script>
<script src="https://unpkg.com/@babel/standalone@7.29.0/babel.min.js"></script>
<script type="text/babel">

const GOAL     = 5;
const DEADLINE = 'end of 2026';
const STATUSES = ['idea', 'researching', 'draft', 'submitted', 'live'];

const formatDate = (iso) => {
  if (!iso) return '';
  const [y, m, d] = iso.split('-');
  const months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
  return `${parseInt(d)} ${months[parseInt(m)-1]} ${y}`;
};

// ── Five-dot counter ──────────────────────────────────────────
const FiveDotsCounter = ({ articles, goal }) => {
  const live   = articles.filter(a => a.status === 'live').length;
  const active = articles.filter(a => a.status !== 'live').length;

  return (
    <div style={{ paddingTop: '36px', paddingBottom: '16px', textAlign: 'center' }}>
      <div style={{ fontWeight: 300, fontSize: '5rem', lineHeight: 1, color: 'hsl(0,0%,10%)', letterSpacing: '-0.03em', marginBottom: '6px' }}>
        {live}
      </div>
      <div style={{ fontSize: '0.875rem', color: 'hsl(0,0%,40%)', marginBottom: '28px' }}>
        of {goal} articles live &mdash; {DEADLINE}
      </div>

      <div className="five-dots">
        {Array.from({ length: goal }).map((_, i) => {
          let cls = 'five-dot';
          if (i < live) cls += ' filled';
          else if (i < live + active) cls += ' in-progress';
          return <div key={i} className={cls}></div>;
        })}
      </div>

      <div style={{ display: 'flex', gap: '20px', justifyContent: 'center', marginTop: '12px' }}>
        {[
          { label: 'live',        dot: { background: 'hsl(0,0%,10%)' } },
          { label: 'in progress', dot: { border: '1.5px solid hsl(0,0%,10%)', background: 'transparent' } },
          { label: 'not started', dot: { border: '1.5px solid hsl(0,0%,72%)', background: 'transparent' } },
        ].map(({ label, dot }) => (
          <span key={label} style={{ fontSize: '0.72rem', color: 'hsl(0,0%,55%)', display: 'flex', alignItems: 'center', gap: '5px' }}>
            <span style={{ display: 'inline-block', width: '8px', height: '8px', borderRadius: '50%', ...dot }}></span>
            {label}
          </span>
        ))}
      </div>
    </div>
  );
};

// ── Status Pipeline ───────────────────────────────────────────
const StatusPipeline = ({ status }) => {
  const currentIdx = STATUSES.indexOf(status);
  return (
    <div className="pipeline">
      {STATUSES.map((s, i) => {
        const isDone   = i < currentIdx;
        const isActive = i === currentIdx;
        return (
          <React.Fragment key={s}>
            {i > 0 && <div className={`pipeline-line${isDone ? ' done' : ''}`}></div>}
            <div className={`pipeline-step${isDone ? ' done' : ''}${isActive ? ' active' : ''}`}>
              <div className={`pipeline-dot${isDone ? ' done' : ''}${isActive ? ' active' : ''}`}></div>
              <span>{s}</span>
            </div>
          </React.Fragment>
        );
      })}
    </div>
  );
};

// ── Article Card ──────────────────────────────────────────────
const ArticleCard = ({ article }) => {
  const isLive = article.status === 'live';
  return (
    <div className="article-card">
      {article.image && (
        <img src={article.image} alt={article.title} className="article-img" />
      )}

      <div style={{ display: 'flex', alignItems: 'baseline', justifyContent: 'space-between', gap: '12px', marginBottom: '4px', flexWrap: 'wrap' }}>
        <span style={{ fontWeight: 300, fontSize: '1.05rem', color: 'hsl(0,0%,10%)', lineHeight: 1.3 }}>
          {isLive && article.url
            ? <a href={article.url} target="_blank" rel="noopener noreferrer" style={{ color: 'hsl(0,0%,10%)', textDecoration: 'none' }}>{article.title}</a>
            : article.title}
        </span>
        <span className="chip">{article.category}</span>
      </div>

      <div style={{ fontSize: '0.8rem', color: 'hsl(0,0%,45%)', marginBottom: '8px' }}>
        {isLive && article.liveDate
          ? `published ${formatDate(article.liveDate)}`
          : `started ${formatDate(article.startedDate)}`}
      </div>

      {article.description && (
        <p style={{ fontSize: '0.875rem', color: 'hsl(0,0%,32%)', margin: '0 0 10px', lineHeight: 1.55, fontWeight: 300 }}>
          {article.description}
        </p>
      )}

      <StatusPipeline status={article.status} />
    </div>
  );
};

// ── Page ──────────────────────────────────────────────────────
const WikiPage = () => {
  const articles = window.__JEKYLL_ARTICLES__ || [];

  const sorted = [...articles].sort((a, b) => {
    if (a.status === 'live' && b.status !== 'live') return 1;
    if (a.status !== 'live' && b.status === 'live') return -1;
    return b.startedDate.localeCompare(a.startedDate);
  });

  return (
    <main style={{ maxWidth: '560px', margin: '0 auto', padding: '0 16px 64px', fontFamily: "'Libre Franklin', sans-serif" }}>
      <div style={{ paddingTop: '24px' }}>
        <h1 style={{ fontWeight: 300, fontSize: '1rem', color: 'hsl(0,0%,10%)', margin: '0 0 2px' }}>5 wikipedia articles</h1>
        <p style={{ fontSize: '0.8rem', color: 'hsl(0,0%,45%)', margin: 0 }}>
          a goal to author 5 new wikipedia pages before the {DEADLINE}.
        </p>
      </div>

      <FiveDotsCounter articles={articles} goal={GOAL} />

      <hr style={{ border: 'none', height: '1px', background: 'hsl(0,0%,90%)', margin: '4px 0 24px' }} />

      <div style={{ marginBottom: '4px' }}>
        <span style={{ fontSize: '0.78rem', color: 'hsl(0,0%,55%)' }}>
          {articles.length} {articles.length === 1 ? 'article' : 'articles'} tracked
        </span>
      </div>

      <div>
        {sorted.map(article => <ArticleCard key={article.id} article={article} />)}
      </div>
    </main>
  );
};

ReactDOM.createRoot(document.getElementById('wiki-root')).render(<WikiPage />);
</script>
