-- run_all_sql_scripts_in_order.sql

-- run this script if you want to run all sql scripts in order at once

-- Setup Database first - Create the database
\i sql-scripts/0_create_database.sql

-- 1. Create all tables and relationships
\i sql-scripts/1_create_tables.sql

-- 2. Insert predefined lookup values for tables
\i sql-scripts/2_seed_look_up_tables.sql

-- 3. Insert core seed data
\i sql-scripts/3_create_seed_data.sql

-- 4. Run single table query
\i sql-scripts/4_query_single_table.sql

-- 5. Run joined table query
\i sql-scripts/5_query_joined_tables.sql

-- 6. Insert a new record
\i sql-scripts/6_insert_record.sql

-- 7. Update an existing record
\i sql-scripts/7_update_record.sql

-- 8. Delete a record
\i sql-scripts/8_delete_record.sql

-- 9. Run aggregate function queries
\i sql-scripts/9_aggregate_functions.sql

-- 10. Filter, group and order complex queries
\i sql-scripts/10_filter_group_order.sql
