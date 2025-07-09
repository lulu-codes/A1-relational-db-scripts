# Lash Business Database Project – Planning Stage (DRAFT)

## **Lash Business Appointment System Overview**

- Lash appointments includes a client, service, mapping styles (optional), payments and add-ons (optional).
- Solo lash artist
- Clients can book for different lash services:
  - Lash Services: Full set / Refill / Removal Only.
  - Lash Styles: Classic / Wet Look / Hybrid / Volume.
- Mapping styles are not fixed to services and vary per appointment (based on client preference).
- Each appointment can have optional mapping style: Natural / Cat eye / Doll eye.
- Lash Removal Only is its own standalone service, not an add-on.
- Some services like removal do not require a mapping style.
- Appointment can have optional add-ons: Wispy spikes / Cleanser kit / Removal with full set.
- Every appointment requires a payment with status: Paid / Pending / Failed.

## To Do:

- Detail normalisation process in notes.
- Use draw.io to create ERD and include diagram in ERD folder.
- ERD to include all entities and their relationships (one-to-many, many-to-many).
- Draft table definitions and constraints.
- Ensure ERD matches planned schema before writing scripts.
- Write sample data and test queries.

## **Data Normalisation**

- Plan to normalise to at least 3NF (or higher)
- Avoid redundancy (don’t repeat client details in every appointment).
- Ensure each entity/table stores only related attributes.
- Will review attributes and relationships for possible partial and transitive dependencies before finalising schema.

## **ERD - Entities & Attributes**
Draft

1. **clients:** Stores customer contact info
    - client_id (PK)
    - first_name
    - last_name
    - phone
    - email (UNIQUE)

2. **services:** Lash services and styles offered.
    - service_id (PK)
    - service_type (Full set / Refill / Removal Only)
    - service_style (Classic / Wet Look / Hybrid / Volume)
    - price
    - duration_minutes

3. **mapping_styles:** Lash mapping options.
    - mapping_style_id (PK)
    - style_name (Natural / Cat eye / Doll eye)

4. **appointments:** Individual bookings (core table linking clients to services and mapping styles).
    - appointment_id (PK)
    - client_id (FK)
    - service_id (FK)
    - mapping_style_id (FK, nullable)
    - appointment_datetime
    - status (Confirmed / Pending / Cancelled)

5. **add_ons:** Optional extras for appointments.
    - add_on_id (PK)
    - name
    - price

6. **appointment_add_ons:** Junction table linking appointments and add-ons (many-to-many).
    - appointment_id (FK)
    - add_on_id (FK)
    - Composite PK: appointment_id and add_on_id

7. **payments:** Payment record linked to appointments.
    - payment_id (PK)
    - appointment_id (FK)
    - amount_paid
    - payment_method (Cash / Card / Transfer)
    - paid_on_date
    - payment_status (Paid / Pending / Failed)

**Notes:**

- Mapping style is only set if needed (nullable FK).
- Add-ons are optional and can be zero or more per appointment.
- Add relevant constraints:
  - `PRIMARY KEY` – All tables have unique IDs.
  - `FOREIGN KEY` – Used to link related tables (appointments, payments, add-ons).
  - `NOT NULL` – Required fields like names, appointment datetime.
  - `DEFAULT` – Use for common statuses.
  - `CHECK` – Prevents negative prices or payments.
  - `UNIQUE` – Ensures no duplicate emails or add-on names.


### Write SQL scripts

- Write SQL scripts for schema and sample data.

### Write SQL Queries

- Test with queries

## Assessment Checklist:

**Design requirements:**

The database must contain:

- At least 5 tables (using 7)
- Appropriate relationships between tables
- At least one join/junction table (appointment_add_ons)
- ERD representing the database
- Database matches ERD
- Tables normalised to 3NF or higher

**Programming requirements:**

The database script(s) your create must cover these functionalities:

- create the tables mapped out by the ERD
- create ‘seed’ data in each of the tables
- query a table for a single record
- query joined tables for a single record
- insert a record into a table
- insert a record into a table with appropriate foreign-key data
- update a record in a table
- delete a record from a table
- order data by a specific value
- calculate data based on values from tables
- filtering data based on a specific value
- usage of appropriate automated data creation such as default or auto-incrementing values
