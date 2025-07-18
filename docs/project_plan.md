# Project Planning Notes for Lash Appointment Database

## Project Folder Structure:

```
A1-relational-db-scripts/
├── erd/                # Diagrams for ERD
├── sql-scripts/        # SQL scripting files
├── seed-data/          # SQL seed data scripts and mock data
├── docs/               # Project plan and doc notes
├── README.md           # Project overview doc (this file)
└── .gitignore          # To udpate
```

## Scenario Analysis:

- Solo lash artist business structure
- Clients book appointments by selecting an option from the Service option and makes payment
- Service option allows clients to choose a specific service combination:
  - Service option acts as a junction table linking:
      - Service category: Full set / Refill / Removal Only.
      - Lash Styles: Classic / Wet Look / Hybrid / Volume.
      - Price
      - Duration (in minutes)
- Payments can be tracked by amount paid and payment status


## Entities & Relationships:

- Identify entities, attributes, relationships and business rules.
- Design a database with at least 5 tables including one join/junction table.
  - Clients
  - Appointments
  - Services + Service option (junction table)
  - Payments
  - Status look up tables

## Relationship Modelling & ERD:

Entity Relationship Diagram (ERD) reflecting all entities and their relationships.
- [ERD - Conceptual diagram](../erd/conceptual-erd.drawio.png)
- [ERD - Table](../erd/final-erd-table.drawio.png)
- Use of appropriate keys including primary and foreign keys

## Database Design & Normalisation:

Noramalise database to Third Normal Form (3NF) to avoid data redundancy and maintain data integrity in a relational database structure.

### Normalisation Steps:
1. First Normal Form (1NF): Make everything atomic
2. Second Normal Form (2NF): Remove partial dependencies (make sure non-key attributes depend on full PK)
3. Third Normal Form (3NF): Remove transitive dependencies (all attributes depend directly on PK and not other non-key attributes)

<!-- moved to README.md
### Normalisation Decisions:
- Ensured each entity/table stores only related attributes.
- Avoided redundancy (e.g. no repeated client details in multiple appointments).
- Reviewed data and removed any partial or transitive dependencies.

### Normalisation process to reduce data redundancy:
- Initially I had `service_category` and `lash_styles` stored in the `services` table as text, however this led to repeating values appearing across the records, causing redundnacy and potential data inconsistencies.
- To resolve this, I separated them into their own look up tables and created a junction table for `service_option` and connected them using foreign keys.
- The `service_option` table now reflects a unique combination of the `service_categories` and `lash_styles`, each with their own corresponding price and duration (mins).
- Price and duration belong in `service_option` table because their values depend on the full combination of both service category and lash style (not on either one independently).
- This process removed data duplication to help maintain data consistency and also allows for flexibility to expand in future (e.g. easily add new lash styles without structural changes). -->

<!--
draft planning
## Table Outline & Attributes:

Include appropriate keys and add relevant constraints:
- `PRIMARY KEY` – All tables have unique IDs.
- `FOREIGN KEY` – Used to link related tables (appointments, payments, add-ons).
- `NOT NULL` – Required fields like names, appointment datetime.
- `DEFAULT` – Use for common statuses.
- `CHECK` – Prevents negative prices or payments.
- `UNIQUE` – Ensures no duplicate emails or add-on names.


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

**payments** -
- payment_id SERIAL PK
- appointment_id INT NOT NULL FK to appointments
- amount_paid NUMERIC(8,2) NOT NULL CHECK(amount_paid >= 0)
- payment_date DATE NOT NULL
- payment_status_id INT NOT NULL FK to payment_statuses DEFAULT 1 (as 'Pending' updates to 'Paid' when client pays) -->

**Relationships & Cardinalities:**
- One client can book one/many appointments = `clients` - `appointments` (One-to-many)
- One service category (Full Set, Refill, Removal) can be in many Service option entries =  `service_categories` - `service_option` (One-to-many)
- One lash style (Classic, Hybrid,Volume) can be in many Service option entries = `lash_styles` - `service_option` (One-to-many)
- Each unqiue Service option combination can be booked in many appointments = `service_option` - `appointments` (One-to-many)
- One appointment status can apply to many appointments = `appointment_statuses` - `appointments` (One-to-many)
- One appointment has one payment record = `appointments` - `payments` (One-to-one)
- One payment status applied to many payments = `payment_statuses` - `payments` (One-to-many)


## Write SQL scripts

- Test with queries
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

Requirements:
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


## Sample Seed Data

- [Seed Data](./seed-data/create_seed_data.sql)
- Include realistic scenarios including refills after 2 weeks
- Refills booked outside retention windows (<10 days or >3 weeks)
- Appointments for different categories and styles:
  - Full Set x (Classic, Hybrid, Volume)
  - Refill x (Classic, Hybrid, Volume)
  - Removal x (N/A for lash style)


### Future Considerations:
- Add cancelled_at timestamp (to track cancellation notice when enforcing cancellation policy)
- Explore logic on how to use appointment start times and end times based on service duration to avoid overlapping appointments
- Current project for solo lash artist but can be expanded to add additional artists
- Loyalty program tracking


