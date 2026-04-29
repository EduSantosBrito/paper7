# Comparative PDF Parsing Study

**Source:** arxiv 2410.09871 — Adhikari & Agarwal, 2024
**Topic:** Benchmark of PDF parsers for scientific document understanding

## Core Finding

**Markdown and LaTeX** are the recommended output formats for scientific PDFs fed to LLMs.
Binary formats (raw PDF text extraction) consistently underperform structured text.

## Parsers Benchmarked

- PyMuPDF, pdfplumber, pdfminer (text extraction)
- Nougat, MathPix (ML-based, LaTeX output)
- Marker, Docling (Markdown output)
- ar5iv / paper7 (HTML→Markdown, no PDF parsing)

## Why paper7 Skips PDF Entirely

The study confirms that PDF text extraction loses structure (two-column layout, math,
tables). paper7 uses ar5iv — the same LaTeX source compiled to clean HTML — avoiding
PDF parsing completely.

## Key Recommendations from the Study

1. Prefer structured output (Markdown/LaTeX) over flat text extraction
2. Math equations need special handling — LaTeX source preferred over OCR
3. Table extraction is the hardest unsolved problem; captions survive better than layout

## Related

- [pdf-wukong](pdf-wukong.md) — sparse sampling reduces how much parsing output you need
- [lost-in-the-middle](lost-in-the-middle.md) — clean structure helps position-aware reading
