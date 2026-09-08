**English** | [Tiếng Việt](README.vi.md)

# Dart Self-Study

A workspace for learning **Dart** properly from the ground up, with the goal of moving on to
**Flutter** on solid foundations — not just wiring code together until it runs.

This repo has been through two phases with very different goals and study methods. Everything from
the first phase is preserved untouched in `_archive/` as a reference point.

---

## Two Phases

### Phase 1 — Exam pattern drilling (closed → `_archive/`)

- **Goal:** learn fast enough to pass a practical exam that always followed the same shape — one OOP
  model, one manager class backed by a collection, CSV file I/O, a `switch`-menu `main()`, all in 60
  minutes.
- **Method:** leaned heavily on AI to generate code under deadline pressure.
- **Outcome:** the code ran, but **the fundamentals never stuck** — much of it was written without
  really understanding why.

### Phase 2 — Foundation-first, roadmap-driven (current)

- **Goal:** learn Dart from the basics through to the advanced topics that actually matter, as a
  solid base for Flutter.
- **Method:** follow the planned path in [`docs/ROADMAP.md`](docs/ROADMAP.md) — 21 topics across 4
  tiers, worked through in order, no skipping ahead.
- **Role of AI:** **a reference, not a substitute** — explaining concepts, proposing sample code,
  reviewing, debugging. AI **is allowed** to produce complete code for reference; the conditions are
  that I **type it into the file myself** and can **explain every line back**. Copying without
  understanding is what repeats phase 1 — the line is drawn at comprehension, not at who typed it
  first.

---

## Repository Structure

| Path | Contents |
|---|---|
| [`docs/ROADMAP.md`](docs/ROADMAP.md) | The detailed Dart learning path — 21 topics, 4 tiers, each with its goal and its Flutter payoff |
| `_archive/` | All phase-1 material, kept exactly as it was |
| `00_*/` … `20_*/` | Practice folders from the roadmap — **created as I reach them**, not present yet |

---

## Learning Path

Full detail lives in [`docs/ROADMAP.md`](docs/ROADMAP.md) (written in Vietnamese). Summary:

| Tier | Scope | Main topics |
|:---:|---|---|
| 0 | Required foundations | Syntax, functions & closures, null safety, OOP, inheritance & interfaces, collections & Iterable, `==`/`hashCode` & immutability |
| 1 | Flutter-facing core | `Future`/`async`, error handling, cascade, extensions, enums |
| 2 | Advanced | `Stream`, mixins, advanced generics, sealed classes & pattern matching, JSON, project structure & testing |
| 3 | Optional | Isolates, advanced async patterns |

**Ground rules:** finish a tier before starting the next; a topic counts as done only when I can
explain it out loud without looking anything up.

---

## `_archive/` — Phase 1 material

Four standalone Dart packages, each with its own `pubspec.yaml`:

| Package | Contents | Entry point |
|---|---|---|
| `standard_demo_dart/` | Per-session class exercises: `session03_oop`, `session04_inheritance`, `session05_file_io` | each `bin/sessionXX_*/exYY_*.dart` |
| `assignment_01/` | Stationery shop CRUD — `Calculator extends Stationery`, `ShopStore` over `Map<int, Calculator>`, writes `Calculators.csv` | `bin/shop_app.dart` |
| `assignment_02/` | Bank account CRUD — `ATM extends Bank`, backed by `HashSet<Account>`, writes `bank.csv` | `bin/test_account.dart` |
| `exam_dart/` | The real exam paper — layered as `entity` / `repository` / `service` / `controller` | `bin/student_test.dart` |
| `archive_docs/` | Original assignment briefs (PDF) and the exam image | — |

**How to use it:** treat this as a reference for *patterns*, not as a standard to learn from. The
roadmap's `00_gap_check` step uses this very code to work out which parts I genuinely understand and
which parts were just AI output.

To run one of the packages (requires Dart SDK `^3.13.0`):

```bash
cd _archive/assignment_01
dart pub get
dart run bin/shop_app.dart
```

Static analysis: `dart analyze`

---

## Commit Convention

A single line, 70 characters max, no body, no trailers:

```
type(scope): subject
```

`type` is one of: `feat` `fix` `docs` `style` `refactor` `perf` `test` `chore` `revert` `ci`.
Enforced by a Husky `commit-msg` hook installed locally (not tracked in the repo).
