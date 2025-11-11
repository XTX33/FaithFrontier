---
layout: listing
title: Case Records
permalink: /cases/
body_class: page-cases
---

<section aria-labelledby="cases-heading" class="cases-index shell">
  <header class="page-header">
    <h1 id="cases-heading">Case Records</h1>
    <p>Active and historical matters in New Jersey state courts and federal court.</p>
  </header>

  <div class="cases-list">
    {% assign sorted_cases = site.cases | sort: "filed_date" | reverse %}
    {% for case in sorted_cases %}
      <article class="case-card">
        <h2 class="case-card-title">
          <a href="{{ case.url | relative_url }}">
            {{ case.short_title | default: case.title }}
          </a>
        </h2>
        <p class="case-card-meta">
          {{ case.court }}{% if case.venue %} — {{ case.venue }}{% endif %}<br>
          Docket {{ case.docket }} · {{ case.case_type }} · {{ case.status }}
        </p>
        {% if case.filed_date %}
        <p class="case-card-date">
          Filed {{ case.filed_date | date: "%B %-d, %Y" }}
        </p>
        {% endif %}
      </article>
    {% endfor %}
  </div>
</section>
