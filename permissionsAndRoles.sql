
-- Roles for different types of users
CREATE ROLE 'store_admin';
CREATE ROLE 'inventory_manager';
CREATE ROLE 'customer_service';
CREATE ROLE 'shipping_staff';
CREATE ROLE 'reporting_analyst';
CREATE ROLE 'customer';


-- Grant all privileges to store admin
GRANT ALL PRIVILEGES ON bookstoredb.* TO 'store_admin';


-- Grant inventory-related permissions
GRANT SELECT, INSERT, UPDATE ON bookstoredb.book TO 'inventory_manager';
GRANT SELECT, INSERT, UPDATE ON bookstoredb.book_language TO 'inventory_manager';
GRANT SELECT, INSERT, UPDATE ON bookstoredb.publisher TO 'inventory_manager';
GRANT SELECT, INSERT, UPDATE ON bookstoredb.author TO 'inventory_manager';
GRANT SELECT, INSERT, UPDATE ON bookstoredb.book_author TO 'inventory_manager';
GRANT SELECT ON bookstoredb.order_line TO 'inventory_manager';


-- Grant customer service permissions
GRANT SELECT, INSERT, UPDATE ON bookstoredb.customer TO 'customer_service';
GRANT SELECT, INSERT, UPDATE ON bookstoredb.address TO 'customer_service';
GRANT SELECT, INSERT, UPDATE ON bookstoredb.customer_address TO 'customer_service';
GRANT SELECT, INSERT, UPDATE ON bookstoredb.cust_order TO 'customer_service';
GRANT SELECT, INSERT, UPDATE ON bookstoredb.order_line TO 'customer_service';
GRANT SELECT, INSERT, UPDATE ON bookstoredb.order_history TO 'customer_service';
GRANT SELECT ON bookstoredb.order_status TO 'customer_service';
GRANT SELECT ON bookstoredb.book TO 'customer_service';


-- Grant shipping-related permissions
GRANT SELECT ON bookstoredb.cust_order TO 'shipping_staff';
GRANT SELECT ON bookstoredb.order_line TO 'shipping_staff';
GRANT SELECT ON bookstoredb.address TO 'shipping_staff';
GRANT SELECT ON bookstoredb.shipping_method TO 'shipping_staff';
GRANT SELECT, INSERT, UPDATE ON bookstoredb.order_history TO 'shipping_staff';
GRANT SELECT ON bookstoredb.order_status TO 'shipping_staff';


-- Grant read-only access for reporting
GRANT SELECT ON bookstoredb.* TO 'reporting_analyst';


-- Grant customer permissions (for the application interface)
GRANT SELECT ON bookstoredb.book TO 'customer';
GRANT SELECT ON bookstoredb.author TO 'customer';
GRANT SELECT ON bookstoredb.book_author TO 'customer';
GRANT SELECT ON bookstoredb.publisher TO 'customer';
GRANT SELECT ON bookstoredb.shipping_method TO 'customer';

-- Limited access to the customer's  own data
GRANT SELECT, INSERT, UPDATE ON bookstoredb.customer TO 'customer';
GRANT SELECT, INSERT, UPDATE ON bookstoredb.address TO 'customer';
GRANT SELECT, INSERT, UPDATE ON bookstoredb.customer_address TO 'customer';
GRANT SELECT, INSERT ON bookstoredb.cust_order TO 'customer';
GRANT SELECT ON bookstoredb.order_line TO 'customer';
GRANT SELECT ON bookstoredb.order_history TO 'customer';
GRANT SELECT ON bookstoredb.order_status TO 'customer';


-- Users and  roles
CREATE USER 'Kuria'@'localhost' IDENTIFIED BY '123456';
 GRANT 'store_admin' TO 'Kuria'@'localhost';

CREATE USER 'Nessa'@'localhost' IDENTIFIED BY '123456';
GRANT 'inventory_manager' TO 'Nessa'@'localhost';

CREATE USER 'Nitter'@'localhost' IDENTIFIED BY '123456';
GRANT 'customer_service' TO 'Nitter'@'localhost';

CREATE USER 'Vicky'@'localhost' IDENTIFIED BY '123456';
GRANT 'shipping_staff' TO 'Vicky'@'localhost';

CREATE USER 'Moses'@'localhost' IDENTIFIED BY '123456';
GRANT 'reporting_analyst' TO 'Moses'@'localhost';

