-- aggregate_functions.sql
-- query retrieving data from database and use SUM/AVERAGE/MIN/MAX/other operation - data parsed and aggregated.
-- Refer to 10_filter_group_order.sql for complex queries


-- 1. calculate sum of paid amounts to work out funds received or calculate total revenue on amount_paid where status is 'Paid' in db
SELECT SUM(amount_paid) AS total_revenue
FROM payments p
JOIN payment_statuses ps ON p.payment_status_id = ps.payment_status_id
WHERE ps.status_name = 'Paid';

--  total_revenue
-- ---------------
--         740.00
-- (1 row)


-- 2. query min/max service menu prices
SELECT
    MIN(service_price) AS cheapest_service,
    MAX(service_price) AS most_expensive_service
FROM service_options;

--  cheapest_service | most_expensive_service
-- ------------------+------------------------
--             30.00 |                 120.00
-- (1 row)


-- 3. query average days between booked appts for each client (refill usually 2 weeks apart)
SELECT AVG(amount_paid) AS avg_payment_amount
FROM payments p
JOIN payment_statuses ps ON p.payment_status_id = ps.payment_status_id
WHERE ps.status_name = 'Paid';

--  avg_payment_amount
-- ---------------------
--  82.2222222222222222
-- (1 row)


-- 4. count number of cancelled or no show appts
SELECT COUNT(*) AS cancelled_or_no_show_appts_count
FROM appointments a
JOIN appointment_statuses ast ON a.appointment_status_id = ast.appointment_status_id
WHERE ast.status_name IN ('Cancelled', 'No Show');

-- cancelled_or_no_show_appts_count
-- ----------------------------------
-- total count = 3
