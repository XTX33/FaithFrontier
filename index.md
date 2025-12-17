---
layout: default
title: "Faith Frontier"
hide_hero: true
show_breadcrumbs: false
description: "Faith Frontier Ecclesiastical Trust builds a faith-rooted public trust for New Jersey residents, focusing on due process, equity, and restoration."
stylesheet: /assets/css/home.css
---

<!-- markdownlint-disable MD033 -->

<style>
  /* ==========================
     Faith Frontier Home (scoped)
     Prevents collisions with global theme CSS
  ========================== */
  .ff-home {
    --stone-50: rgba(220, 217, 210, 1);
    --stone-100: rgba(200, 197, 190, 1);
    --stone-200: rgba(189, 182, 170, 1);
    --ink-900: rgba(28, 27, 25, 1);
    --ink-700: rgba(58, 56, 52, 1);
    --emerald-600: rgba(16, 92, 74, 1);
    --shadow-soft: rgba(120, 116, 108, 0.28);

    --radius-lg: 16px;
    --container: 1100px;
    --section-pad-y: clamp(40px, 6vw, 84px);
    --card-pad: clamp(18px, 2vw, 26px);
    --gutter: clamp(18px, 3vw, 32px);

    background: var(--stone-100);
    color: var(--ink-900);
  }

  .ff-home a {
    color: var(--emerald-600);
    text-decoration: underline;
    text-underline-offset: 2px;
    text-decoration-thickness: 1px;
  }
  .ff-home a:hover,
  .ff-home a:focus { text-decoration-thickness: 2px; }

  .ff-home .container {
    max-width: var(--container);
    padding-inline: clamp(16px, 4vw, 28px);
    margin: 0 auto;
    width: 100%;
  }

  .ff-home .section { padding-block: var(--section-pad-y); }

  .ff-home h1, .ff-home h2, .ff-home h3 {
    color: var(--ink-900);
    font-weight: 800;
    margin: 0 0 0.35em;
    letter-spacing: -0.01em;
  }
  .ff-home h1 { font-size: clamp(2.2rem, 5vw, 3.5rem); line-height: 1.06; }
  .ff-home h2 { font-size: clamp(1.5rem, 3vw, 2.2rem); }
  .ff-home h3 { font-size: clamp(1.15rem, 2vw, 1.35rem); }

  .ff-home p, .ff-home li { color: var(--ink-700); font-size: 1.06rem; }
  .ff-home img { max-width: 100%; height: auto; display: block; }

  /* Hero layout */
  .ff-home .hero-grid {
    display: grid;
    grid-template-columns: 1.55fr minmax(340px, 1fr);
    gap: var(--gutter);
    align-items: start;
    align-content: start;
    min-height: 60vh;
  }

  .ff-home .hero-main {
    min-width: 0;
    display: flex;
    flex-direction: column;
    justify-content: center;
    gap: 1.25rem;
  }

  .ff-home .hero-eyebrow {
    color: var(--emerald-600);
    font-size: 0.9rem;
    letter-spacing: 0.10em;
    text-transform: uppercase;
    margin: 0;
    font-weight: 800;
  }

  .ff-home .hero-lead { max-width: 75ch; }

  /* Side panel */
  .ff-home .hero-side-panel {
    background: rgba(220, 217, 210, 0.92);
    color: var(--ink-900);
    display: flex;
    flex-direction: column;
    gap: 1.1rem;
    align-items: flex-start;
    border-radius: var(--radius-lg);
    border: 1px solid var(--stone-200);
    box-shadow: 0 10px 30px var(--shadow-soft);
    padding: calc(var(--card-pad) + 6px) var(--card-pad);
    min-width: 320px;
    max-width: 520px;
  }

  .ff-home .hero-brand-visual {
    width: 100%;
    display: grid;
    place-items: center;
    padding: 0.25rem 0 0.75rem;
  }

  .ff-home .hero-badge {
    font-weight: 900;
    letter-spacing: 0.06em;
    text-transform: uppercase;
    font-size: 0.82rem;
    color: var(--ink-900);
    opacity: 0.9;
    margin: 0;
  }

  .ff-home .hero-scripture {
    width: 100%;
    border-left: 4px solid var(--emerald-600);
    padding: 0.75rem 0.85rem;
    background: rgba(200, 197, 190, 0.55);
    border-radius: 12px;
  }
  .ff-home .hero-scripture .dv-text { display: block; color: var(--ink-900); font-weight: 650; }
  .ff-home .hero-scripture .dv-ref { display: inline-block; margin-top: 0.35rem; color: var(--emerald-600); font-weight: 800; }
  .ff-home .hero-scripture .dv-note { display: block; font-size: 0.9rem; color: var(--ink-700); margin-top: 0.35rem; }

  .ff-home .hero-panel__stat {
    width: 100%;
    display: grid;
    gap: 0.2rem;
    padding-top: 0.2rem;
  }
  .ff-home .hero-panel__number { font-weight: 900; color: var(--ink-900); }
  .ff-home .hero-panel__label { color: var(--ink-700); }

  /* Highlights */
  .ff-home .hero-highlights {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
    gap: clamp(1rem, 2vw, 2rem);
    margin-top: 1.25rem;
  }

  .ff-home .hero-highlight {
    background: rgba(220, 217, 210, 0.92);
    padding: var(--card-pad);
    border-radius: var(--radius-lg);
    border: 1px solid var(--stone-200);
    box-shadow: 0 10px 30px var(--shadow-soft);
    min-height: 180px;
  }

  .ff-home .hero-highlight__label {
    color: var(--emerald-600);
    font-size: 0.82rem;
    font-weight: 900;
    letter-spacing: 0.12em;
    text-transform: uppercase;
    margin-bottom: 0.35rem;
    display: inline-block;
  }

  /* Actions */
  .ff-home .hero-actions {
    display: flex;
    flex-wrap: wrap;
    gap: 0.9rem;
    margin-top: 1.5rem;
    justify-content: center;
  }

  .ff-home .btn {
    appearance: none;
    cursor: pointer;
    min-width: 150px;
    padding: 0.75rem 1.15rem;
    font-size: 1.02rem;
    border-radius: 10px;
    font-weight: 850;
    border: 1px solid transparent;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
  }

  .ff-home .btn-main {
    background: var(--emerald-600);
    color: #fff;
    border-color: var(--emerald-600);
    box-shadow: 0 6px 18px var(--shadow-soft);
  }

  .ff-home .btn-ghost {
    background: transparent;
    color: var(--emerald-600);
    border-color: var(--emerald-600);
  }

  .ff-home .btn:focus-visible {
    outline: 3px solid rgba(16, 92, 74, 0.35);
    outline-offset: 2px;
  }

  @media (max-width: 900px) {
    .ff-home .hero-grid { grid-template-columns: 1fr; }
    .ff-home .hero-side-panel { order: 2; width: 100%; max-width: none; min-width: 0; }
    .ff-home .hero-actions .btn { flex: 1 1 45%; }
    .ff-home .hero-highlights { grid-template-columns: 1fr; }
  }
</style>

<div class="ff-home">
  <section class="section hero hero--home hero-home--revival">
    <div class="container hero-grid">
      <div class="hero-main">
        <p class="hero-eyebrow">Faith Frontier Ecclesiastical Trust</p>
        <h1>Faith-informed transparency for New Jersey neighbors</h1>

        <p class="hero-lead">
          Faith Frontier is a Christian-informed public trust that documents public records, teaches civic literacy,
          and stewards property initiatives with humility and accountability. We operate within the U.S. Constitution
          and New Jersey law, treating faith as a guide to conscience—not as extrajudicial authority—so residents can
          see the record, verify facts, and engage officials with confidence.
        </p>

        <div class="hero-highlights">
          <article class="hero-highlight">
            <span class="hero-highlight__label">Due process clarity</span>
            <p>Plain-language case journals help people follow the record, seek counsel, and rely on lawful procedures—without distortion or sensationalism.</p>
          </article>

          <article class="hero-highlight">
            <span class="hero-highlight__label">Stewardship with boundaries</span>
            <p>Housing and land efforts are pursued lawfully, respecting zoning, licensing, tax rules, and entity separateness. Stewardship means care with compliance.</p>
          </article>

          <article class="hero-highlight">
            <span class="hero-highlight__label">Accountability</span>
            <p>Transparent documentation and neutral summaries support dignity and fairness while inviting lawful oversight and correction when needed.</p>
          </article>

          <article class="hero-highlight">
            <span class="hero-highlight__label">Faith-shaped conscience</span>
            <p>Christian principles—truth, humility, repentance, service—govern conduct. They do not replace courts, agencies, statutes, or procedure.</p>
          </article>
        </div>

        <div class="hero-actions hero-actions--centered">
          <a class="btn btn-main" href="{{ '/about/' | relative_url }}">Explore Our Mission</a>
          <a class="btn btn-ghost" href="{{ '/cases/' | relative_url }}">Cases & Records</a>
          <a class="btn btn-ghost" href="{{ '/manifesto/' | relative_url }}">Read the Manifesto</a>
        </div>
      </div>

      <aside class="hero-side-panel" aria-label="Daily verse and quick links">
        <div class="hero-brand-visual">
          <img
            src="/assets/img/faithfrontier-mark.svg"
            alt="Faith Frontier Crest"
            width="360"
            height="360"
            decoding="async"
            fetchpriority="high"
          />
        </div>

        <p class="hero-badge">Transparent • Lawful • Accountable</p>

        <!-- Keep the same ID so your existing daily-verse script continues to work -->
        <div id="daily-verse" class="hero-scripture">
          <span class="dv-text">Loading daily verse…</span>
          <span class="dv-ref"></span>
          <span class="dv-note">Updated daily from Atlantic County, New Jersey</span>
        </div>

        <div class="hero-panel__stat">
          <span class="hero-panel__number">Open record</span>
          <span class="hero-panel__label">Case archives with source links</span>
        </div>

        <div class="hero-panel__stat">
          <span class="hero-panel__number">Guides</span>
          <span class="hero-panel__label">Plain-language civic primers</span>
        </div>
      </aside>
    </div>
  </section>
</div>
