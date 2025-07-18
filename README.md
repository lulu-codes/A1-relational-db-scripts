# DEV1002 (A1) - Relational Database Scripts

## Project Overview & Purpose

The purpose of this project is to demonstrate my ability to design and implement a normalised relational database (to 3NF or higher), showcasing my understanding of core database concepts and ability to work with databases at a fundamental level. This includes creating SQL scripting for creating tables, using constraints to maintain data integrity, seeding data, manipulating data and fundamental and complex data queries.

The relational database models simplified appointment booking and payment system for a solo lash business, inspired by a personal hobby. The database includes tables for clients, appointments, service menu (junction table), service categories and lash styles (lookup tables), and payment tracking.

## Key Learning Outcomes

This project fulfills the key learning outcomes and assessment criteria by applying the following database concepts and practices:

### Scenario Analysis:

- Identify entities, attributes, relationships and business rules.
- Design a database with at least 5 tables including one join/junction table.
- [Database Planning Document & Notes](./docs/project_plan.md)

### Relationship Modelling:

- Create an Entity Relationship Diagram (ERD) that accurately reflects all entities and their relationships.
- Use of appropriate keys including primary and foreign keys
- Used lookup tables to support functionality and reduce redundancy.
- [ERD - Conceptual diagram](./erd/conceptual-erd.drawio.png)
- [ERD - Table](./erd/final-erd-table.drawio.png)

### Database Design & Normalisation:

- Noramalise database to Third Normal Form (3NF) to reduce redundancy and maintain data integrity.
- Ensure atomic fields and non-transitive dependencies.
- [Database Planning Document & Notes](./docs/project_plan.md)

### SQL Scripting (Used PostgreSQL v14.18):

Write SQL scripts to:

- Create all tables as defined in the ERD
- Create 'seed' data in each of the tables for testing
- Create and apply appropriate keys, integrity checks and constraints including use of:
  - `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `CHECK`, `DEFAULT`, `SERIAL`, `NOT NULL`
- Use appropriate automated data creation such as:
  - Use of `DEFAULT` values and auto-incrementing `SERIAL` keys
- [Create tables](./sql-scripts/create_tables.sql)
- [Seed Data](./seed-data/create_seed_data.sql)


### Data Manipulation & Querying:

Develop and use SQL operations, including fundamental and complex queries to:

- Query a table for a single record
- Query joined tables for a single record
- Insert a record into a table
- Insert a record into a table with appropriate foreign-key data
- Update a record in a table
- Delete a record from a table
- Order data by a specific value
- Calculate data based on values from tables
- Filtering data based on a specific value
- Join queries across related tables
- Use aggregate functions to perform calculations including:
  -  `SUM()`, `AVERAGE()`, `MIN()`, `MAX()`, `COUNT()`
- Develop complex queries which involve querying, filtering, grouping, aggregating, selecting and ordering of data.


## Database Design & Normalisation:

Noramalise database to Third Normal Form (3NF) to avoid data redundancy and maintain data integrity in a relational database structure.

### Normalisation Decisions:
- Ensured each entity/table stores only related attributes.
- Avoided redundancy (e.g. no repeated client details in multiple appointments).
- Reviewed data and removed any partial or transitive dependencies.

### Normalisation process to reduce data redundancy:
- Initially I had `service_category` and `lash_styles` stored in the `services` table as text, however this led to repeating values appearing across the records, causing redundnacy and potential data inconsistencies.
- To resolve this, I separated them into their own look up tables and created a junction table for `service_option` and connected them using foreign keys.
- The `service_option` table now reflects a unique combination of the `service_categories` and `lash_styles`, each with their own corresponding price and duration (mins).
- Price and duration belong in `service_option` table because their values depend on the full combination of both service category and lash style (not on either one independently).
- This process removed data duplication to help maintain data consistency and also allows for flexibility to expand in future (e.g. easily add new lash styles without structural changes).


## References & Resources Used:

**Online Tool to create an ERD:**

- [Drawio](https://www.drawio.com/)

**PostgreSQL (Version 14.18) Official Documentation:**

- [PostgreSQL v14.18 Main Docs](https://www.postgresql.org/docs/14/index.html)
- [PostgreSQL Chapter 8.5. Date/Time Types](https://www.postgresql.org/docs/14/datatype-datetime.html)
- [PostgreSQL Chapter 6. Data Manipulation](https://www.postgresql.org/docs/14/dml.html)
- [PostgreSQL Chapter 7. Queries](https://www.postgresql.org/docs/14/queries.html)

**Information Guides & Tutorials:**

- [What is a relational database? - *Amazon Web Services (AWS)*](https://aws.amazon.com/relational-database/)
- [What is Database Normalization? - *PhoenixNAP*](https://phoenixnap.com/kb/database-normalization)
- [Getting Started with PostgreSQ - *Medium (Parmar Shyamsinh)*](https://medium.com/@parmarshyamsinh/getting-started-with-postgresql-a-beginners-guide-bf8d55fb2ef4)
- [PostgreSQL Subqueries - *w3resource*](https://www.w3resource.com/PostgreSQL/postgresql-subqueries.php)
- [Aggregate Functions - *Neon PostgreSQL Tutorial*](https://neon.com/postgresql/postgresql-aggregate-functions)
- [GROUP BY - *Neon PostgreSQL Tutorial*](https://neon.com/postgresql/postgresql-tutorial/postgresql-group-by)
- [Joins - *Neon PostgreSQL Tutorial*](https://neon.com/postgresql/postgresql-tutorial/postgresql-joins)
- [PostgreSQL Joins Explained - *TurorialsPoint*](https://www.tutorialspoint.com/postgresql/postgresql_using_joins.htm)
- [SQL Execution Order - *Codecademy*](https://www.codecademy.com/article/sql-execution-order)
