# SQL DE Learning 2025
Practice repo for SQL at data-engineer level (GCP/Azure).  
Structure:
- `sql/` : queries grouped by topic (joins, group_by, windows, dates, etc.)
- `datasets/` : CSVs used for practice (`raw/` from sources, `processed/` after cleaning)
- `docs/` : notes, cheatsheets
Workflow:
1) Create a branch for each session: `feat/sql-<topic>-<YYYYMMDD>`
2) Add/modify SQL files and small CSVs.
3) `git add -A && git commit -m "feat: <what you solved>"`
4) `git push -u origin <branch>` and merge via PR (even if solo).
