# DEV1002 (A1) - Relational Database Scripts

---

## Table of Contents

- [DEV1002 (A1) - Relational Database Scripts](#dev1002-a1---relational-database-scripts)
  - [Table of Contents](#table-of-contents)
  - [Project Folder Structure](#project-folder-structure)
  - [Project Overview and Purpose](#project-overview-and-purpose)
  - [Setup and Prequisite Requirements](#setup-and-prequisite-requirements)
  - [Key Learning Outcomes](#key-learning-outcomes)
    - [1. Scenario Analysis](#1-scenario-analysis)
    - [2. Relationship Modelling](#2-relationship-modelling)
    - [3. Database Design and Normalisation](#3-database-design-and-normalisation)
    - [4. SQL Scripting](#4-sql-scripting)
    - [5. Data Manipulation and Querying](#5-data-manipulation-and-querying)
  - [References and Resources Used](#references-and-resources-used)
    - [Online Tool to create an ERD](#online-tool-to-create-an-erd)
    - [PostgreSQL Official Documentation](#postgresql-official-documentation)
    - [Information Guides and Tutorials](#information-guides-and-tutorials)

---

## Project Folder Structure

```bash
A1-relational-db-scripts/
├── erd/                # Diagrams for ERD - Conceptual and final erd table
├── sql-scripts/        # SQL scripting files - Create, seed and queries
├── docs/               # Project planning doc + Setup guide + db_schema screenshots
├── README.md           # Project overview doc (this file)
└── .gitignore          # .gitignore file
```

---

## Project Overview and Purpose

The purpose of this project is to demonstrate my ability to design and implement a normalised relational database (to 3NF or higher), showcasing my understanding of core database concepts and ability to work with databases at a fundamental level. This includes creating SQL scripting for creating tables, using constraints to maintain data integrity, seeding data, manipulating data and fundamental and complex data queries.

The relational database models simplified appointment booking and payment system for a solo lash business, inspired by a personal hobby. The database includes tables for clients, appointments, service menu (junction table), service categories and lash styles (lookup tables), and payment tracking.

---

## Setup and Prequisite Requirements

In this relational database project, I have used PostgreSQL (version 14.8) to create my database and scripts.

[View Setup Guide](docs/setup.md) for the prerequisites and tech requirements, installation and setup guide on how to connect to PostgreSQL Database and create database, tables and run queries with scripts.

---

## Key Learning Outcomes

This project fulfills the key learning outcomes and assessment criteria by applying the following database concepts and practices:

### 1. Scenario Analysis

- Identify entities, attributes, relationships and business rules.
- Design a database with at least 5 tables including one join/junction table.
- [Database Planning Document and Notes](docs/project_plan.md)

### 2. Relationship Modelling

- Create an Entity Relationship Diagram (ERD) that accurately reflects all entities and their relationships.
- Use of appropriate keys including primary and foreign keys
- Used lookup tables to support functionality and reduce redundancy.
- [ERD - Conceptual diagram](erd/conceptual-erd.drawio.png)
- [ERD - Table](erd/final-erd-table.drawio.png)

### 3. Database Design and Normalisation

- Noramalise database to Third Normal Form (3NF) to reduce redundancy and maintain data integrity.
- Ensure atomic fields and non-transitive dependencies.
- [Database Planning Document and Notes](docs/project_plan.md)

### 4. SQL Scripting

Write SQL scripts to:

- Create all tables as defined in the ERD
- Create 'seed' data in each of the tables for testing
- Create and apply appropriate keys, integrity checks and constraints including use of:
  - `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `CHECK`, `DEFAULT`, `SERIAL`, `NOT NULL`
- Use appropriate automated data creation such as:
  - Use of `DEFAULT` values and auto-incrementing `SERIAL` keys
- [Create database](sql-scripts/0_create_database.sql)
- [Create tables](sql-scripts/1_create_tables.sql)
- [Seed tables data](sql-scripts/2_seed_look_up_tables.sql)
- [Create seed data](sql-scripts/3_create_seed_data.sql)

### 5. Data Manipulation and Querying

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

---

## References and Resources Used

### Online Tool to create an ERD

- [Drawio](https://www.drawio.com/)

### PostgreSQL Official Documentation

In this project I have used PostgreSQL version 14.8.

- [PostgreSQL v14.18 Main Docs](https://www.postgresql.org/docs/14/index.html)
- [PostgreSQL Chapter 8.5. Date/Time Types](https://www.postgresql.org/docs/14/datatype-datetime.html)
- [PostgreSQL Chapter 6. Data Manipulation](https://www.postgresql.org/docs/14/dml.html)
- [PostgreSQL Chapter 7. Queries](https://www.postgresql.org/docs/14/queries.html)

### Information Guides and Tutorials

- [What is a relational database? - *Amazon Web Services (AWS)*](https://aws.amazon.com/relational-database/)
- [What is Database Normalization? - *PhoenixNAP*](https://phoenixnap.com/kb/database-normalization)
- [Getting Started with PostgreSQ - *Medium (Parmar Shyamsinh)*](https://medium.com/@parmarshyamsinh/getting-started-with-postgresql-a-beginners-guide-bf8d55fb2ef4)
- [PostgreSQL Subqueries - *w3resource*](https://www.w3resource.com/PostgreSQL/postgresql-subqueries.php)
- [Aggregate Functions - *Neon PostgreSQL Tutorial*](https://neon.com/postgresql/postgresql-aggregate-functions)
- [GROUP BY - *Neon PostgreSQL Tutorial*](https://neon.com/postgresql/postgresql-tutorial/postgresql-group-by)
- [Joins - *Neon PostgreSQL Tutorial*](https://neon.com/postgresql/postgresql-tutorial/postgresql-joins)
- [PostgreSQL Joins Explained - *TurorialsPoint*](https://www.tutorialspoint.com/postgresql/postgresql_using_joins.htm)
- [SQL Execution Order - *Codecademy*](https://www.codecademy.com/article/sql-execution-order)

---
