# DIG4143 Teaching Wiki — Agent Instructions

This file is the schema document for the DIG4143 teaching companion wiki.
It instructs any LLM agent how to act as a disciplined maintainer for this
teaching-focused repository.

## How To Resume A Session

Start each new session with:

```text
Read AGENTS.md, Teaching_Wiki/index.md, Teaching_Wiki/raw-sources.md, and the top of Teaching_Wiki/log.md, then summarise the current state of the teaching wiki.
```

## Project Purpose

This repository contains public teaching materials for DIG4143.

The wiki's purpose is to maintain a persistent teaching companion that:
- extends weekly lecture content into fuller explanations
- expands tutorial questions into guided teaching material
- maps concepts across the module instead of treating each week in isolation
- foregrounds MATLAB demos and visualisations so students can see signal, noise,
  transmission, modulation, and channel behaviour more clearly

The wiki is not a copy of the teaching files. It is a maintained synthesis layer
that sits between raw teaching materials and future teaching conversations.

## Scope Rules

Allowed write scope:
- `Teaching_Wiki/`
- `AGENTS.md`

Read-only source areas:
- `2026Teaching/`
- `HistoryModule Presentations/`
- top-level lecture notes and strategy files

Rule:
- Never modify raw teaching materials unless the user explicitly asks.
- Use the wiki as the default place for synthesis, companion notes, and analysis.

## Directory Layout

```text
DIG4143_Public/
  2026Teaching/                -> current teaching materials and MATLAB code (READ-ONLY)
  HistoryModule Presentations/ -> legacy lecture/tutorial assets (READ-ONLY)
  Teaching_Wiki/               -> LLM-maintained teaching companion (READ/WRITE)
  AGENTS.md                    -> workflow and schema instructions
```

## Teaching_Wiki Structure

```text
Teaching_Wiki/
  README.md
  index.md
  log.md
  raw-sources.md
  lectures/     -> extended weekly lecture companions
  tutorials/    -> expanded tutorial walkthroughs and question support
  demos/        -> MATLAB demo guides, run notes, and interpretation pages
  concepts/     -> reusable concept pages such as SNR, bandwidth, modulation
  topics/       -> higher-level synthesis pages and teaching strategy pages
```

## Page Format

Every wiki page must include YAML frontmatter:

```yaml
---
type: lecture | tutorial | demo | concept | topic
title: "Page Title"
week: 0
tags: [signals, matlab]
sources: [filename.pdf, filename.docx]
created: YYYY-MM-DD
updated: YYYY-MM-DD
status: active
---
```

Conventions:
- Use British English.
- Use `[[wikilink]]` style links where possible.
- Keep pages practical and student-facing unless clearly marked as staff strategy.
- Cite exact source filenames in frontmatter.
- For lecture or tutorial companion pages, include a short teaching aim near the top.
- For demo pages, include: concept, MATLAB file, what students should observe, and
  likely misconceptions.

## Core Workflows

### Ingest A Teaching Source

When the user asks to ingest a lecture, tutorial, PDF, DOCX, or MATLAB file:

1. Read the source fully.
2. Decide whether it belongs primarily under `lectures/`, `tutorials/`, `demos/`,
   or `concepts/`.
3. Create or update the main companion page.
4. Update related concept pages.
5. Add the page to `Teaching_Wiki/index.md`.
6. Append an entry to `Teaching_Wiki/log.md`.
7. Update the source status in `Teaching_Wiki/raw-sources.md`.

### Extend A Week

When the user asks to improve a teaching week:

1. Read the week's lecture notes, tutorial file, and any related demo code.
2. Create or update:
   - one lecture companion page
   - one tutorial support page if needed
   - one demo page if MATLAB can clarify the topic
3. Prefer concrete visual explanations:
   - time-domain and frequency-domain plots
   - noise and distortion comparisons
   - pulse propagation, reflections, attenuation, and modulation examples
4. Highlight where students usually struggle.

### Query

When answering a question:

1. Read `Teaching_Wiki/index.md` first.
2. Read the relevant pages.
3. Answer from the wiki and cite linked pages.
4. If the answer creates useful teaching material, offer to save it as a wiki page.

### Lint

When asked to health-check the wiki:

1. Look for orphan pages, duplicated concepts, stale pages, and weak cross-links.
2. Check whether each taught week has a lecture companion and, where useful, a demo.
3. Check whether MATLAB opportunities are missing from signals, transmission,
   modulation, noise, and measurement topics.
4. Produce a short markdown lint report.

## Index And Log Rules

- `index.md` is the entry point for all future sessions.
- `log.md` is append-only.
- `raw-sources.md` tracks what has been processed and what remains.

## Teaching Priorities For This Year

Prioritise MATLAB-backed teaching support for:
- signal generation and decomposition
- bandwidth and harmonic content
- attenuation and transmission-line behaviour
- noise, SNR, and distortion
- balanced vs unbalanced transmission
- modulation and multiplexing

The goal is not just more code. The goal is better visual intuition for students.
