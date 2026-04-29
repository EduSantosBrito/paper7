# Lost in the Middle

**Source:** arxiv 2307.03172 — Liu et al., 2023
**Topic:** How document position affects LLM performance on multi-document QA

## Core Finding

LLMs perform best when relevant information is at the **beginning or end** of the context
window. Performance degrades by 20%+ when the same information is placed in the middle —
even with identical context length.

## Why It Matters for paper7

Long raw PDFs bury the signal. paper7 strips layout noise and puts the abstract + structured
sections first, keeping the relevant content where LLMs read best.

## Key Results

- U-shaped performance curve: high at position 0, drops mid-context, recovers at end
- Effect is consistent across GPT-3.5, Claude, and open models
- Longer contexts amplify the problem — more middle = more loss

## Practical Implications

- Prefer compact headers + targeted section fetches (`--range`) over full-paper dumps
- When feeding multiple papers, put the most relevant one first
- Strip references (`--no-refs`) to avoid burying key content under citation lists

## Related

- [pdf-wukong](pdf-wukong.md) — sparse sampling as a solution to context noise
- [pdf-parsing-study](pdf-parsing-study.md) — format choice affects what ends up in context
