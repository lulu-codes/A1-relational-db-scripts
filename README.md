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
  - Apply appropriate constraints (PK, FK, UNIQUE, CHECK, DEFAULT, AUTO_INCREMENT)
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


## Entity Relationship Diagram (ERD)


## Database Schema


## Sample Data


## Query Examples

- Find all appointments for a client with services/styles/mapping style
- Show add-ons for a specific appointment
- Calculate total revenue (based on month)

## Notes & Documentation

- In `/notes/project_plan.md`, include notes for:
  - Planning and design rationale
  - Database schema
  - Include constraints, explanations/justifications for tables including junction table
