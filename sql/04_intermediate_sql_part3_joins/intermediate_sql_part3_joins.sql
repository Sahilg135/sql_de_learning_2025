-- ========================================
-- -- SQL Joins with Comparison Operators
-- ========================================   
-- Example using > to join only investments that occurred more than 5 years after each company's founding year:
SELECT companies.permalink,
       companies.name,
       companies.status,
       COUNT(investments.investor_permalink) AS investors
FROM tutorial.crunchbase_companies companies
LEFT JOIN tutorial.crunchbase_investments_part1 investments
ON companies.permalink = investments.company_permalink
AND investments.funded_year > companies.founded_year + 5
GROUP BY companies.permalink, companies.name, companies.status;
-- Rows = 27326

/*
It's important to note that this produces a different result than the following query because 
it only joins rows that fit the investments.funded_year > companies.founded_year + 5 condition 
rather than joining all rows and then filtering:
*/
SELECT companies.permalink,
       companies.name,
       companies.status,
       COUNT(investments.investor_permalink) AS investors
FROM tutorial.crunchbase_companies companies
LEFT JOIN tutorial.crunchbase_investments_part1 investments
ON companies.permalink = investments.company_permalink
WHERE investments.funded_year > companies.founded_year + 5
GROUP BY companies.permalink, companies.name, companies.status;
-- With WHERE clause, Rows will be definitely less than above count, 27326.
-- Rows = 2870


-- ========================================
-- -- SQL Joins on Multiple Keys
-- ========================================   

SELECT companies.permalink,
       companies.name,
       investments.company_name,
       investments.company_permalink
FROM tutorial.crunchbase_companies companies
LEFT JOIN tutorial.crunchbase_investments_part1 investments
ON companies.permalink = investments.company_permalink
AND companies.name = investments.company_name;

/*
There are couple reasons you might want to join tables on multiple foreign keys. 
1. The first has to do with accuracy.
2. The second reason has to do with performance. 
    - SQL uses "indexes" (essentially pre-defined joins) to speed up queries.
    - it can occasionally make your query run faster to join on multiple fields, even when it does not add to the 
        accuracy of the query. 
    - For example, the results of the following query will be the same with or without the last line. 
    - However, it is possible to optimize the database such that the query runs more quickly with the last line included:
*/

-- ========================================
-- -- SQL Self Joins
-- ========================================   
-- Let’s say you wanted to identify companies that received an investment from Great Britain following an investment from Japan.

SELECT DISTINCT 
                japan_investments.company_name,
                japan_investments.company_permalink
FROM tutorial.crunchbase_investments_part1 japan_investments
JOIN tutorial.crunchbase_investments_part1 gb_investments
ON japan_investments.company_name = gb_investments.company_name
AND gb_investments.investor_country_code = 'GBR'
AND gb_investments.funded_at > japan_investments.funded_at
WHERE japan_investments.investor_country_code = 'JPN'
ORDER BY japan_investments.company_name;

/*
- Not understood
- Note how the same table can easily be referenced multiple times using different aliases—in this case, 
    japan_investments and gb_investments.
*/