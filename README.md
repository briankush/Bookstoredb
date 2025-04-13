# Bookstore Database Project README

## Introduction
This project is focused on creating a MySQL database for managing a bookstore. It involves designing the database schema, implementing the tables, setting up user roles and permissions, and testing the database using SQL queries.

## Project Goals
1. **Design a Database:** Construct a MySQL database for a bookstore application with optimal table design and schema.
2. **Data Types and Schema:** Use the best data types and design schema to represent real-world bookstore data.
3. **Access Control:** Implement user roles and permissions to protect database integrity and security.
4. **Testing:** Verify the database's functionality through SQL queries to ensure it meets requirements.

## Project Structure
- **Database:** MySQL database named `bookstore`.
- **Tables:**
  - `book`
  - `book_author` (many-to-many relationship between books and authors)
  - `author`
  - `book_language`
  - `publisher`
  - `Customer`
  - `customer_address`
  - `address_status`
  - `address`
  - `country`
  - `cust_order`
  - `order_line`
  - `shipping_method`
  - `order_status`
  - **SQL Files:**
  - `assignment.sql`: Script to insert sample data into the tables.
  - `bookstorebd.sql`:The whole database schema.
  - `test_queries.sql`: SQL queries for testing the database functionality.
  

## Implementation Steps
1. **Database Creation:** Initialize the `bookstore` database and set it as the current database.
2. **Access Control Setup:** Define roles (Reader, Admin), and create users with appropriate permissions.
3. **Sample Data Insertion:** Run `assignment.sql` to add example data.
4. **Database Testing:** Use `test_queries.sql` to verify database operations and relationships.

## Access Control
- **Reader Role:** Can only SELECT from all tables.
- **Admin Role:** Full control over the database operations.
- **Users:** `bookstore_user` (Reader) and `admin_user` (Admin) with secure credentials.

## Testing
Test queries in `test_queries.sql` cover basic selects, joins, and more complex data analysis SQL operations.

## Development Environment
Recommended: MySQL Workbench or any SQL development environment. Ensure secure password management and SQL execution capabilities.

## Running the Database and Queries
1. Connect to MySQL and select the `bookstore` database.
3. Use `assignment.sql` to populate the database.
4. Execute `test_queries.sql` for validation.
5. Check roles and user access based on defined policies.

## Contributors
- Vanessa Williams (https://github.com/nessa360)
- Brian Kuria Mwangi (https://github.com/briankush)
- Juanita Achieng (https://github.com/Juana-tech)


