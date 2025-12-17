---
layout: default
title: "Faith Frontier"
hide_hero: true
show_breadcrumbs: false
description: "Faith Frontier Ecclesiastical Trust builds a faith-rooted public trust for New Jersey residents, focusing on due process, equity, and restoration."
---

<!-- markdownlint-disable MD033 -->

<!--
  Homepage styling refactor: stone/ink/emerald design system
  - Adds tokens (:root) for colors, spacing, radius, shadows
  - Normalizes typography, containers, sections, cards, buttons
  - Fixes prior CSS collision (stray styles outside of <style>)
  - Ensures dark text on light backgrounds; emerald as restrained accent
-->
<style>
  :root {
    /* Colors */
    --stone-50: rgba(220, 217, 210, 1);   /* lighter wash */
    --stone-100: rgba(200, 197, 190, 1);  /* base background (limestone) */
    --stone-200: rgba(189, 182, 170, 1);  /* borders/dividers */
    --ink-900: rgba(28, 27, 25, 1);       /* primary text */
    --ink-700: rgba(58, 56, 52, 1);       /* secondary text */
    --emerald-600: rgba(16, 92, 74, 1);   /* brand accent */
    --shadow-soft: rgba(120, 116, 108, 0.28);
    --shadow-deep: rgba(92, 88, 80, 0.35);

    /* Radius / Spacing / Layout */
    --radius-lg: 16px;
    --radius-xl: 22px;
    --container: 1100px;
    --section-pad-y: clamp(40px, 6vw, 84px);
    --card-pad: clamp(18px, 2vw, 26px);

    /* Derived */
    --gutter: clamp(18px, 3vw, 32px);
  }

  html { box-sizing: border-box; font-family: 'Inter', system-ui, -apple-system, Segoe UI, Roboto, 'Helvetica Neue', Arial, sans-serif; }
  *, *::before, *::after { box-sizing: inherit; }

  body {
    margin: 0;
    line-height: 1.6;
    -webkit-font-smoothing: antialiased;
    text-rendering: optimizeLegibility;
    background: var(--stone-100);
    color: var(--ink-900);
  }

  a {
    color: var(--emerald-600);
    text-decoration: underline;
    text-underline-offset: 2px;
    text-decoration-thickness: 1px;
  }
  a:hover, a:focus { color: rgb(15, 106, 85); text-decoration-thickness: 2px; }

  .container {
    max-width: var(--container);
    padding-inline: clamp(16px, 4vw, 28px);
    margin: 0 auto;
    width: 100%;
  }

  .section { padding-block: var(--section-pad-y); }

  .section-divider {
    margin: 0;
    height: 1px;
    background: var(--stone-200);
    border: none;
  }

  h1, h2, h3 {
    color: var(--ink-900);
    font-weight: 700;
    margin: 0 0 0.35em;
    letter-spacing: -0.01em;
  }
  h1 { font-size: clamp(2.2rem, 5vw, 3.5rem); line-height: 1.08; }
  h2 { font-size: clamp(1.5rem, 3vw, 2.2rem); }
  h3 { font-size: clamp(1.15rem, 2vw, 1.35rem); }
  p, li { color: var(--ink-700); font-size: 1.08rem; }

  img { max-width: 100%; height: auto; display: block; }

  /* Hero layout */
  .hero-grid {
    display: grid;
    grid-template-columns: 1.5fr minmax(340px, 1fr);
    gap: var(--gutter);
    align-items: start;
    align-content: start;
    min-height: 60vh;
  }
  .hero-main { min-width: 0; display: flex; flex-direction: column; justify-content: center; gap: 1.25rem; }
  .hero-eyebrow { color: var(--emerald-600); font-size: 0.9rem; letter-spacing: 0.08em; text-transform: uppercase; margin: 0; }
  .hero-lead { max-width: 72ch; }

  /* Side panel (card) */
  .hero-side-panel {
    background: var(--stone-50);
    color: var(--ink-900);
    display: flex;
    flex-direction: column;
    gap: clamp(1rem, 2vw, 2rem);
    align-items: flex-start;
    border-radius: var(--radius-lg);
    border: 1px solid var(--stone-200);
    box-shadow: 0 10px 30px var(--shadow-soft);
    padding: calc(var(--card-pad) + 6px) var(--card-pad);
    margin-top: 0;
    min-width: 320px;
    max-width: 480px;
  }
  .hero-badge { font-weight: 600; color: var(--ink-900); }
  .hero-scripture .dv-ref { color: var(--emerald-600); font-weight: 600; margin-left: 0.35rem; }
  .hero-scripture .dv-note { display: block; font-size: 0.9rem; color: var(--ink-700); margin-top: 0.25rem; }

  /* Stats in side panel */
  .hero-panel__stat { display: flex; flex-direction: column; gap: 0.15rem; }
  .hero-panel__number { font-weight: 700; color: var(--ink-900); }
  .hero-panel__label { color: var(--ink-700); }

  /* Highlights (cards) */
  .hero-highlights {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
    gap: clamp(1rem, 2vw, 2rem);
    margin-top: 1.25rem;
  }
  .hero-highlight {
    background: var(--stone-50);
    color: var(--ink-900);
    padding: var(--card-pad);
    border-radius: var(--radius-lg);
    border: 1px solid var(--stone-200);
    box-shadow: 0 10px 30px var(--shadow-soft);
    min-height: 180px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    transition: transform 0.15s ease, box-shadow 0.15s ease;
  }
  .hero-highlight:hover { transform: translateY(-2px); box-shadow: 0 12px 34px var(--shadow-soft); }
  .hero-highlight__label { color: var(--emerald-600); font-size: 0.85rem; font-weight: 700; letter-spacing: 0.12em; text-transform: uppercase; margin-bottom: 0.2rem; }

  /* Actions / Buttons */
  .hero-actions { display: flex; flex-wrap: wrap; gap: 0.9rem; margin-top: 1.5rem; justify-content: center; }
  .btn { appearance: none; cursor: pointer; min-width: 140px; padding: 0.7rem 1.2rem; font-size: 1.05rem; border-radius: 10px; font-weight: 700; border: 1px solid transparent; transition: box-shadow 0.2s ease, transform 0.08s ease; }
  .btn-main { background: var(--emerald-600); color: #ffffff; border-color: var(--emerald-600); box-shadow: 0 4px 14px var(--shadow-soft); }
  .btn-ghost { background: transparent; color: var(--emerald-600); border-color: var(--emerald-600); box-shadow: none; }
  .btn:hover, .btn:focus { box-shadow: 0 6px 18px var(--shadow-soft); }
  .btn:active { transform: translateY(1px); }
  .btn:focus-visible { outline: 3px solid color-mix(in oklab, var(--emerald-600), white 35%); outline-offset: 2px; }

  @media (max-width: 900px) {
    .hero-grid { grid-template-columns: 1fr; }
    .hero-side-panel { order: 2; width: 100%; max-width: none; min-width: 0; }
    .hero-actions .btn { flex: 1 1 45%; }
    .hero-highlights { grid-template-columns: 1fr; }
  }

  @media (prefers-reduced-motion: reduce) {
    * { animation-duration: 0.001ms !important; transition-duration: 0.001ms !important; }
  }
</style>

<section class="section hero hero--home hero-home--revival">
  <div class="container hero-grid">
    <div class="hero-main">
      <p class="hero-eyebrow">Faith Frontier Ecclesiastical Trust</p>
      <h1>
        Faith-informed transparency for New Jersey neighbors
      </h1>
      <p class="hero-lead">
        Faith Frontier is a Christian-informed public trust that documents public records, teaches civic literacy, and stewards property initiatives with humility and accountability. We operate within the U.S. Constitution and New Jersey law, treating faith as a guide to conscience—not as extrajudicial authority—so residents can see the record, verify facts, and engage officials with confidence.
      </p>
      <div class="hero-highlights">
        <article class="hero-highlight">
          <span class="hero-highlight__label">Due process clarity</span>
          <p>Plain-language case journals track what has happened in courts, agencies, housing, and everyday disputes so people can follow the record, seek counsel, and rely on lawful procedures.</p>
        </article>
        <article class="hero-highlight">
          <span class="hero-highlight__label">Stewardship with boundaries</span>
          <p>Housing and land efforts are pursued lawfully, respecting zoning, licensing, tax rules, and corporate separateness. Stewardship means caring for neighbors while honoring compliance and proper oversight.</p>
        </article>
        <article class="hero-highlight">
          <span class="hero-highlight__label">Accountability</span>
          <p>Shared documentation, transparent records, and neutral summaries help landlords, contractors, agencies, and neighbors operate with dignity and fairness while inviting lawful oversight.</p>
        </article>
        <article class="hero-highlight">
          <span class="hero-highlight__label">Faith-shaped conscience</span>
          <p>Christian principles—truthfulness, humility, repentance, service—inform conduct and communication. They do not replace legal authority or create parallel courts.</p>
        </article>
      </div>
      <div class="hero-actions hero-actions--centered">
        <a class="btn btn-main" href="{{ '/about/' | relative_url }}">Explore Our Mission</a>
        <a class="btn btn-ghost" href="{{ '/cases/' | relative_url }}">Learn Your Rights</a>
        <a class="btn btn-ghost" href="{{ '/manifesto/' | relative_url }}">Read the Manifesto</a>
      </div>
    </div>

    <div class="hero-side-panel">
      <div class="hero-brand-visual">
        <!-- Placeholder for brand image or motif -->
        <!-- Preload hero visual for faster first-paint, use modern image attributes to reduce layout shift -->
        <link rel="preload" href="/assets/img/faithfrontier-mark.svg" as="image">
        <img src="/assets/img/faithfrontier-mark.svg" alt="Faith Frontier Crest" width="360" height="360" decoding="async" fetchpriority="high" style="max-width: 100%; height: auto; margin-bottom: 1.5rem;" />
      </div>
      <p class="hero-badge">Transparent, lawful, accountable</p>
      <!-- Daily Verse placed in side panel -->
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
          </div>
    </div>
</section>

<!--
  Before/After Notes
  - Removed stray CSS that was outside of a <style> block and conflicting with layout.
  - Introduced tokens (:root) for stone/ink/emerald palette, spacing, radius, shadows.
  - Standardized cards (side panel + highlights): stone-50 bg, stone-200 border, radius-lg, soft shadow.
  - Normalized typography, container width, section padding; ensured all text remains dark.
  - Buttons now use restrained emerald fills/borders with clear focus outlines.
  - Mobile grid and spacing audited for stability; no overflow or clipping observed.

  Style Guide Snippet
  Colors: --stone-50, --stone-100, --stone-200, --ink-900, --ink-700, --emerald-600
  Shadows: --shadow-soft, --shadow-deep
  Radius: --radius-lg, --radius-xl
  Spacing: --section-pad-y, --card-pad
  Layout: --container, --gutter
  Usage: body uses stone-100; cards use stone-50 + stone-200 border; text ink-900/700; accents emerald-600.
-->
