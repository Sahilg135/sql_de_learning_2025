-- ========================================
-- Datasets used in Basic_SQL Hands on
-- ======================================== 
-- 1. 
SELECT * 
FROM
    tutorial.us_housing_units;
    
SELECT 
      year,
      month,
      month_name,
      south,
      west,
      midwest,
      northeast
FROM
    tutorial.us_housing_units;

-- 2. 
SELECT * 
FROM tutorial.billboard_top_100_year_end
ORDER BY year DESC, year_rank;
  

-- ========================================
-- SELECT Statement 
-- ========================================     

SELECT 
      *
FROM 
    tutorial.us_housing_units;
  
  
SELECT 
      west AS West_Region,
      south AS South_Region
FROM 
      tutorial.us_housing_units;
  
  -- if we want column names in specific format, use double quotes - 
  
  SELECT 
        west AS "WeSt_ReGioN",
        south AS "South_Region"
  FROM 
        tutorial.us_housing_units;
  
  
-- Using the SQL LIMIT command
SELECT *
FROM 
    tutorial.us_housing_units
LIMIT 15;

-- SQL WHERE - 
SELECT *
FROM 
    tutorial.us_housing_units
WHERE
    month = 1

-- SQL Comparison Operators
-- Comparison operators on numerical data

SELECT *
FROM 
    tutorial.us_housing_units
WHERE 
    west > 30;
    
-- Practice - 
SELECT *
FROM 
    tutorial.us_housing_units
WHERE 
    west > 50;
    
SELECT *
FROM 
    tutorial.us_housing_units
WHERE 
    south <= 20;    

-- Comparison operators on non-numerical data - 
SELECT *
FROM 
    tutorial.us_housing_units
WHERE
    month_name != 'January';
    
/* General Rule (ALWAYS):
    String values: 'January', 'Sahil', 'Data Engineer'
    Identifiers (rare in basic SQL): "columnName" or "tableName"
    SQL uses single quotes to reference column values.e.g. 'January'
    SQL uses double quotes to reference column names.e.g. "month_name"
*/

SELECT DISTINCT (month_name)
  FROM tutorial.us_housing_units
 WHERE month_name > 'January';
 
SELECT DISTINCT (month_name)
  FROM tutorial.us_housing_units
 WHERE month_name > 'J';

SELECT DISTINCT (month_name)
  FROM tutorial.us_housing_units
 WHERE month_name > 'Ju';
 
 SELECT DISTINCT (month_name)
  FROM tutorial.us_housing_units
 WHERE month_name > 'Jun';
 
 -- Practice - 
 
SELECT * 
FROM 
    tutorial.us_housing_units
WHERE 
    month_name = 'February';

SELECT * 
FROM 
    tutorial.us_housing_units
WHERE 
    month_name <= 'O';
    
-- ========================================
-- Arithmetic in SQL
-- ========================================    
/* Arithmetic operators only perform operations across rows. Aggregate functions are used to perform 
operations across entire columns (which could include millions of rows of data or more).*/

SELECT
      south,
      west,
      south+west AS SouthPlusWest
FROM 
    tutorial.us_housing_units
    
SELECT
      year,
      south,
      west,
      south+west-4*year AS nonsense_column
FROM 
    tutorial.us_housing_units
    
SELECT 
      year,
      month,
      month_name,
      south,
      west,
      midwest,
      northeast,
      south+west+midwest+northeast AS SumOfAll
FROM
    tutorial.us_housing_units;

/* Write a query that returns all rows for which more units were produced 
in the West region than in the Midwest and Northeast combined.*/
select *
FROM
    tutorial.us_housing_units
WHERE 
    west > (midwest + northeast)
  
/*
Practice Problem
Write a query that calculates the percentage of all houses completed in the United States represented by each region. Only return results from the year 2000 and later.

Hint: There should be four columns of percentages.
*/    
SELECT 
      (south + west + midwest + northeast) AS Total,
      south/(south + west + midwest + northeast) * 100 AS percentage_south,
      west/(south + west + midwest + northeast) * 100 AS percentage_west,
      midwest/(south + west + midwest + northeast) * 100 AS percentage_midwest,
      northeast/(south + west + midwest + northeast) * 100 AS percentage_northeast
FROM
    tutorial.us_housing_units
WHERE
    year >= 2000;
    

-- ========================================
-- SQL Logical Operators
-- ========================================   

SELECT *
FROM tutorial.billboard_top_100_year_end
ORDER BY year DESC, year_rank;

-- ========================================
-- SQL LIKE
-- ========================================  

-- The SQL LIKE operator
-- LIKE is a logical operator in SQL that allows you to match on similar values rather than exact ones.
-- The % symbol matches zero or more characters in SQL pattern matching.
-- Zero or more - %
-- Single char - _ (underscore)

SELECT * 
FROM tutorial.billboard_top_100_year_end
WHERE group_name LIKE 'Snoop Doggy Dog_';

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE group_name LIKE 'Dr_ke%';

-- When we want to ignore case sensitivity - use ALIKE
SELECT * 
FROM tutorial.billboard_top_100_year_end
WHERE group_name ILIKE 'Snoop%';

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE group_name ILIKE '_r_ke%';

SELECT * 
FROM tutorial.billboard_top_100_year_end
WHERE group_name ILIKE 'snoop%';

/*
Practice Problem
Write a query that returns all rows for which Ludacris was a member of the group.
*/
SELECT * 
FROM tutorial.billboard_top_100_year_end
WHERE group_name LIKE '%Ludacris%';

/*
Practice Problem
Write a query that returns all rows for which the first artist listed in the group has a name that begins with "DJ".
*/
SELECT * 
FROM tutorial.billboard_top_100_year_end
WHERE group_name LIKE 'DJ%';


-- ========================================
-- SQL IN
-- ======================================== 

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank IN (1, 2, 3);
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist IN ('Taylor Swift', 'Usher', 'Ludacris');
 
 /*
 Practice Problem
Write a query that shows all of the entries for Elvis and M.C. Hammer.
Hint: M.C. Hammer is actually on the list under multiple names, so you may 
need to first write a query to figure out exactly how M.C. Hammer is listed. 
You're likely to face similar problems that require some exploration in many real-life scenarios.
 */
SELECT * 
FROM tutorial.billboard_top_100_year_end
WHERE group_name IN ('Elvis Presley', 'Hammer', 'M.C. Hammer');
-- 40

SELECT * 
FROM tutorial.billboard_top_100_year_end
WHERE group_name LIKE '%Elvis Presley%'
  OR  group_name LIKE '%Hammer%';
-- 41
-- here only issue is, we are getting 1 extra row where group_name = 'Jan Hammer' which is not expected. 


-- ========================================
-- SQL BETWEEN
-- ======================================== 

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank BETWEEN 5 AND 10;
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank >= 5 AND year_rank <= 10; 
 
 /*
Practice Problem
Write a query that shows all top 100 songs from January 1, 1985 through December 31, 1990. 
 */
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year >= 1985 AND year <= 1990;
-- 623

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year BETWEEN 1985 AND 1990;
-- 623


-- ========================================
-- SQL IS NULL Operator
-- ======================================== 
-- You can select rows that contain no data in a given column by using IS NULL.
-- WHERE artist = NULL will not work—you can't perform arithmetic on null values.


SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist IS NULL;

-- WHERE artist = NULL will not work—you can't perform arithmetic on null values.
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist = NULL;
 
 /*
 
 */
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE song_name IS NULL;
 
 
-- ========================================
-- SQL AND Operator
-- ======================================== 

-- AND is a logical operator in SQL that allows you to select only rows that satisfy two conditions.

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year = 2012 AND year_rank <= 10;
 
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year = 2012
   AND year_rank <= 10
   AND "group_name" ILIKE '%feat%';
   
/*
Practice Problem
Write a query that surfaces all rows for top-10 hits for which Ludacris is part of the Group.
*/   
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank <= 10
  AND group_name LIKE '%Ludacris%';

/*
Practice Problem
Write a query that surfaces the top-ranked records in 1990, 2000, and 2010.
*/
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank = 1
  AND year IN (1990, 2000, 2010);
  

/*
Practice Problem
Write a query that lists all songs from the 1960s with "love" in the title.
*/  
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year BETWEEN 1960 AND 1969
  AND song_name ILIKE '%love%';

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year BETWEEN 1960 AND 1969
  AND LOWER(song_name) LIKE '%love%';
  
  
-- ========================================
-- SQL OR Operator
-- ======================================== 

-- OR is a logical operator in SQL that allows you to select rows that satisfy either of two conditions.

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank = 5 OR artist = 'Gotye';

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year = 2013
   AND ("group_name" ILIKE '%macklemore%' OR "group_name" ILIKE '%timberlake%');

/*
Practice Problem
Write a query that returns all rows for top-10 songs that featured either Katy Perry or Bon Jovi.
*/
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank BETWEEN 1 AND 10
  AND (group_name ALIKE '%Katy Perry%' OR group_name ALIKE '%Bon Jovi%'); 
*/

/*
Practice Problem
Write a query that returns all songs with titles that contain the word "California" in either the 1970s or 1990s.
*/
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE (year BETWEEN 1970 AND 1979 OR year BETWEEN 1990 AND 1999)
  AND song_name ILIKE '%California%';
  
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE ((year BETWEEN 1970 AND 1979) OR (year BETWEEN 1990 AND 1999))
  AND song_name ILIKE '%California%';
    
/*
Practice Problem
Write a query that lists all top-100 recordings that feature Dr. Dre before 2001 or after 2009.
*/
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE group_name ILIKE '%Dr. Dre%'
  AND (year < 2001 OR year > 2009);


-- ========================================
-- SQL NOT Operator
-- ======================================== 
-- NOT is a logical operator in SQL that you can put before any conditional statement to select rows for 
-- which that statement is false.

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND year_rank NOT BETWEEN 2 AND 3;
   
-- Return Error   
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND year_rank NOT > 3;

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND year_rank <= 3
   
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND "group_name" NOT ILIKE '%macklemore%';   
   
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND artist IS NOT NULL;   
  
/*
Practice Problem
Write a query that returns all rows for songs that were on the charts in 2013 and do not contain the letter "a".
*/
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year = 2013 
  AND song_name NOT ILIKE '%a%';


-- ========================================
-- SQL ORDER BY Operator
-- ======================================== 
-- The ORDER BY clause allows you to reorder/sort your results based on the data in one or more columns.

SELECT *
  FROM tutorial.billboard_top_100_year_end
 ORDER BY artist;
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
 ORDER BY year_rank;
 
 /*
 Practice Problem
Write a query that returns all rows from 2012, ordered by song title from Z to A.
 */
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year = 2012
ORDER BY song_name DESC;

-- ========================================
-- Ordering data by multiple columns
-- ======================================== 

-- Problem - query makes the most recent years come first but orders top-ranks songs before lower-ranked songs 
-- and show only top 3 ranks.
-- Below, data is sorted by column year first and then it is sorted by column year_rank.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank <=3
ORDER BY year DESC, year_rank ASC;

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank <=3
ORDER BY year_rank ASC, year DESC;

/*
SQL sorts your result set in the following sequence:
First, all rows are sorted by the year column in descending order (latest years first).
Second, within each group of rows with the same year, the rows are sorted by year_rank in ascending order (top ranks first).

Visually:
All rows with the largest year (e.g., 2013) come first, then the next year (2012), and so on.
Within each year, you get the lowest (best) ranks first (year_rank = 1, then 2, then 3, ...).
*/

/*
Practice Problem
Write a query that returns all rows from 2010 ordered by rank, with artists ordered alphabetically for each song.
*/
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year = 2010
ORDER BY year_rank ASC, artist ASC;

/*
Practice Problem
Write a query that shows all rows for which T-Pain was a group member, ordered by rank on the charts, 
from lowest to highest rank (from 100 to 1).
*/
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE group_Name ILIKE '%T-PAIN%'
ORDER BY year_rank DESC;
/*
Practice Problem
Write a query that returns songs that ranked between 10 and 20 (inclusive) in 1993, 2003, or 2013. 
Order the results by year and rank, and leave a comment on each line of the WHERE clause to indicate what that line does
*/
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE (year_rank BETWEEN 10 AND 20) -- songs that ranked between 10 and 20 (inclusive)
  AND (year IN (1993, 2003, 2013))  -- songs in 1993, 2003, or 2013 year
ORDER BY year ASC, year_rank ASC;   -- Order the results by year ascending and after that order results by rank ascending