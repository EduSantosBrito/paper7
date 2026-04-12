# Benchmark: Token Savings

Real output files from 5 landmark papers, comparing three methods of feeding papers to LLMs.

## Methods

| Method | How it works | File in each folder |
|--------|-------------|---------------------|
| **PDF via Vision** | Send the raw PDF to a multimodal LLM (each page as an image) | `original.pdf` (not included, ~12MB total) |
| **pdftotext** | Extract text with poppler's `pdftotext` | `pdftotext.txt` |
| **paper7** | Fetch from ar5iv + clean with paper7 | `paper7.md` |

## Papers

| Folder | Paper | arXiv ID | Pages |
|--------|-------|----------|------:|
| `attention/` | Attention Is All You Need | 1706.03762 | 15 |
| `rag/` | Retrieval-Augmented Generation | 2005.11401 | 12 |
| `mixtral/` | Mixtral of Experts | 2401.04088 | 16 |
| `gpt4/` | GPT-4 Technical Report | 2303.08774 | 100 |
| `lora/` | LoRA: Low-Rank Adaptation | 2106.09685 | 26 |

## How to reproduce

```bash
# paper7 output
./paper7 get <arxiv-id> > benchmark/<folder>/paper7.md

# pdftotext output (requires poppler)
curl -sL "https://arxiv.org/pdf/<arxiv-id>" -o paper.pdf
pdftotext paper.pdf benchmark/<folder>/pdftotext.txt

# PDF Vision tokens — send the PDF directly to a multimodal API
# Token count depends on the model's vision pricing
```

## Notes

- PDFs are not included in the repo to keep it lightweight (~12MB total)
- Token estimates in the main README use ~4 chars/token as approximation
- The bigger the paper, the bigger the savings — GPT-4's 100-page report benefits most
