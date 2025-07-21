# Project Planning Doc

---

## Table of Contents

- [Project Planning Doc](#project-planning-doc)
  - [Table of Contents](#table-of-contents)
  - [Scenario Analysis - Lash Appointment Database](#scenario-analysis---lash-appointment-database)
  - [Entities/Tables](#entitiestables)
  - [Entity Relationships](#entity-relationships)
  - [Relationship Modelling \& ERD](#relationship-modelling--erd)
  - [Database Design and Normalisation](#database-design-and-normalisation)
    - [Normalisation Steps](#normalisation-steps)
      - [Normalisation Decisions](#normalisation-decisions)
      - [Normalisation Process](#normalisation-process)
    - [Planning of Database Tables Schemas](#planning-of-database-tables-schemas)
  - [Marking Criteria](#marking-criteria)
    - [Write SQL scripts](#write-sql-scripts)
    - [Seed Data](#seed-data)
  - [Future Considerations](#future-considerations)

---

## Scenario Analysis - Lash Appointment Database

- A solo lash technician business
- Database designed to store client records, appointments, service options and payments
- Clients choose one specific service options combination (via Junction table):
- Predefined service options combinations for different categories and styles:
  - Service category: Full set / Refill / Removal Only.
  - Lash Styles: Classic / Wet Look / Hybrid / Volume.
  - Full Set x (Classic, Hybrid, Volume)
  - Refill x (Classic, Hybrid, Volume)
  - Removal x (N/A for lash style)
- Payments include amount paid and payment status
- Appointments statuses can be looked up via table to check status

---

## Entities/Tables

1. Clients
2. Appointments
3. Payments
4. Service options (junction table)
5. Service categories
6. Lash styles
7. Payment statuses (look up table)
8. Appointment statuses (look up table)

---

## Entity Relationships

| Relationship Description | Related Tables | Relationship Type |
|--------------------------|----------------|-------------------|
| One client can book one or many appointments | `clients` -> `appointments` | One-to-Many |
| One service category (Full Set, Refill, Removal) can exist in many service option entries | `service_categories` -> `service_options` | One-to-Many |
| One lash style (Classic, Hybrid, Volume) can exist in many service option entries | `lash_styles` -> `service_options` | One-to-Many |
| Each unique service option can be booked in many appointments | `service_options` -> `appointments` | One-to-Many |
| One appointment status can apply to many appointments | `appointment_statuses` -> `appointments` | One-to-Many |
| One appointment has exactly one payment record | `appointments` -> `payments` | One-to-One |
| One payment status can apply to many payments | `payment_statuses` -> `payments` | One-to-Many |

---

## Relationship Modelling & ERD

Entity Relationship Diagram (ERD) reflecting all entities and their relationships.

1. [ERD - Conceptual diagram](../erd/conceptual-erd.drawio.png)

2. [ERD - Table](../erd/final-erd-table.drawio.png)

---

## Database Design and Normalisation

Noramalise database to Third Normal Form (3NF) to avoid data redundancy and maintain data integrity in a relational database structure.

### Normalisation Steps

1. **First Normal Form (1NF):** Make everything atomic
2. **Second Normal Form (2NF):** Remove partial dependencies (make sure non-key attributes depend on full PK)
3. **Third Normal Form (3NF):** Remove transitive dependencies (all attributes depend directly on PK and not other non-key attributes)

#### Normalisation Decisions

- Ensured each entity/table stores only related attributes.
- Avoided redundancy (e.g. no repeated client details in multiple appointments).
- Reviewed data and removed any partial or transitive dependencies.

#### Normalisation Process

A key example of how I implemented normalisation to reduce data redundancy:

- Initially I had `service_category` and `lash_styles` stored in the `services` table as text, however this led to repeating values appearing across the records, causing redundnacy and potential data inconsistencies.
- To resolve this, I separated them into their own look up tables and created a junction table for `service_options` and connected them using foreign keys.
- The `service_options` table now reflects a unique combination of the `service_categories` and `lash_styles`, each with their own corresponding price and duration (mins).
- Price and duration belong in `service_options` table because their values depend on the full combination of both service category and lash style (not on either one independently).
- This process removed data duplication to help maintain data consistency and also allows for flexibility to expand in future (e.g. easily add new lash styles without structural changes).

---

### Planning of Database Tables Schemas

**clients** - (Stores client's basic contact info)

- client_id SERIAL PK
- first_name VARCHAR(50) NOT NULL
- last_name VARCHAR(50) NOT NULL
- mobile_number VARCHAR(10) NOT NULL
- email VARCHAR(100) UNIQUE NOT NULL

**service_categories** - (Look up table - Category options: Full Set, Refill, Removal)

- service_category_id SERIAL PK
- category_name VARCHAR(50) UNIQUE NOT NULL
- category_description TEXT

**lash_styles** - (Look up table - Style options: Classic, Hybrid, Volume, N/A (for removal service))

- lash_style_id SERIAL PK
- style_name VARCHAR(50) UNIQUE NOT NULL
- style_description TEXT

**service_options** - (Junction table - This table connects service_category and lash_styles with pricing and duration)

- service_option_id SERIAL PK
- service_category_id INT FK to service_categories
- lash_style_id INT FK to lash_styles
- price NUMERIC(8,2) NOT NULL CHECK(price > 0)
- duration_minutes INT NOT NULL CHECK(duration_minutes > 0)
- UNIQUE(service_category_id, lash_style_id)

**appointment_statuses** - (Look up table - Status Options: Confirmed, Cancelled, No Show)

- appointment_status_id INT PK
- appointment_status_name VARCHAR(20) UNIQUE NOT NULL

**appointments** - (Main table)

- appointment_id SERIAL PK
- client_id INT NOT NULL FK to clients
- service_option_id INT NOT NULL FK to service_option
- appointment_datetime TIMESTAMP NOT NULL
- appointment_status_id INT NOT NULL FK to appointment_statuses DEFAULT 1 (as 'Confirmed' when booked)

**payment_statuses** (Look up table - Status Options: Pending, Paid, No Payment (for cancellations/no shows))

- payment_status_id INT (PK)
- payment_status_name VARCHAR(20) UNIQUE NOT NULL

**payments**

- payment_id SERIAL PK
- appointment_id INT NOT NULL FK to appointments
- amount_paid NUMERIC(8,2) NOT NULL CHECK(amount_paid >= 0)
- payment_date DATE NOT NULL
- payment_status_id INT NOT NULL FK to payment_statuses DEFAULT 1 (as 'Pending' updates to 'Paid' when client pays) -->

---

## Marking Criteria

The database script(s) your create must cover these functionalities:

1. create the tables mapped out by the ERD
2. create ‘seed’ data in each of the tables
3. query a table for a single record
4. query joined tables for a single record
5. insert a record into a table
6. insert a record into a table with appropriate foreign-key data
7. update a record in a table
8. delete a record from a table
9. order data by a specific value
10. calculate data based on values from tables
11. filtering data based on a specific value
12. usage of appropriate automated data creation such as default or auto-incrementing values

---

### Write SQL scripts

- Query Examples/Ideas:
  - View all confirmed appointments this week (filter by date range)
  - Count total number of appointments per client
  - All appointments for a specific lash style
  - Count of cancelled appointments
  - Filter appointments by service category (Full Set or Refill only)
  - Calculate sum of amount_paid where status = 'Paid'
  - Aggregate function to calculate total revenue week/month
  - Aggregate function to calculate and count/sort client retention/loyalty visits/duration working
  - Filter select queries like full sets vs refills
  - Find appointment status e.g. cancelled/no-shows

### Seed Data

- [Seed Data](../sql-scripts/3_create_seed_data.sql)
- Include data for full sets, refills after approx. 2-3 weeks and removals

---

## Future Considerations

- Add cancelled_at timestamp (to track cancellation notice when enforcing cancellation policy)
- Explore logic on how to use appointment start times and end times based on service duration to avoid overlapping appointments
- Current project for solo lash artist but can be expanded to add additional artists
- Loyalty program tracking
