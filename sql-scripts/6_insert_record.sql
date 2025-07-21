-- insert_record.sql
-- insert a record into a table

-- 1. add new client record for Lilly

-- serach first if shes an existing client
-- SELECT * FROM clients
-- WHERE first_name = 'Lilly';
-- (no rows)

-- insert Lilly's record details
INSERT INTO clients (first_name, last_name, mobile_number, email)
VALUES ('Lilly', 'Vo', '0412345678', 'lilly@gmail.com');
-- (Added and queries again to check if data recorded. Lilly client_id = 11)


-- insert a record into a table with appropriate foreign-key data
-- 2. add new appt for lilly (client_id = 11) - book for full set volume service_option = 3)
INSERT INTO appointments (client_id, service_option_id, appointment_datetime, appointment_status_id)
VALUES (11, 3, '2025-08-01 14:00', 1);

-- (Added new appt and checked data record in script #2 in 5_query_joined_tables.sql)
