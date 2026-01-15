# VIR Website — Stack + SEO Deep Research Prompt

## Outcome
Produce a concrete recommendation for the VIR website build stack and an SEO/traffic plan that can realistically increase qualified inbound leads over 3–12 months.

## Local context to use
Read these files first:
- `projects/vir_website_wireframes/sources/sitemap_excerpt.md`
- `projects/vir_website_wireframes/sources/competitors.md`
- `projects/vir_website_wireframes/notes.md`
- `projects/vir_website_wireframes/artifacts/site/index.html` (and other pages for IA)

## Questions you must answer
1. What is the best stack for a content-heavy consulting site with “Insights” as the primary traffic engine?
2. Which CMS is best given: non-technical editors, structured content, and the need for programmatic landing pages later?
3. What are the top SEO risks (technical + content) and how does the stack mitigate them?
4. What is the content model (types + required fields) to support: services, therapy areas, insights, people, products, careers?
5. What’s the measurement plan (GSC/GA4, events, conversions)?
6. What’s the 90-day plan to ship v1 + start compounding traffic?

## Constraints / preferences
- Avoid Next.js entirely.
- Prefer Cloudflare for hosting/deploy (Pages/Workers).
- Prioritize: speed, crawlability, clean HTML, easy metadata, and a low-ops publishing workflow.
- Assume stakeholders may not reply quickly; recommendations should be robust to missing answers.

## Options to compare (minimum)
- Astro + headless CMS (Sanity, Contentful, Storyblok) on Cloudflare Pages
- Astro + Git-based CMS (Keystatic/Decap)
- RedwoodSDK (server-first React on Cloudflare) + headless CMS
- “Keep WordPress” option (theme rebuild or headless WP) as a baseline

## Required output format
Return:
1. **Recommendation (TL;DR)**: 5 bullets max.
2. **Decision matrix**: criteria × option table with short justifications.
3. **Proposed architecture**: where content lives, build/publish flow, forms, search.
4. **SEO plan**:
   - technical checklist
   - content plan (topic clusters, page templates, internal linking)
5. **90-day execution plan**: week-by-week.
6. **Open questions**: the minimum set that must be answered to proceed confidently.
