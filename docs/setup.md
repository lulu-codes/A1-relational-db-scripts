<!-- setup.md -->

# Setup Guide

- [Setup Guide](#setup-guide)
  - [Prerequisites and Tech Requirements](#prerequisites-and-tech-requirements)
  - [Installation \& Setup](#installation--setup)
  - [Connecting to PostgreSQL Database](#connecting-to-postgresql-database)
  - [Running Database Scripts](#running-database-scripts)
    - [Run SQL scripts using psql in below order](#run-sql-scripts-using-psql-in-below-order)
      - [Setup Database first - Create the database](#setup-database-first---create-the-database)
    - [To run all scripts in order at once](#to-run-all-scripts-in-order-at-once)
  - [Back to README file](#back-to-readme-file)


This project demonstrates a relational database system designed and created using PostgreSQL (v14.8).
It includes relational database scripts for a simplified model of a lash booking system based on a fundamental development level.

The database scripts were developed using CLI and Visual Studio Code. This setup document guides you on the prerequisites and tech requirements, installation and setup, how to connect to PostgreSQL Database and create database by running the included scripts in order.
[Run Scripts Order]

> **What is PostgreSQL?**
> *PostgreSQL is an open-source, powerful, and object-relational database system.*

**Helpful Documents for Reference:**

- [PostgreSQL Official Documentation](https://www.postgresql.org/docs/current/index.html)
- [PostgreSQL Cheat Sheet & Quick Reference](https://quickref.me/postgres.html)
- [PostgreSQL Cheasheet](https://www.tutorialspoint.com/postgresql/postgresql_cheatsheet.htm)

---

## Prerequisites and Tech Requirements

- **PostgreSQL** - Version 13 or later (recommended)
- **Command Line Terminal** - Linux Shell, Windows PowerShell or macOS Terminal
- **psql** - PostgreSQL command line tool
- **Database Credentials** - Host, username, password and database name (will need to be created)
- **Internet** - For downloading PostgreSQL and Git (if cloning repo from GitHub)

---

## Installation & Setup

**1. Clone or download the repository to your local machine:**

```bash
    git clone https://github.com/lulu-codes/A1-relational-db-scripts.git    # Clone Git repository
    cd A1-relational-db-scripts                                             # Navigate into directory
```

**2. Install PostgreSQL:**

- To download and install PostgreSQL, please visit [the official site](https://www.postgresql.org/download/) if not already installed.
- Follow the installer instructions for your operating system
- After installation, verify that it's working. You can check this by running the below command.

```bash
  psql --version        # This should return something like: psql (PostgreSQL) version number
```

---

## Connecting to PostgreSQL Database

**1. Start PostgreSQL server:**

```bash
    sudo -u postgres psql
```

---

## Running Database Scripts

### Run SQL scripts using psql in below order

#### Setup Database first - Create the database

```psql
\i sql-scripts/0_create_database.sql
```

**1. Create all tables and relationships:**

```psql
\i sql-scripts/1_create_tables.sql
```

**2. Insert predefined lookup values for tables:**

```psql
\i sql-scripts/2_seed_look_up_tables.sql
```

**3. Insert core seed data:**

```psql
\i sql-scripts/3_create_seed_data.sql
```

**4. Run single table query:**

```psql
\i sql-scripts/4_query_single_table.sql
```

**5. Run joined table query:**

```psql
\i sql-scripts/5_query_joined_tables.sql
```

**6. Insert a new record:**

```psql
\i sql-scripts/6_insert_record.sql
```

**7. Update an existing record:**

```psql
\i sql-scripts/7_update_record.sql
```

**8. Delete a record:**

```psql
\i sql-scripts/8_delete_record.sql
```

**9. Run aggregate function queries:**

```psql
\i sql-scripts/9_aggregate_functions.sql
```

**10. Filter, group and order complex queries:**

```psql
\i sql-scripts/10_filter_group_order.sql
```

### To run all scripts in order at once

```psql
\i run_all_sql_scripts_in_order
```

---

## Back to README file

Refer to [README.md](/README.md) for more details about the project.
