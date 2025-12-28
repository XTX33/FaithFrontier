---
layout: default
title: "Faith Frontier"
hide_hero: true
show_breadcrumbs: false
description: "Faith Frontier Ecclesiastical Trust is a faith-rooted stewardship trust in New Jersey focused on transparent recordkeeping, civic literacy, and lawful community restoration."
stylesheet: /assets/css/home.css

hero_eyebrow: "Faith Frontier Ecclesiastical Trust"
hero_eyebrow_icon: true
hero_title: "Faith-informed transparency for New Jersey neighbors"
hero_summary: "A Christian-informed stewardship trust that publishes public records, teaches civic literacy, and supports lawful property initiatives with humility, due process, and accountability."
hero_primary_url: "/stewardship/"
hero_primary_label: "Begin the Stewardship Pathway"
hero_secondary_url: "/opra/"
hero_secondary_label: "OPRA Records"

hero_highlights:
  - label: "Due Process & Clarity"
    text: "Plain-language documentation helps residents understand legal procedures, seek counsel, and rely on lawful processes with dignity."
  - label: "Lawful Stewardship"
    text: "Property initiatives respect zoning, licensing, and tax compliance—pursuing housing solutions within legal boundaries."
  - label: "Transparent Accountability"
    text: "Every action is documented openly, inviting oversight and correction while honoring both faith principles and civic obligations."
---

<!-- markdownlint-disable MD033 -->

{% include premium-hero.html %}

<section class="home-overview">
  <!-- Center-aligned brand -->
  <a
    class="premium-brand site-logo js-site-logo"
    href="{{ '/' | relative_url }}"
    aria-label="Faith Frontier Ecclesiastical Trust home"
  >
    <div class="premium-brand__logo">
      <img
        src="{{ '/assets/img/faithfrontier-mark.svg' | relative_url }}"
        alt=""
        width="48"
        height="48"
        class="premium-brand__mark"
        aria-hidden="true"
      />
      <span class="premium-brand__wordmark">
        {% include logo-faithfrontier-header.svg %}
      </span>
    </div>
  </a>
<div class="cta-row text-center">
  <a class="btn btn-primary" href="/stewardship/">Explore the Stewardship Pathway</a>
  <a class="btn btn-ghost" href="/programs/emergency-housing/">Emergency Housing</a>
  <a class="btn btn-ghost" href="/manifesto/">Read the Manifesto</a>
</div>

<div class="home-cards text-center">
  <article class="home-card">
    <h3 class="h5">Begin with public records</h3>
    <p class="small">
      Access OPRA administrative records and timelines, with links to official public tracking where available.
    </p>
    <a class="btn btn-ghost btn--sm" href="/opra/">View OPRA index →</a>
  </article>
{% include featured-essays.html %}
  <article class="home-card">
    <h3 class="h5">Navigate cases and filings</h3>
    <p class="small">
      A structured case library for record navigation. Materials are indexed for clarity and do not replace filed pleadings.
    </p>
    <a class="btn btn-ghost btn--sm" href="/cases/">Browse case library →</a>
  </article>

  <article class="home-card">
    <h3 class="h5">Learn the process</h3>
    <p class="small">
      Civic literacy resources covering terminology, timelines, and practical procedural context.
    </p>
    <a class="btn btn-ghost btn--sm" href="/stewardship-resources/">Stewardship resources →</a>
  </article>
</div>

<hr />

<div class="home-boundaries text-center">
  <p class="section-eyebrow">Boundaries</p>
  <h3 class="section-heading h4">What this organization is—and is not</h3>
  <ul class="bullets bullets--centered">
    <li>
      <strong>Yes:</strong> transparent documentation, public-records indexing, and practical constitutional initiatives.
    </li>
    <li>
      <strong>Yes:</strong> lawful stewardship efforts pursued with regulatory and ethical compliance.
    </li>
    <li>
      <strong>No:</strong> legal representation, legal advice, or guidance intended to evade oversight.
    </li>
    <li>
      <strong>No:</strong> unverified claims presented as fact; corrections are logged when identified.
    </li>
  </ul>
</div>
<style>
.text-center {
  text-align: center;
}

.bullets--centered {
  display: inline-block;
  text-align: left;
}
</style>

  <hr />

  <!-- Enhanced Daily Verse & Biblical Resources Sanctuary -->
  <link rel="stylesheet" href="{{ '/assets/css/components/daily-verse-sanctuary.css' | relative_url }}">
  {% include daily-verse-enhanced.html %}

  <hr />

  <div class="cta-row cta-row--split">
    <a class="btn btn-primary" href="/contact/">Contact / record access</a>
    <a class="btn btn-ghost" href="/about/">About Faith Frontier</a>
  </div>
</section>
