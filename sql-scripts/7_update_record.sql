-- update_record.sql
-- update a record in a table


-- 1. update a client name (example scenario where I spelt Lilly with two 'l' instead of one - update first name and email)
-- Check first:
-- SELECT * FROM CLIENTS;
-- Returned: 11 | Lilly      | Vo        | 0412345678    | lilly@gmail.com


UPDATE clients
SET first_name = 'Lily', email = 'lily@gmail.com'
-- WHERE client_id = 'Lilly';
WHERE client_id = '11'

-- (Checked)         11 | Lily       | Vo        | 0412345678    | lily@gmail.com

