# research-kb — LLM Wiki Example

This example shows the **LLM Wiki pattern** applied to a real research topic:
*why clean text beats raw PDF for LLM context*.

Three papers were ingested with `paper7 kb ingest`, then an agent synthesized wiki
pages from each one. The result is a small, grep-searchable knowledge base — no
database, no embeddings, no external dependencies.

## Layout

```
examples/research-kb/
  sources/          ← raw papers fetched by paper7 kb ingest
  pages/            ← agent-written wiki pages
  index.md          ← catalog maintained by the agent
  log.md            ← ingest + edit history
```

## How this was built

```bash
# 1. Ingest papers (paper7 fetches; agent reads and writes)
paper7 kb ingest 2307.03172   # Lost in the Middle
paper7 kb ingest 2410.05970   # PDF-WuKong
paper7 kb ingest 2410.09871   # Comparative PDF Parsing

# 2. Agent wrote a wiki page per paper (shown in pages/)
paper7 kb write lost-in-the-middle  < lost-in-the-middle.md
paper7 kb write pdf-wukong          < pdf-wukong.md
paper7 kb write pdf-parsing-study   < pdf-parsing-study.md

# 3. Search the wiki
paper7 kb search "sparse sampling"
paper7 kb search "Markdown"
paper7 kb search "position"
```

## Try it yourself

```bash
# Search the example pages
paper7 kb search "token"

# Read a page
paper7 kb read ~/.paper7/wiki/pages/lost-in-the-middle.md

# Check status
paper7 kb status
```

The `sources/` directory contains the raw paper Markdown — too large to commit here.
Run `paper7 kb ingest <id>` to populate your local `~/.paper7/wiki/sources/`.
