# CSV load (DBeaver wizard)

1) Right-click schema (tutorial or benn) → Tools → Import Data…
2) Source: CSV → select file from `datasets/raw/csv/…`
3) Target: New table, set **Schema** and exact **Table name** as per db/README.md.
4) Check "First row is header".
5) Review types (year/month -> INTEGER, numeric -> DOUBLE PRECISION, text -> TEXT).
6) Finish.

Re-run any import if needed; it’s safe to drop and recreate tables during dev.
