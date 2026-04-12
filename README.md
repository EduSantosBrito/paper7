# paper7

**arXiv papers as clean context for LLMs.** Zero dependencies. Bash-only.

Like [context7](https://github.com/upstash/context7) but for academic papers.

```bash
paper7 get 2401.04088 | claude "summarize this paper"
```

## Benchmark: Token Savings

Tested with 5 landmark papers (Attention, RAG, Mixtral, GPT-4, LoRA):

```
                        Token Usage (5 papers combined)
  
  PDF via Vision  ████████████████████████████████████████████████  270k tokens
  pdftotext       ██████████████████████████                        128k tokens  
  paper7          ██████████████████                                 90k tokens  (-66%)
  paper7 --norefs ████████████                                       51k tokens  (-81%)
```

| Paper | Pages | PDF Vision | pdftotext | paper7 | Savings |
|-------|------:|-----------:|----------:|-------:|--------:|
| Attention Is All You Need | 15 | 24k | 10k | 10k | -58% |
| RAG | 12 | 19k | 17k | 17k | -10% |
| Mixtral of Experts | 16 | 25k | 8k | 8k | -68% |
| **GPT-4 Technical Report** | **100** | **160k** | **71k** | **30k** | **-81%** |
| LoRA | 26 | 41k | 21k | 23k | -43% |
| **Total** | **169** | **270k** | **128k** | **90k** | **-66%** |

> The bigger the paper, the bigger the savings. GPT-4's 100-page report goes from 160k to 30k tokens.

## How It Works

```
search "topic" ──> choose papers ──> get (fetch + cache) ──> use as LLM context
                                          │
                                          ▼
                                    ~/.paper7/
                                    └── cache/
                                        ├── 2401.04088/
                                        │   ├── paper.md    ← clean markdown
                                        │   └── meta.json   ← title, authors
                                        └── 1706.03762/
                                            ├── paper.md
                                            └── meta.json
```

1. **Search** arXiv API for papers by keyword
2. **Fetch** full text from [ar5iv](https://ar5iv.labs.arxiv.org) (HTML version of arXiv — no PDF parsing)
3. **Clean** metadata via arXiv API (authors, title) + content via ar5iv (body text)
4. **Cache** locally as your knowledge base

## Install

```bash
git clone https://github.com/lucianfialho/paper7.git
cd paper7
chmod +x paper7

# Add to PATH (pick one)
ln -s "$(pwd)/paper7" /usr/local/bin/paper7
# or
export PATH="$PATH:$(pwd)"
```

**Dependencies:** `curl`, `sed`, `grep`, `awk` — already on any Unix system.

## Usage

### Search for papers

```bash
$ paper7 search "mixture of experts" --max 3

Found 55723 papers (showing 3):

  [2401.04088] Mixtral of Experts
  Albert Q. Jiang, Alexandre Sablayrolles, ... (2024-01-08)

  [2410.17954] ExpertFlow: Efficient Mixture-of-Experts Inference
  Xin He, Shunkang Zhang, ... (2024-10-23)
```

### Fetch a paper

```bash
paper7 get 2401.04088                          # by ID
paper7 get https://arxiv.org/abs/2401.04088    # by URL
paper7 get 2401.04088 --no-refs                # strip references (save tokens)
paper7 get 2401.04088 --no-cache               # force re-download
```

### Find the source code

```bash
$ paper7 repo 2401.04088

Repositories for 2401.04088:
  https://github.com/mistralai/mistral-src
```

### Manage your knowledge base

```bash
$ paper7 list

  2401.04088  Mixtral of Experts
  1706.03762  Attention Is All You Need
  2005.11401  RAG for Knowledge-Intensive NLP Tasks

3 paper(s), 184K total

$ paper7 cache clear 2401.04088   # remove one
$ paper7 cache clear              # clear all
```

### Pipe to anything

```bash
paper7 get 2401.04088 | wc -w                          # word count
paper7 get 2401.04088 --no-refs > paper.md              # save to file
paper7 get 2401.04088 | pbcopy                          # clipboard (macOS)
paper7 get 2401.04088 | claude "explain the key ideas"  # feed to LLM
```

## Why Not Just Use PDF?

| | PDF via AI Vision | pdftotext | paper7 |
|---|---|---|---|
| Token efficiency | Bad (images) | OK | Good |
| Two-column layout | Broken flow | Broken flow | Linear text |
| Headers/footers | Every page | Every page | Removed |
| Math formulas | Garbled | Garbled | Cleaned |
| Authors/metadata | In body noise | In body noise | Structured header |
| Caching/KB | No | No | Built-in |
| Dependencies | AI API | poppler | curl (any Unix) |

## License

MIT
