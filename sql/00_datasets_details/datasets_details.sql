SELECT
  *
FROM
  tutorial.us_housing_units;

SELECT
  year,
  MONTH,
  month_name,
  south,
  west,
  midwest,
  northeast
FROM
  tutorial.us_housing_units;

year MONTH month_name south west midwest northeast -- -------------------------------------------------------------------------        
SELECT
  *
FROM
  tutorial.billboard_top_100_year_end
ORDER BY
  year DESC,
  year_rank;
-- ========================================
-- 
-- ========================================     
  
SELECT *
FROM tutorial.aapl_historical_stock_price;  
-- total rows = 3555

date
year
month
open
high
low
close
volume
id

-- -----------------------------------------------------------

SELECT * 
FROM benn.college_football_players
LIMIT 100;

SELECT count(*) 
FROM benn.college_football_players;
-- 26298

school_name
player_name
position
height
weight
year
hometown
state
id

------------------------------------------------------------------------------------------------------------
SELECT * 
FROM benn.college_football_teams;
-- 252
-- FBS (Division I-A Teams)
SELECT *
FROM benn.college_football_players;
-- 26298
-------------------------------------------------------------------------------------
SELECT *
FROM tutorial.crunchbase_companies;
-- Rows = 27327, columns = 19 

SELECT *
FROM tutorial.crunchbase_acquisitions;
-- Rows = 7414, columns = 21 

SELECT *
FROM tutorial.crunchbase_investments;
-- Rows = 83893, columns = 21

SELECT *
FROM tutorial.crunchbase_investments_part1;
-- Rows = 42483 columns = 21 

SELECT *
FROM tutorial.crunchbase_investments_part2;
-- Rows = 41410 columns = 21 
-------------------------------------------------------------------------------------------