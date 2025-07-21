-- 3_create_seed_data.sql

-- create ‘seed’ data in each of the tables

-- SEED DATA FOR CORE TABLES:

-- clients table

INSERT INTO clients (first_name, last_name, mobile_number, email) VALUES
('Margaret', 'Johnson', '0468312193', 'margaret@gmail.com'),
('Denise', 'Vo', '0495598979', 'denise@gmail.com'),
('Nancy', 'Drew', '0414779484', 'nancy@gmail.com'),
('Stephanie', 'Miller', '0495692843', 'stephanie@gmail.com'),
('Jennifer', 'Lee', '0415365191', 'jennifer@gmail.com'),
('Patricia', 'Lewis', '0472429162', 'patricia@gmail.com'),
('Cynthia', 'Tran', '0450554092', 'cynthia@gmail.com'),
('Jessica', 'Nguyen', '0467633324', 'dorothy@gmail.com'),
('Teresa', 'Jones', '0487880154', 'teresa@gmail.com'),
('Sandra', 'Smith', '0457250645', 'sandra@gmail.com');


-- appointment table for clients appts

INSERT INTO appointments (client_id, service_option_id, appointment_datetime, appointment_status_id) VALUES
-- Margaret:
(1, 1, '2025-07-01 10:00', 1),      -- Booked Full Set Classic
(1, 4, '2025-07-15 10:00', 1),      -- Booked follow up Refill Classic

-- Denise:
(2, 2, '2025-07-03 14:30', 3),      -- Booked Full Set Hybrid (No Show)
(2, 6, '2025-07-18 14:15', 1),      -- Booked follow up Refill Volume

-- Nancy:
(3, 3, '2025-07-05 09:00', 2),      -- Booked Full Set Volume (Cancelled)

-- Stephanie:
(4, 1, '2025-07-07 11:45', 1),      -- Booked Full Set Classic
(4, 5, '2025-07-22 13:00', 1),      -- Booked follow up Refill Hybrid

-- Jennifer:
(5, 2, '2025-07-08 15:15', 1),      -- Booked Full Set Hybrid
(5, 4, '2025-07-19 15:15', 3),      -- Booked follow up Refill Classic (No Show)

-- Patricia:
(6, 3, '2025-07-10 09:45', 1),      -- Booked Full Set Volume
(6, 6, '2025-07-24 10:00', 1),      -- Booked follow up Refill Volume

-- Cynthia:
(7, 7, '2025-07-12 16:30', 1),      -- Booked Removal only (no style applicable - N/A)

-- Jessica:
(8, 1, '2025-07-14 13:45', 1),      -- Booked Full Set Classic
(8, 4, '2025-07-29 14:00', 2),      -- Booked follow up Refill Classic (Cancelled)

-- Teresa:
(9, 2, '2025-07-15 10:30', 1),      -- Booked Full Set Hybrid
(9, 5, '2025-07-30 10:45', 1),      -- Booked follow up Refill Hybrid

-- Sandra:
(10, 3, '2025-07-17 11:15', 1);     -- Booked Full Set Volume


-- payments table

INSERT INTO payments (appointment_id, amount_paid, payment_date, payment_status_id) VALUES
-- Margaret:
(1, 80.00, '2025-07-01', 2),     -- Paid for Full Set Classic
(2, 60.00, '2025-07-15', 2),     -- Paid for Refill Classic

-- Denise:
(3, 95.00, '2025-07-03', 2),     -- Paid for Full Set Hybrid
(4, 0.00,  '2025-07-18', 3),     -- No Payment for Refill Volume (No Show)

-- Nancy:
(5, 0.00,  '2025-07-05', 3),     -- No Payment for Full Set Volume (Cancelled)

-- Stephanie:
(6, 80.00, '2025-07-07', 2),     -- Paid for Full Set Classic
(7, 90.00, '2025-07-22', 1),     -- Pending for Refill Hybrid (Future scheduled appt)

-- Jennifer:
(8, 95.00, '2025-07-08', 2),     -- Paid for Full Set Hybrid
(9, 0.00,  '2025-07-23', 3),     -- No Payment for Refill Classic (No Show)

-- Patricia:
(10, 110.00, '2025-07-10', 2),   -- Paid for Full Set Volume
(11, 120.00, '2025-07-24', 1),   -- Pending Refill Volume (Future scheduled appt)

-- Cynthia:
(12, 30.00, '2025-07-12', 2),    -- Paid for Removal (N/A style)

-- Jessica:
(13, 80.00, '2025-07-14', 2),    -- Paid for Full Set Classic
(14, 0.00,  '2025-07-29', 3),    -- No Payment Refill Classic (Cancelled)

-- Teresa:
(15, 95.00, '2025-07-15', 2),    -- Paid for Full Set Hybrid
(16, 90.00, '2025-07-30', 1),    -- Pending Refill Hybrid (Future scheduled appt)

-- Sandra:
(17, 110.00, '2025-07-17', 2);   -- Paid for Full Set Volume
