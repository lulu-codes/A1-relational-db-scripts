# Lash Business Database Project – Planning Stage (DRAFT)

## **Lash Business Appointment System Overview**

- Client books appointment selecting service and can add optional add-ons to appointment.
- Solo lash artist
- Clients can book for different lash services:
  - Lash Services: Full set / Refill / Removal Only.
  - Lash Styles: Classic / Wet Look / Hybrid / Volume.
- Lash Removal Only is its own standalone service, not an add-on.
- Appointment can have optional add-ons: Wispy spikes / Cleanser kit / Removal with full set.

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
min 5x tables:

### 1. **client** - Stores client's personal/contact info.

- client_id (PK, SERIAL)
- first_name (NOT NULL)
- last_name (NOT NULL)
- mobile_number (VARCHAR(10))
- email (UNIQUE)

**Relationships:**
- A Client can *BOOK* many Appointments (One-to-many)


### 2. **appointment** - Individual client bookings (main relationship table).

- appointment_id (PK)
- client_id (FK)
- service_menu_id (FK)
- appointment_datetime (TIMESTAMP, NOT NULL) - date & time of booking selected by the client
- appointment_status (DEFAULT 'Confirmed', CHECK for Confirmed / Cancelled / No Show)

**Relationships:**
- Many appointments can *SELECT* one service menu option (for each appoitnment)


### 3. **service_menu** - Lash services and styles.

- service_menu_id (PK, SERIAL)
- menu_name  service_category VARCHAR(50) NOT NULL (e.g. Full Set Classic) =
- service_category (Full Set / Refill / Removal Only)
- lash_style (VARCHAR(50), NOT NULL) - (e.g. Classic / Hybrid / Volume)
- price (NUMERIC, CHECK > 0)
- duration_minutes (INTEGER, CHECK > 0)


### 4. **add_on** - Optional add-ons to appointment.

- add_on_id (PK)
- name VARCHAR(100) NOT NULL UNIQUE(e.g. wispy spikes/cleanser kit)
- price (NUMERIC, CHECK ≥ 0)


### 5. **appointment_add_on** - Junction table linking appointments and add-ons (many-to-many).

- appointment_id (FK)
- add_on_id (FK)
- Composite keys: appointment_id and add_on_id


## Notes:

Add relevant constraints:

- `PRIMARY KEY` – All tables have unique IDs.
- `FOREIGN KEY` – Used to link related tables (appointments, payments, add-ons).
- `NOT NULL` – Required fields like names, appointment datetime.
- `DEFAULT` – Use for common statuses.
- `CHECK` – Prevents negative prices or payments.
- `UNIQUE` – Ensures no duplicate emails or add-on names.


### Write SQL scripts

Query examples:

- View all confirmed appointments this week (filter by date range)
- Find total number of appointments per client (to review retention rates)
- Aggregate function to calculate total revenue week/month
- Aggregate function to calculate and count/sort client retention/loyalty visits/duration working
- Filter refills booked less than expected retention window (<10 days/1.5 weeks)
- Filter refills booked outside retention window (>21 days/3 weeks)
- Filter select queries like full sets vs refills
- Find appointment status e.g. cancelled/no-shows

[SQL Scripts Folder](./sql-scripts/)

- Test with queries

### Sample Seed Data

[Seed Data Folder](./seed-data/seed_data.sql)
- Include realistic scenarios including refills after 2 weeks
- Refills booked outside retention windows (<10 days or >3 weeks)
- No add-ons selected for Removal Only services

## Notes & Documentation

- (Update project plan - summarise design rationale)


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
