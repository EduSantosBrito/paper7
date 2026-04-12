# Research KB: Why clean text beats raw PDF for LLMs

These papers were fetched with paper7 itself and used to validate the project's core thesis:

> **"Sending raw PDFs to LLMs wastes tokens and hurts comprehension. Clean text extraction saves 50-80% of tokens."**

## Papers

| File | Paper | Key Finding |
|------|-------|-------------|
| `kb_lost_in_the_middle.md` | Lost in the Middle (Liu et al., 2023) | LLMs lose 20%+ performance when relevant info is buried in long contexts |
| `kb_pdf_wukong.md` | PDF-WuKong (Xie et al., 2024) | Sparse sampling reduces tokens by ~89% while improving F1 |
| `kb_comparative_pdf_parsing.md` | Comparative Study of PDF Parsing Tools (Adhikari & Agarwal, 2024) | Rule-based parsers fail on scientific docs; recommends Markdown/LaTeX output |
| `kb_pdf_parsers_benchmark.md` | Benchmarking PDF Parsers (Horn & Keuper, 2026) | Parser quality varies 2.1-9.5/10; text metrics are misleading |
| `kb_document_parsing_unveiled.md` | Document Parsing Unveiled (Zhang et al., 2024) | Comprehensive survey confirming structured extraction is essential for LLMs |

## How these were fetched

```bash
paper7 get 2307.03172 > kb_lost_in_the_middle.md
paper7 get 2410.05970 > kb_pdf_wukong.md
paper7 get 2410.09871 > kb_comparative_pdf_parsing.md
paper7 get 2603.18652 > kb_pdf_parsers_benchmark.md
paper7 get 2410.21169 > kb_document_parsing_unveiled.md
```

This is a real-world example of using paper7 to build a knowledge base for LLM-assisted research.
