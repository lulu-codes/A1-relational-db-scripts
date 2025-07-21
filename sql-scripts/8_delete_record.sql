-- delete_record.sql
-- delete a record from a table


-- 1. delete old appt that is a no shows and delete payment record

-- query no show appts list first
-- SELECT
--     a.appointment_id,
--     a.appointment_datetime,
--     c.first_name,
-- FROM appointments a
-- JOIN clients c ON a.client_id = c.client_id
-- WHERE a.appointment_status_id = 3;      -- 3 = No Show

--  appointment_id | appointment_datetime | first_name | last_name
-- ----------------+----------------------+------------+-----------
--               3 | 2025-07-03 14:30:00  | Denise     | Vo
--               9 | 2025-07-19 15:15:00  | Jennifer   | Lee
-- (2 rows)


-- Just deleting Denise's most oldest appt
DELETE FROM appointments
WHERE appointment_id IN (3);
