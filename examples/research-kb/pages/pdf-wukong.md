# PDF-WuKong

**Source:** arxiv 2410.05970 — Xie et al., 2024
**Topic:** Sparse PDF sampling for efficient document understanding

## Core Finding

Sampling ~11% of PDF pages (sparse selection) reduces token usage by **~89%** while
matching or exceeding full-document baselines on comprehension benchmarks.

## Method

1. Score pages by visual/textual density
2. Select a sparse subset covering the document's key regions
3. Feed only those pages to the LLM

## Why It Matters for paper7

Validates the paper7 approach: you don't need the full paper to understand it.
`paper7 get <id>` returns a compact header + section index; `--range` lets you
pull only the slices that matter — same principle, pure text.

## Key Numbers

| Approach | Token usage | Accuracy |
|---|---|---|
| Full document | 100% | baseline |
| Sparse (WuKong) | ~11% | +2-5% on benchmarks |
| paper7 compact header | ~3-8% | sufficient for navigation |

## Related

- [lost-in-the-middle](lost-in-the-middle.md) — why position (not just length) matters
- [pdf-parsing-study](pdf-parsing-study.md) — format quality compounds with sampling
