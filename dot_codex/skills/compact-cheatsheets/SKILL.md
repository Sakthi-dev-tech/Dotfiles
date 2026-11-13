---
name: compact-cheatsheets
description: Create, extend, or compact source-grounded exam cheatsheets with symbol legends, shared comparison tables, and highlighted examples. Use for cheatsheet artifacts and revisions, not isolated tutoring questions.
---

# Compact Cheatsheets

Build a scannable exam reference, not a miniature textbook. This user's preferences are compact layouts, complete formula legends, comparisons without repetition, and examples that show both the problem and its solution. Page count, course, source collection, output format, and print constraints vary by task.

## Clarify before drafting

For a new sheet, ask one concise bundled question covering the material requirements that are still missing:

- **Scope and evidence:** course/topic, exact lectures/chapters or source files, exclusions, and topics to emphasise.
- **Exam constraints:** paper size/orientation, maximum pages or sides (or no fixed limit), allowed margins/minimum font, and colour versus grayscale. Distinguish physical sheets from printed sides.
- **Deliverable:** new sheet or existing file to extend; editable source format, output location, and whether a compiled PDF is wanted.
- **Content priorities:** formulas, comparisons, worked examples, diagrams/source images, code, and pitfalls. Ask about any space-versus-readability preference not established by the context.

Do not ask for information already supplied or evident from the selected artifact. When extending an established sheet with another named lecture, inherit the accepted settings and ask only about consequential ambiguity. Read available source material while waiting; resolve uncertain scope and hard exam rules before making dependent choices. If the user has no particular page limit, let the relevant content determine the length rather than inventing a target.

## Ground and select the content

- Inspect the existing source and rendered sheet before editing. Preserve the chosen authoring format; a Typst sheet stays Typst unless the user requests conversion.
- Read the requested notes and relevant embedded figures. In an Obsidian vault, resolve the actual wikilink/attachment paths. Linked topics provide supporting context, not permission to expand the requested scope.
- Prioritise decision rules, essential formulas, assumptions, distinctions, worked examples, and common exam mistakes. Avoid duplicating material already present elsewhere in the sheet.
- Check prose against source tables/diagrams when they disagree. Correct confirmed transcription errors; briefly flag material corrections or unresolved ambiguity. Do not copy incorrect formulas just to match the notes.
- Keep source provenance in comments near the corresponding section, or in the user's existing attribution format. Do not add a bulky bibliography unless requested.

## Formulas must be usable without the conversation

Provide a compact symbol key beside each formula family. Define **every introduced symbol**, including subscripts/indices and variables introduced only in an ideal-case derivation or worked example.

For each symbol, give its meaning and units or state that it is a count/ratio. Distinguish per-event values from totals, time from clock period, capacity from metadata overhead, and input-address units when relevant. Explain operations such as a maximum, floor, or modulo when their interpretation matters to solving the problem.

State the assumptions that make a formula valid. If the source uses a different convention, show the relationship between the conventions rather than mixing them. For example, a total miss time that includes lookup and an additional miss penalty require different-looking average-time formulas. Identify the baseline in ratios or speedups.

Include one small verified substitution or worked example when it helps the user apply a formula. Check arithmetic, units, bit counts, and boundary cases. Do not add unrelated formulas simply to fill space.

## Compare once; show the differences

- Put similar mechanisms side by side. Explain their common behaviour once, then list only differences. Prefer a shared table over separate near-identical paragraphs or truth tables.
- For a problem/solution topic, show **concrete trigger or example → why it fails → remedy → remaining cost**. If quantitative, include baseline and after-solution values in neighbouring columns.
- State the model for numerical costs. Counts may depend on timing, available hardware, ordering, or policy. Distinguish different sources of delay and avoid counting an overlapping penalty twice. If a cost varies, give the condition or formula instead of inventing a universal number.
- Keep one-line reminders and relevant exceptions. Move long teaching explanations into concise examples or tables; do not silently remove an important exception to hit a page count.

## Highlight what causes the problem

Use restrained, consistent highlights on the actual operands, resources, conditions, or instructions responsible for an example. In a dependency example, mark the matching producer and consumer occurrences, not just the instruction names. Mark a wrong-path operation separately from a shared data dependency. Add a tiny colour legend if the meaning is not self-evident; keep labels usable in grayscale when required.

For Typst inline code, split raw spans around the highlighted token, for example:

```typst
`add `#highlight(fill: yellow)[`$t0`]`,$t1,$t2`
```

Keep the code's punctuation and operands intact. Do not put markup inside one raw span and expect it to render as formatting.

## Use space deliberately

- Use the existing visual style as the starting point. Prefer compact tables, adjacent formula/definition pairs, and text beside diagrams where that reduces repetition.
- Reuse a source image when it communicates better than prose, especially an excitation table, circuit, or state diagram. Copy needed assets into the deliverable's project; do not leave fragile absolute vault links. Crop slide titles, borders, empty canvas, and repeated explanatory text without losing labels or changing the technical meaning.
- Do not print the same full table both as an image and as recreated text. Choose the clearest version. Avoid shrinking a dense screenshot until its labels become unreadable.
- Let columns flow. Remove unnecessary page/column breaks, oversized padding, and large unbreakable groups before reducing type size. Keep a heading with its first content, a diagram with its caption, and an individual table row intact where practical; do not force a whole long section to stay together.
- Watch for horizontal waste too: use narrow legend columns, pair short formulas, and replace multi-row law-name banners with a compact label column.
- Page count is a constraint only when specified, not a permanent property of this skill. Do not pad a short final page or enlarge a diagram to make it look full. Avoid creating a mostly empty extra page because a small block could not fit.
- Reduce font/margins only within agreed exam and readability constraints, and report meaningful changes. If required content cannot fit those constraints, ask the user to choose between more space and explicit content priorities; do not hide omissions or make labels illegible.

## Verify and deliver

Compile the editable source and inspect the output, not just the compilation log. For PDF work, follow the available PDF artifact workflow when applicable. Use a temporary compiled PDF during iteration if a live preview may overwrite the final file.

Inspect a thumbnail overview of **all pages** after layout changes, then zoom into changed or dense areas. Check for wasted forced gaps, overflow, split table rows, orphaned captions/headings, clipped figures, unresolved symbols, and legibility at intended print size. Recheck page count, hard print limits, source-image dependencies, and worked-example calculations. Do not claim that successful compilation proves good layout.

Deliver the editable source and requested compiled output using the established filenames. Briefly report the result, verified page count, any changed font/margins, and material source uncertainties or corrections. For later additions, reflow the whole sheet instead of accumulating fixed page breaks after each lecture.
