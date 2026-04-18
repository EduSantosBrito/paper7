# Clinical research KB — psilocybin & hypertension

Real workflow from the v0.3.0 dogfooding session: an answerable clinical question, paper7 hitting its limits, the limits driving a feature, and the feature closing the loop.

---

## The question

> Is psilocybin therapy safe for patients with hypertension?

A real research need: clinicians screening patients for psilocybin trials, harm reduction researchers, anyone weighing the cardiovascular risk of an emerging therapy.

## Step 1 — arXiv first (paper7 v0.2.x)

```bash
paper7 search "psilocybin hypertension" --max 10
```

arXiv returned **17 papers total** but only **one clinical**:

```
[1910.05176] Psilocybin based therapy for cancer related distress, a systematic review and meta analysis
  Camile Bahi (2019-10-10)
```

Plus a handful of neuroscience/imaging papers (EEG/fMRI under psilocybin) — useful for understanding mechanism but **not** for the cardiovascular question.

→ See [`kb_psilocybin_cancer_distress.md`](kb_psilocybin_cancer_distress.md) — the only clinical hit, and it's about cancer distress, not hypertension.

## Step 2 — the gap

arXiv is physics/CS/ML/math/q-bio. Clinical psilocybin lives on **PubMed**. paper7 v0.2.x didn't have a PubMed source.

This gap drove [Issue #1](../../../issues/1) → `paper7 search --source pubmed` (shipped v0.2.0).

## Step 3 — same question on PubMed

```bash
paper7 search "psilocybin hypertension" --source pubmed --max 10
```

Returned **17 papers**, with **3 directly on the cardiovascular question**:

```
[pmid:38903003] Hypertensive Emergency Secondary to Combining Psilocybin Mushrooms,
                Extended Release Dextroamphetamine-Amphetamine, and Tranylcypromine.
  Barnett BS, Koons CJ, Van den Eynde V, Gillman PK, Bodkin JA (2025-07-01)

[pmid:38979507] Race and ethnicity moderate the associations between lifetime psilocybin
                use and past year hypertension.
  Jones GM, Ricard JA, Nock MK (2024)

[pmid:41546846] Safety and Efficacy of Monoamine Oxidase Inhibitors in Patients Who Use
                Psychoactive Substances: Potential Drug Interactions and SUD Treatment Data.
  Rached G, Campana A, Fiani D, Nguyen C, Van den Eynde V, ... (2026-03)
```

Plus a safety-considerations review for an adjacent population:

```
[pmid:38659049] Psilocybin therapy and anorexia nervosa: a narrative review of safety
                considerations for researchers and clinicians.
  Downey AE, Chaphekar AV, Woolley J, Raymond-Flesch M (2024-04-24)
```

## Step 4 — fetch each as Markdown

```bash
paper7 get pmid:38903003
paper7 get pmid:38979507
paper7 get pmid:41546846
paper7 get pmid:38659049
```

→ See the four `kb_*.md` files in this directory. Each is the literal output of `paper7 get`, cached at `~/.paper7/cache/pmid-<NNN>/` and exported here verbatim.

## Synthesis

### Hypertension controlled — likely safe under protocol
- Trials exclude patients with **uncontrolled HTN > 140/90** measured on three separate occasions.
- During dosing, BP rises are dose-dependent: peak ~138/80 (10 mg/70kg), 140/89 (20 mg/70kg), 146/93 (30 mg/70kg).
- 34% of high-dose participants transiently exceed 160 mmHg systolic; sustained elevations are uncommon.

### MAOI + psilocybin + stimulant — contraindicated
The Cleveland Clinic case ([pmid:38903003](kb_hypertensive_emergency_case.md)):
- 42-year-old male, treatment-resistant depression
- Meds: tranylcypromine 20mg 2×/day + dextroamphetamine 20mg/day
- 1 g *Psilocybe cubensis* → BP 230s/100s mmHg in 30 min, ST-elevation MI
- Mechanism: phenylethylamine in the mushrooms + MAOI blockade + amphetamine sympathomimetic effect

The MAOI safety review ([pmid:41546846](kb_maoi_safety_review.md)) catalogs hypertensive urgency/emergency reports for MAOIs combined with: tyramine-rich alcohol, amphetamine, cocaine, dextroamphetamine, khat, methamphetamine, **and psilocybin mushrooms**.

### Population variability
[pmid:38979507](kb_race_ethnicity_hypertension.md) suggests associations between past psilocybin use and past-year hypertension vary by race/ethnicity — early evidence, calls for longitudinal/causal work.

### Adjacent population guidance
[pmid:38659049](kb_psilocybin_anorexia_safety.md) on psilocybin in anorexia nervosa illustrates the general pattern: known cardiovascular vulnerabilities + transient psilocybin BP/HR effects → tailored mitigation strategies, not blanket exclusion.

### What screening protocols converge on
- BP > 140/90 (uncontrolled) → exclude or defer
- Established cardiovascular disease (coronary, ICC, arrhythmia) → exclude
- QTc-prolonging medications → ECG + electrolytes pre-dose
- **MAOI + stimulant on the same patient** → contraindicated

## What this example demonstrates

1. **paper7 actually found this answer.** The same query that returned 1 useful paper from arXiv returned 17 from PubMed — including the exact case report a clinician would want to know about.
2. **Multi-source matters.** Single-source paper7 (v0.1.x) couldn't have answered this question. v0.2.0 → v0.3.0 was driven by this exact failure case.
3. **The synthesis is reproducible.** Every `kb_*.md` here is the literal `paper7 get` output. You can re-run and verify.

## Reproduce

```bash
paper7 search "psilocybin hypertension" --source pubmed --max 10
paper7 get pmid:38903003
paper7 get pmid:38979507
paper7 get pmid:41546846
paper7 get pmid:38659049

# v0.3.0 — see Semantic Scholar's view of references for the case report
paper7 refs pmid:38903003 --max 10
```
