-- query_joined_tables.sql

-- query joined tables for a single record (2x complex queries which join tables together)
-- (also used aggregate functions)

-- 1. query for retrieving info for Denise's scheduled appts
-- need client first name + appt datetime + service category + lash style
-- from clients link join to appt > service options for appts > category name > lash style > WHERE clients name is Denise
SELECT
    c.first_name,
    a.appointment_datetime,
    sc.category_name,
    ls.style_name
FROM clients c
JOIN appointments a ON c.client_id = a.client_id
JOIN service_options so ON a.service_option_id = so.service_option_id
JOIN service_categories sc ON so.service_category_id = sc.service_category_id
JOIN lash_styles ls ON so.lash_style_id = ls.lash_style_id
-- WHERE c.first_name = 'Denise'
WHERE a.client_id = 2
-- LIMIT 1;
ORDER BY a.appointment_datetime ASC    -- get single record (earliest appt)
LIMIT 1;


-- 2. query joined tables by checking if added new appt for lilly (client_id = 11) from insert_record.sql is booked correctly for full set volume service_option = 3)
-- INSERT INTO appointments (client_id, service_option_id, appointment_datetime, appointment_status_id)
-- VALUES (11, 3, '2025-08-01 14:00', 1);

-- (Used basic join to check appt added first)
-- SELECT
--     a.appointment_datetime,
--     ast.status_name AS appointment_status
-- FROM appointments a
-- JOIN appointment_statuses ast ON a.appointment_status_id = ast.appointment_status_id
-- WHERE a.client_id = 11
-- ORDER BY a.appointment_datetime;

-- (Complex join to check appt booked correctly)
SELECT
    c.first_name,
    a.appointment_datetime,
    sc.category_name,
    ls.style_name,
    ast.status_name AS appt_status
FROM appointments a
JOIN clients c ON a.client_id = c.client_id
JOIN service_options so ON a.service_option_id = so.service_option_id
JOIN service_categories sc ON so.service_category_id = sc.service_category_id
JOIN lash_styles ls ON so.lash_style_id = ls.lash_style_id
JOIN appointment_statuses ast ON a.appointment_status_id = ast.appointment_status_id
-- WHERE a.client_id = 'Lilly';
WHERE a.client_id = 11;

