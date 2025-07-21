-- 2_seed_look_up_tables.sql

-- (Separated predefined attribute fields from create_tables.sql into this file to run after)

-- SEED DATA FOR PREDEFINED LOOK UP TABLE ATTRIBUTE/FIELDS:


-- lash_styles (used in service_options)
INSERT INTO lash_styles (style_name, style_description) VALUES
('Classic', 'Natural one-to-one application'),
('Hybrid', 'Mix of classic and volume'),
('Volume', 'Fuller volume lashes'),
('N/A', 'Used for removals');


-- service_categories (used in service_options)
INSERT INTO service_categories (category_name, category_description) VALUES
('Full Set', 'Full set of lashes'),
('Refill', 'Lash refills'),
('Removal', 'Lash removal service only');


-- appointment_statuses
INSERT INTO appointment_statuses (status_name) VALUES
('Confirmed'), ('Cancelled'), ('No Show');


-- payment_statuses
INSERT INTO payment_statuses (status_name) VALUES
('Pending'), ('Paid'), ('No Payment');


-- service_options (Junction table: category + style (unique combos) + price + duration)
INSERT INTO service_options (service_category_id, lash_style_id, service_price, duration_minutes) VALUES
(1, 1, 80.00, 120),     -- Full Set Classic
(1, 2, 95.00, 130),     -- Full Set Hybrid
(1, 3, 110.00, 150),    -- Full Set Volume
(2, 1, 60.00, 90),      -- Refill Classic
(2, 2, 90.00, 100),     -- Refill Hybrid
(2, 3, 120.00, 120),    -- Refill Volume
(3, 4, 30.00, 30);      -- Removal only (no style aplicable = N/A)
