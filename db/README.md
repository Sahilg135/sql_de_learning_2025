# Local DB bootstrap

## Prereqs
- PostgreSQL running locally
- A database named **sql_de_lab** (create once via UI or `CREATE DATABASE sql_de_lab;`)

## Apply DDL
1. Connect to `sql_de_lab`.
2. Run `db/ddl/001_create_schemas.sql`.
3. Run `db/ddl/002_set_search_path.sql`.

## Load data (current approach)
Use DBeaver Import (CSV → New Table) and map files from
`datasets/raw/csv/` to the exact tables:

tutorial schema:
- us_housing_units
- billboard_top_100_year_end
- aapl_historical_stock_price
- crunchbase_acquisitions
- crunchbase_companies
- crunchbase_investments
- crunchbase_investments_part1
- crunchbase_investments_part2

benn schema:
- college_football_players
- college_football_teams

**Note:** Table names must match exactly the list above; your SQL will then run unchanged.

## Roadmap (later)
- Replace manual import with a scripted loader (`psql \copy` or csvkit) for one-command rebuild.
- Add indexes/constraints once queries are validated for speed.
