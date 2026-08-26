# Dart Practical Exam Prep

A self-study workspace for practicing **Dart CLI/console applications**, built around a recurring
practical-exam format used in an IDP course: a small OOP model, a manager/controller class backed
by a generic collection, CSV file I/O, and a menu-driven `main()` — all delivered in **60 minutes**.

The goal of this repo is not just "code that compiles," but a repeatable, understood workflow for
turning a one-page assignment brief into a working, tested console app under time pressure.

## Repository Structure

| Path | Purpose |
|---|---|
| [`docs/`](docs) | Original assignment briefs (past exam papers, PDF) |
| [`examples/`](examples) | Raw reference source material collected from class, kept as-is |
| [`standard_demo_dart/`](standard_demo_dart) | The material in `examples/` consolidated into one clean, runnable Dart package |
| [`assignment_01/`](assignment_01) | Full worked solution for Assignment 01 |
| [`assignment_02/`](assignment_02) | Full worked solution for Assignment 02 |
| [`exam_dart/`](exam_dart) | Reserved for the real exam paper, filled in after the exam is finished |

## The Exam Format

Every assignment in `docs/` follows the same shape — a 20-mark, 60-minute paper broken into four
requirements:

| # | What it covers | Typical weight |
|---|---|---|
| R1 | A base/abstract class or a plain data class | 1–2 marks |
| R2 | A model class that extends R1, with field constraints | 4 marks |
| R3 | A manager class holding a generic collection (`Map`, `HashSet`, ...) with CRUD + file I/O | 9–10 marks |
| R4 | An entry point (`main()`) with a `switch` + loop menu, all marks graded through it | 5 marks |

`assignment_01` and `assignment_02` are two different papers built on this exact shape — the
collection type, validation placement, and menu style (string commands vs. numeric options) differ
between them on purpose, so working through both covers more of the surface area a real exam could
vary.

## Projects in Detail

### `examples/`
Unmodified source material collected from three separate class sessions (`demo_dart`,
`D045_IDP`, `D045_IDP_IO`), covering OOP basics, inheritance/collections, and file I/O
respectively. Kept untouched as a historical reference — not meant to be run directly (imports
assume a different package layout).

### `standard_demo_dart/`
The same three sessions, reorganized into one valid Dart package (`lib/` for reusable
model/controller code, `bin/` for runnable entry points) with imports fixed and every exercise
verified to actually run. This is the "pattern library" the assignment solutions are built on.

### `assignment_01/` — Stationery / Calculator / ShopStore / ShopApp
A shop inventory CRUD app: `Calculator extends Stationery` (abstract class), managed by
`ShopStore` through a `Map<int, Calculator>`, with input validated in a loop until correct and
persisted to `Calculators.csv`. Entry point: `bin/shop_app.dart`.

### `assignment_02/` — Account / Bank / ATM / TestAccount
A bank account CRUD app: `ATM extends Bank` (abstract class), managed through a
`HashSet<Account>`, with balance validated (numeric, > $50) and persisted to `bank.csv`. Entry
point: `bin/test_account.dart`.

### `exam_dart/`
Currently an empty scaffold. After the real exam is taken, the actual paper (image/PDF) will be
dropped into `docs/`, verified requirement-by-requirement, and implemented here the same way as
the two assignments above — for self-review against what was submitted in class, not as a live
exam aid (see [Note on AI usage](#note-on-ai-usage)).

## Getting Started

**Prerequisites:** Dart SDK `^3.13.0` or later.

Each folder under `assignment_01/`, `assignment_02/`, `standard_demo_dart/`, and `exam_dart/` is
an independent Dart package. To run one:

```bash
cd assignment_01                 # or assignment_02 / standard_demo_dart / exam_dart
dart pub get                     # first time only
dart run bin/shop_app.dart       # entry point name differs per project — see table above
```

Static analysis for any project:

```bash
dart analyze
```

## Key Concepts Practiced

- Abstract classes and `extends` — mandatory method overrides, no direct instantiation
- Library-level privacy — `_` fields are scoped **per file**, not per folder
- Getters/setters as a validation boundary (vs. validating in the caller)
- Generic collections — `List`, `Map<K, V>`, `HashSet<T>`, and their trade-offs for lookup/CRUD
- Defensive input loops — `while (true) { try { ... break; } catch { ... } }` until valid
- Null safety at the I/O boundary — handling `stdin.readLineSync()` returning `null` on EOF
- File I/O via `dart:io` — reading/writing CSV with `File`, `IOException` handling
- CLI menu design — `switch` + loop, string commands vs. numeric options