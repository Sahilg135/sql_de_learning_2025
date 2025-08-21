-- db/ddl/002_set_search_path.sql
-- Run connected to database: sql_de_lab
ALTER DATABASE sql_de_lab SET search_path = tutorial, public;
-- For current session (optional but convenient):
SET search_path = tutorial, public;
