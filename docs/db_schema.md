# Database Schema - Screenshots

## Database and Tables Schema

1. List database for lash_appointment_system - to check if database created:

```psql
    \l lash_appointment_system
```

![Database for lash_appointment_system](images/list_db.png)

---

2. Show current database - to check if in correct database:

```psql
    SELECT current_database();
```

![show current database](images/current_db.png)

---

3. List database tables - to check all tables created (8 in total):

```psql
    \dt
```

![List database tables](images/list_tables.png)

---

4. List `clients` table schema:

```sql
    \d clients
```

![List clients table](images/clients_table.png)

5. List `appointments` table schema:

```sql
    \d appointments
```

![List appointments table](images/appointments_table.png)!

1. List `appointment_statuses` table schema:

```sql
    \d appointment_statuses
```

![List appointment_statuses table](images/appointment_statuses_table.png)

7. List `service_options` table schema:

```sql
    \d service_options
```

![List service_options table](images/service_options_table.png)

8. List `service_categories` table schema:

```sql
    \d service_categories
```

![List service_categories table](images/service_categories_table.png)

9.  List `lash_styles` table schema:

```sql
    \d lash_styles
```

![List lash_styles table](images/lash_styles_table.png)

10. List `payments` table schema:

```sql
    \d payments
```

![List payments table](images/payments_table.png)

11. List `payment_statuses` table schema:

```sql
    \d payment_statuses
```

![List payment_statuses table](images/payment_statuses_table.png)
