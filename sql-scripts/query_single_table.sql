-- query_single_table.sql

-- query a table for a single record

-- 1. query client table for record by client name

SELECT * FROM clients
WHERE first_name = 'Denise';

SELECT * FROM clients
WHERE first_name LIKE 'denise';
