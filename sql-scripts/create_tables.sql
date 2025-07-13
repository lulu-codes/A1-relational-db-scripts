-- create_tables.sql

-- create the tables mapped out by the ERD (min 5 + junction table)
-- drop tables in reverse dependency order

DROP TABLE IF EXISTS appointment_add_on;
DROP TABLE IF EXISTS add_on;
DROP TABLE IF EXISTS appointment;
DROP TABLE IF EXISTS service_menu;
DROP TABLE IF EXISTS client;

-- Create client table
CREATE TABLE client (
    client_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    mobile_number VARCHAR(10) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Create service_menu table
CREATE TABLE service_menu (
    service_menu_id SERIAL PRIMARY KEY,
    menu_name VARCHAR(100) NOT NULL,
    service_category VARCHAR(50) NOT NULL,          -- Full Set / Refill / Removal Only
    lash_style VARCHAR(50) NOT NULL,                         -- Classic / Hybrid / Volume
    duration_minutes INTEGER CHECK (duration_minutes > 0),
    price NUMERIC CHECK (price > 0)
);

-- Create appointment table
CREATE TABLE appointment (
    appointment_id SERIAL PRIMARY KEY,
    client_id INT NOT NULL,
    service_menu_id INT NOT NULL,
    appointment_datetime TIMESTAMP NOT NULL,
    appointment_status VARCHAR(20) DEFAULT 'Confirmed'      -- Default appointment booking status set as Confirmed, unless modified to 'Cancelled' or 'No Show'
        CHECK (appointment_status IN ('Confirmed', 'Cancelled', 'No Show')),
    FOREIGN KEY (client_id) REFERENCES client(client_id) ON DELETE CASCADE,
    FOREIGN KEY (service_menu_id) REFERENCES service_menu(service_menu_id) ON DELETE CASCADE
);

-- Create add_on table
CREATE TABLE add_on (
    add_on_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    price NUMERIC CHECK (price >= 0)
);

-- Create appointment_add_on junction table (many-to-many)
CREATE TABLE appointment_add_on (
    appointment_id INT,
    add_on_id INT,
    PRIMARY KEY (appointment_id, add_on_id),        -- Composite keys
    FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id) ON DELETE CASCADE,
    FOREIGN KEY (add_on_id) REFERENCES add_on(add_on_id) ON DELETE CASCADE
);
