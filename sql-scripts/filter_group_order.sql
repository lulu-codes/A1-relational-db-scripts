-- filter_group_order.sql

-- order data by a specific value
-- calculate data based on values from tables
-- filtering data based on a specific value


-- 3x functional complex queries which involve the selecting, filtering, grouping and ordering of data

-- sql execution order: FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY

-- 1. filter appts by confirmed appt status for time range (for next week) and order by date
-- SELECT * FROM appts > (JOIN) > WHERE status is 'Confirmed' > narrow down between date and > ORDER by appt date in ASC order (ASC = deafult)
SELECT
    a.appointment_id,
    c.first_name,
    a.appointment_datetime,
    ast.status_name
FROM appointments a
JOIN clients c ON a.client_id = c.client_id
JOIN appointment_statuses ast ON a.appointment_status_id = ast.appointment_status_id
WHERE ast.status_name = 'Confirmed'
  AND a.appointment_datetime BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '7 days'
ORDER BY a.appointment_datetime ASC;


--  appointment_id | first_name | appointment_datetime | status_name
-- ----------------+------------+----------------------+-------------
--               7 | Stephanie  | 2025-07-22 13:00:00  | Confirmed
--              11 | Patricia   | 2025-07-24 10:00:00  | Confirmed
-- (2 rows)


-- 2. count number of appointments grouped by lash styles and order descending by count
-- SELECT service category and COUNT * > FROM appts > need to join service menu and service category/lash style > GROUP by service category or by lash style > ORDER BY count

SELECT
    ls.style_name,
    COUNT(*) AS appointment_count
FROM appointments a
JOIN service_options so ON a.service_option_id = so.service_option_id
JOIN lash_styles ls ON so.lash_style_id = ls.lash_style_id
GROUP BY ls.style_name
ORDER BY appointment_count DESC;

--  style_name | appointment_count
-- ------------+-------------------
--  Volume     |                 6
--  Classic    |                 6
--  Hybrid     |                 4
--  N/A        |                 1
-- (4 rows)


-- 3. clients who have spent more than $100 in total paid payments
SELECT
    c.client_id,
    c.first_name,
    SUM(p.amount_paid) AS total_spent
FROM clients c
JOIN appointments a ON c.client_id = a.client_id
JOIN payments p ON a.appointment_id = p.appointment_id
GROUP BY c.client_id, c.first_name
HAVING SUM(p.amount_paid) > 100
ORDER BY total_spent DESC;


--  client_id | first_name | total_spent
-- -----------+------------+-------------
--          6 | Patricia   |      230.00
--          9 | Teresa     |      185.00
--          4 | Stephanie  |      170.00
--          1 | Margaret   |      140.00
--         10 | Sandra     |      110.00
-- (5 rows)
