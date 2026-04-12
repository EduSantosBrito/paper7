# paper7

CLI tool that fetches arXiv papers as clean markdown for LLM context. Zero dependencies — pure Bash using curl/sed/grep/awk.

## Architecture

Single executable Bash script (`paper7`). No build step, no package manager, no runtime dependencies beyond standard Unix tools.

- `paper7` — the entire tool in one file
- Papers are fetched from ar5iv.labs.arxiv.org (HTML version of arXiv, no PDF parsing)
- Metadata comes from the arXiv API
- Cache lives at `~/.paper7/cache/<id>/` with `paper.md` and `meta.json`

## Commands

- `search <query>` — search arXiv by keyword (`--max N`, `--sort relevance|date`)
- `get <id|url>` — fetch, clean, and cache a paper as markdown (`--no-refs`, `--no-cache`)
- `repo <id>` — find GitHub repos linked in the paper
- `list` — show cached papers
- `cache clear [id]` — clear cache

## Development guidelines

- Keep it as a single Bash script with zero external dependencies
- Output goes to stdout for piping (`paper7 get ... | claude "..."`)
- All text processing uses sed/grep/awk — no Python, no Node
- Test changes against papers of varying sizes (small ~10 pages, large ~100 pages like GPT-4 report)
