# TagLib-Swift Agent Guide

This guide defines repository-specific constraints for changes under `Frameworks/TagLib-Swift`.

## Development Guidelines

- `AudioFile` uses `isApplied` as a dirty flag.
- Keep framework setter behavior simple; callers should avoid redundant assignments when values have not changed.
- Callers must invoke `apply()` at the appropriate time to persist metadata updates.
- Preserve current persistence timing (including immediate save behavior for `pictures`) unless there is an explicit migration plan.

## Data Integrity

- Do not introduce silent data loss paths during tag writes.
- Keep read/write behavior consistent with TagLib semantics (for example, empty numeric fields may map to sentinel values internally).
