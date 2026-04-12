# FlexilinkRAG — Agent Instructions

This file is the schema document for the FlexilinkRAG LLM-wiki system.
It instructs any LLM agent (Copilot CLI, Claude Code, Codex, etc.) how to act as a
disciplined, persistent wiki maintainer for this project.

---

## ▶ How to Resume a Session

**Copy and paste this prompt at the start of every new AI conversation:**

```
Read AGENTS.md, 05_Wiki/index.md, 05_Wiki/raw-sources.md, and the top of 05_Wiki/log.md, then tell me where we are.
```

This gives the AI full project context in one step.

---

## Project Overview

**Flexilink** is a proprietary non-IP audio/data networking technology developed by Nine Tiles.
It uses a custom virtual machine (VM4) running firmware compiled by the **TEALeaves** compiler.
This project encompasses:
- The VM4 specification and TEALeaves development environment
- Firmware source code for the AB021 Flexilink node (`.9t2src` / `.9t3src` files)
- AES51 audio-over-IP protocol support
- A SIF (Specific Innovation Fund) bid project
- Security, routing, and management subsystems

The wiki's purpose is to accumulate and synthesise knowledge across all these domains so that
any question can be answered from the wiki rather than re-derived from raw sources each time.

---

## Directory Layout

```
FlexilinkRAG/
  00_Admin/           → meeting notes, contacts, planning (READ-ONLY)
  01_Reference_Docs/  → core technical/reference PDFs (READ-ONLY)
  02_Engineering/     → source code and compiler projects (READ-ONLY)
  03_SIF_Project/     → SIF bid workspace and evidence (READ-ONLY)
  04_Presentations/   → slide decks (READ-ONLY)
  90_Archive_Legacy/  → historical materials (READ-ONLY)
  05_Wiki/            → LLM-maintained wiki (READ/WRITE — agent owns this)
```

> **Rule:** Never modify files outside `05_Wiki/`. Raw sources are immutable.

---

## Wiki Structure (`05_Wiki/`)

```
05_Wiki/
  index.md            → master catalog of all wiki pages
  log.md              → append-only chronological record of all operations
  raw-sources.md      → inventory of all raw source documents with ingest status
  sources/            → one summary page per ingested raw source
  entities/           → pages for hardware products, people, organisations
  concepts/           → technical concepts, protocols, standards, algorithms
  topics/             → higher-level synthesis and analysis pages
  README.md           → brief description for human readers
```

---

## Page Format

Every wiki page must include YAML frontmatter:

```yaml
---
type: source | entity | concept | topic
title: "Page Title"
tags: [tag1, tag2]
sources: [filename1.pdf, filename2.pdf]
created: YYYY-MM-DD
updated: YYYY-MM-DD
---
```

- Use **[[wikilink]]** style for cross-references (Obsidian-compatible)
- Keep headings to `##` and below (page title is implied by frontmatter)
- Cite raw source filenames, not full paths

---

## Workflows

### Ingest a Source

When the user says "ingest `<filename>`" or drops a new file into a raw folder:

1. Read the source document fully
2. Discuss key takeaways with the user (ask what to emphasise)
3. Write a summary page: `05_Wiki/sources/<slug>.md`
4. For each **entity** (hardware product, person, organisation) mentioned:
   - Create `05_Wiki/entities/<slug>.md` if it doesn't exist
   - Update existing page with new information
5. For each **concept** (protocol, algorithm, standard, technical mechanism):
   - Create `05_Wiki/concepts/<slug>.md` if it doesn't exist
   - Update existing page with new information
6. Update `05_Wiki/index.md`:
   - Add the new source page under `## Sources`
   - Add any new entity/concept pages under their sections
7. Append to `05_Wiki/log.md`:
   ```
   ## [YYYY-MM-DD] ingest | <Source Title>
   Pages created/updated: sources/<slug>.md, entities/..., concepts/...
   ```
8. Update status in `05_Wiki/raw-sources.md` from `pending` → `done`

### Query

When the user asks a question:

1. Read `05_Wiki/index.md` to identify relevant pages
2. Read those pages fully
3. Synthesise an answer with inline citations using `[[wikilink]]` or `(source: filename)`
4. Offer to save a valuable analysis as a new topic page under `05_Wiki/topics/`

### Lint

When the user says "lint the wiki" or asks for a health check:

1. Scan all pages and check for:
   - **Orphan pages** — not linked from `index.md`
   - **Contradictions** — conflicting claims across pages
   - **Stale claims** — information superseded by a newer ingest
   - **Missing pages** — concepts mentioned in pages but without their own page
   - **Missing cross-references** — entities/concepts that should link to each other but don't
2. Produce a lint report as a markdown list
3. Offer to fix each issue

### Update / Maintain

When new information contradicts an existing wiki page:
1. Update the page with the correct information
2. Add a note at the bottom: `> Updated YYYY-MM-DD: <reason for change>`
3. Append to `05_Wiki/log.md`:
   ```
   ## [YYYY-MM-DD] update | <Page Title>
   Reason: <what changed and why>
   ```

---

## Index Format (`index.md`)

```markdown
# FlexilinkRAG Wiki Index

## Sources
- [[sources/vm4-specification]] — VM4.0 virtual machine specification (Nine Tiles)
- ...

## Entities
- [[entities/ab021]] — AB021 Flexilink network node (hardware)
- ...

## Concepts
- [[concepts/tealeaves-compiler]] — TEALeaves VM4 compiler and IDE
- ...

## Topics
- [[topics/flexilink-architecture-overview]] — High-level synthesis of Flexilink system design
- ...
```

---

## Log Format (`log.md`)

```markdown
# FlexilinkRAG Wiki Log

## [YYYY-MM-DD] init | Wiki created
Initial scaffold. No sources ingested yet.

## [YYYY-MM-DD] ingest | VM4.0 specification.pdf
Pages created: sources/vm4-specification.md
Pages updated: entities/vm4.md, concepts/tealeaves-compiler.md
```

---

## Conventions

- Source wiki pages are **synthesised summaries**, not verbatim copies of the original. Extract key facts, structure them, remove noise.
- **Language:** Use British English spelling throughout all wiki pages and generated text (e.g. *organised*, *recognised*, *standardisation*, *programme*, *analyse*, *colour*, *behaviour*, *modelling*, *licence* (noun), *defence*).
- Always add a clickable **Original file** link at the top of every source pageusing a relative markdown link from `05_Wiki/sources/` back to the raw file: `[filename](../../folder/filename.ext)` — spaces in filenames must be `%20`-encoded. This allows Obsidian to open the file in its default app (Word, PDF viewer, etc.).
- The original documents in raw folders are the source of truth — never copy them wholesale into the wiki.
- Slugs are lowercase, hyphen-separated: `vm4-specification`, `ab021`, `aes51-protocol`
- Tags should be drawn from: `hardware`, `protocol`, `compiler`, `networking`, `security`,
  `audio`, `sif`, `management`, `vm4`, `flexilink`, `meeting`, `reference`
- The `sources` frontmatter field lists exact filenames from the raw folders
- `index.md` is the entry point — the LLM reads it first on every query
- `log.md` is append-only — never delete entries
- Answers saved as topic pages go in `topics/` and are treated as first-class wiki pages

---

## Starting Point

The initial ingest queue is tracked in `05_Wiki/raw-sources.md`.
Suggested first batch: all PDFs in `01_Reference_Docs/` (11 documents), starting with
`VM4.0 specification.pdf` as it is foundational to almost all other documents.
