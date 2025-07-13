# DEV1002 (A1) - Relational Database Scripts

## Overview

## Assessment Purpose & Learning Outcomes

This project demonstrates my ability to design and implement a normalised relational database using SQL.
The purpose of this project is to design and implement a normalised relational database showcasing my knowledge of database design, normalisation, SQL scripting, data integrity and data manipulation at a fundamental level.

The project is based on a Solo Lash Business Appointment System, inspired by a personal hobby I’m exploring. Designing the database around this idea gave me a chance to model realistic booking, service and payment workflows while creating a foundation that I can build on for future projects.

It is designed to demonstrate my ability to:

- **Scenario Analysis:** Identify entities, relationships and business rules.
- **Schema Design & Normalisation:** Apply 3NF normalisation to reduce redundancy and maintain data integrity.
- **SQL Scripting**: Write SQL scripts to:
  - Create all tables as defined in the ERD
  - Apply appropriate constraints (PK, FK, UNIQUE, CHECK, DEFAULT, SERIAL)
  - Seed each table with sample data for testing
- **Data Manipulation & Querying:** Perform both fundamental and advanced SQL operations, including:
  - CRUD operations (Create, Read, Update, Delete)
  - Join queries across related tables
  - Filtering and ordering results
  - Aggregating data using functions like SUM, COUNT, AVG, etc.
- **Relationship Modelling:** Create an Entity Relationship Diagram (ERD) that accurately reflects all entities and their relationships.
- **Design Justifications:** Document and explain key design choices, such as the use of nullable fields, many-to-many relationships (junction table) and data validation constraints.


## Project Structure

```
A1-relational-db-scripts (lash-business-database)/
├── erd/            # ERD diagrams
├── sql-scripts/    # SQL code
├── seed-data/      # Sample data in SQL
├── notes/          # Project plan
├── README.md       # This file
└── .gitignore      # To udpate
```

### SQL Systems Used

- PostgreSQL
-

## Entity Relationship Diagram (ERD)


## Database Schema

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
- menu_name (e.g. Full Set Classic)
- service_category (Full Set / Refill / Removal Only)
- lash_style (Classic / Hybrid / Volume)
- price (NUMERIC, CHECK > 0)
- duration_minutes (INTEGER, CHECK > 0)


### 4. **add_on** - Optional add-ons to appointment.

- add_on_id (PK)
- name (e.g. wispy spikes/cleanser kit)
- price (NUMERIC, CHECK ≥ 0)


### 5. **appointment_add_on** - Junction table linking appointments and add-ons (many-to-many).

- appointment_id (FK)
- add_on_id (FK)
- Composite keys: appointment_id and add_on_id

### Query Examples:

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

- In `/notes/project_plan.md`, include notes for:
  - Planning and design rationale
  - Database schema
  - Include constraints, explanations/justifications for tables including junction table
