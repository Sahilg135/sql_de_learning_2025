-- Run connected to database: sql_de_lab
-- Optional but tidy: default to tutorial first, then public
ALTER DATABASE sql_de_lab SET search_path = tutorial, public;
-- Apply for current session too (harmless if not supported by your tool):
SET search_path = tutorial, public;
