-- Insert orders for all customers with proper foreign key references
INSERT INTO cust_order (customer_id, order_date, shipping_method_id, dest_address_id)
VALUES
-- Brian Mwangi's orders
(
  (SELECT customer_id FROM customer WHERE email = 'briankush05@gmail.com'),
  '2024-01-15 10:30:00',
  (SELECT method_id FROM shipping_method WHERE method_name = 'Standard Shipping'),
  (SELECT address_id FROM address WHERE street_number = '17' AND street_name = 'Kenyatta Road')
),
(
  (SELECT customer_id FROM customer WHERE email = 'briankush05@gmail.com'),
  '2024-03-22 14:15:00',
  (SELECT method_id FROM shipping_method WHERE method_name = 'Express Shipping'),
  (SELECT address_id FROM address WHERE street_number = '221B' AND street_name = 'Baker Street')
),

-- James Bond's orders
(
  (SELECT customer_id FROM customer WHERE email = 'jamesbond01@gmail.com'),
  '2024-02-10 09:45:00',
  (SELECT method_id FROM shipping_method WHERE method_name = 'Overnight Shipping'),
  (SELECT address_id FROM address WHERE street_number = '1' AND street_name = 'Spintex Road')
),
(
  (SELECT customer_id FROM customer WHERE email = 'jamesbond01@gmail.com'),
  '2024-04-05 16:20:00',
  (SELECT method_id FROM shipping_method WHERE method_name = 'International Shipping'),
  (SELECT address_id FROM address WHERE street_number = '10' AND street_name = 'Downing Street')
),

-- Daddy Kool's orders
(
  (SELECT customer_id FROM customer WHERE email = 'kool@gmail.com'),
  '2024-01-30 11:10:00',
  (SELECT method_id FROM shipping_method WHERE method_name = 'Courier Service'),
  (SELECT address_id FROM address WHERE street_number = '22' AND street_name = 'Oxford Street')
),

-- Shukri Hassan's orders
(
  (SELECT customer_id FROM customer WHERE email = 'san@gmail.com'),
  '2024-03-18 13:25:00',
  (SELECT method_id FROM shipping_method WHERE method_name = 'Same-Day Delivery'),
  (SELECT address_id FROM address WHERE street_number = '10' AND street_name = 'Samora Avenue')
),

-- Ngozi Chukwu's orders
(
  (SELECT customer_id FROM customer WHERE email = 'ngozichukwu@gmail.com'),
  '2024-02-28 15:40:00',
  (SELECT method_id FROM shipping_method WHERE method_name = 'Economy Shipping'),
  (SELECT address_id FROM address WHERE street_number = '45' AND street_name = 'Uhuru Street')
),

-- Amahle Dlamini's orders
(
  (SELECT customer_id FROM customer WHERE email = 'amahled@eyahoo.com'),
  '2024-04-10 12:00:00',
  (SELECT method_id FROM shipping_method WHERE method_name = 'Standard Shipping'),
  (SELECT address_id FROM address WHERE street_number = '12' AND street_name = 'Vilakazi Street')
),

-- Sophie Müller's orders
(
  (SELECT customer_id FROM customer WHERE email = 'sophiemueller2@yahoo.com'),
  '2024-01-20 08:30:00',
  (SELECT method_id FROM shipping_method WHERE method_name = 'Express Shipping'),
  (SELECT address_id FROM address WHERE street_number = '101' AND street_name = 'Friedrichstraße')
),

-- Jean Dupont's orders
(
  (SELECT customer_id FROM customer WHERE email = 'jeandupon6t@gmail.com'),
  '2024-03-05 17:45:00',
  (SELECT method_id FROM shipping_method WHERE method_name = 'International Shipping'),
  (SELECT address_id FROM address WHERE street_number = '8' AND street_name = 'Champs-Élysées')
),

-- Wei Chen's orders
(
  (SELECT customer_id FROM customer WHERE email = 'weichen@outlook.com'),
  '2024-02-15 10:20:00',
  (SELECT method_id FROM shipping_method WHERE method_name = 'Drone Delivery'),
  (SELECT address_id FROM address WHERE street_number = '88' AND street_name = 'Jianguo Road')
);







-- Insert order lines connecting culturally relevant books to customer orders
INSERT INTO order_line (order_id, book_id, price, quantity)
VALUES
-- Brian Mwangi's first order (Kenyan)
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'briankush05@gmail.com')
   ORDER BY order_date LIMIT 1),
  (SELECT book_id FROM book WHERE title = 'Decolonising the Mind'),
  24.99,
  1
),

-- Brian Mwangi's second order
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'briankush05@gmail.com')
   ORDER BY order_date DESC LIMIT 1),
  (SELECT book_id FROM book WHERE title = 'Wizard of the Crow'),
  19.99,
  2
),

-- James Bond's first order (Ghanaian)
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'jamesbond01@gmail.com')
   ORDER BY order_date LIMIT 1),
  (SELECT book_id FROM book WHERE title = 'Things Fall Apart'),
  12.99,
  1
),

-- James Bond's second order
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'jamesbond01@gmail.com')
   ORDER BY order_date DESC LIMIT 1),
  (SELECT book_id FROM book WHERE title = 'Born a Crime'),
  18.99,
  1
),

-- Daddy Kool's order (Tanzanian)
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'kool@gmail.com')),
  (SELECT book_id FROM book WHERE title = 'July''s People'),
  14.99,
  1
),

-- Shukri Hassan's order (UK/Somali)
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'san@gmail.com')),
  (SELECT book_id FROM book WHERE title = 'The Reader'),
  16.99,
  1
),

-- Ngozi Chukwu's order (Nigerian)
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'ngozichukwu@gmail.com')),
  (SELECT book_id FROM book WHERE title = 'Half of a Yellow Sun'),
  15.99,
  2
),

-- Amahle Dlamini's order (South African)
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'amahled@eyahoo.com')),
  (SELECT book_id FROM book WHERE title = 'Born a Crime'),
  18.99,
  1
),

-- Sophie Müller's order (German)
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'sophiemueller2@yahoo.com')),
  (SELECT book_id FROM book WHERE title = 'The Reader'),
  16.99,
  1
),

-- Jean Dupont's order (French)
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'jeandupon6t@gmail.com')),
  (SELECT book_id FROM book WHERE title = 'So Long a Letter'),
  11.99,
  1
),

-- Wei Chen's order (Chinese)
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'weichen@outlook.com')),
  (SELECT book_id FROM book WHERE title = 'Shanghai Baby'),
  22.99,
  1
);





-- Remove the method_id from INSERT since it's auto-increment
INSERT INTO shipping_method(method_name, cost)
VALUES
('Standard Shipping', 5.00),
('Express Shipping', 10.00),
('Overnight Shipping', 20.00),
('International Shipping', 30.00),
('Drone Delivery', 25.00),
('Courier Service', 15.00),
('Economy Shipping', 3.00),
('Freight Shipping', 50.00),
('Same-Day Delivery', 12.00),
('Pickup Point', 0.00);

-- Insert order status values
INSERT INTO order_status (status_value) VALUES
('Pending'),       -- Order placed but not yet processed
('Processing'),    -- Payment confirmed, preparing for shipment
('Shipped'),       -- Package has left the warehouse
('In Transit'),    -- Package is with carrier
('Out for Delivery'), -- On the delivery vehicle
('Delivered'),     -- Successfully delivered
('Return Requested'), -- Customer requested return
('Return Approved'), -- Return authorized by seller
('Return Received'), -- Returned item received
('Refund Issued'), -- Refund processed
('Cancelled');     -- Order cancelled before shipment



-- Insert order history records showing the progression of each order
INSERT INTO order_history (order_id, status_id, status_date)
VALUES
-- Brian Mwangi's first order (complete journey)
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'briankush05@gmail.com')
   ORDER BY order_date LIMIT 1),
  (SELECT status_id FROM order_status WHERE status_value = 'Pending'),
  '2024-01-15 10:30:00'
),
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'briankush05@gmail.com')
   ORDER BY order_date LIMIT 1),
  (SELECT status_id FROM order_status WHERE status_value = 'Processing'),
  '2024-01-15 12:45:00'
),
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'briankush05@gmail.com')
   ORDER BY order_date LIMIT 1),
  (SELECT status_id FROM order_status WHERE status_value = 'Shipped'),
  '2024-01-16 09:20:00'
),
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'briankush05@gmail.com')
   ORDER BY order_date LIMIT 1),
  (SELECT status_id FROM order_status WHERE status_value = 'Delivered'),
  '2024-01-18 14:15:00'
),

-- Brian Mwangi's second order (in transit)
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'briankush05@gmail.com')
   ORDER BY order_date DESC LIMIT 1),
  (SELECT status_id FROM order_status WHERE status_value = 'Pending'),
  '2024-03-22 14:15:00'
),
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'briankush05@gmail.com')
   ORDER BY order_date DESC LIMIT 1),
  (SELECT status_id FROM order_status WHERE status_value = 'Processing'),
  '2024-03-22 16:30:00'
),
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'briankush05@gmail.com')
   ORDER BY order_date DESC LIMIT 1),
  (SELECT status_id FROM order_status WHERE status_value = 'Shipped'),
  '2024-03-23 11:10:00'
),
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'briankush05@gmail.com')
   ORDER BY order_date DESC LIMIT 1),
  (SELECT status_id FROM order_status WHERE status_value = 'In Transit'),
  '2024-03-25 08:45:00'
),

-- James Bond's first order (completed)
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'jamesbond01@gmail.com')
   ORDER BY order_date LIMIT 1),
  (SELECT status_id FROM order_status WHERE status_value = 'Pending'),
  '2024-02-10 09:45:00'
),
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'jamesbond01@gmail.com')
   ORDER BY order_date LIMIT 1),
  (SELECT status_id FROM order_status WHERE status_value = 'Processing'),
  '2024-02-10 11:30:00'
),
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'jamesbond01@gmail.com')
   ORDER BY order_date LIMIT 1),
  (SELECT status_id FROM order_status WHERE status_value = 'Shipped'),
  '2024-02-10 15:20:00'
),
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'jamesbond01@gmail.com')
   ORDER BY order_date LIMIT 1),
  (SELECT status_id FROM order_status WHERE status_value = 'Delivered'),
  '2024-02-11 10:15:00'
),

-- James Bond's second order (return in progress)
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'jamesbond01@gmail.com')
   ORDER BY order_date DESC LIMIT 1),
  (SELECT status_id FROM order_status WHERE status_value = 'Pending'),
  '2024-04-05 16:20:00'
),
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'jamesbond01@gmail.com')
   ORDER BY order_date DESC LIMIT 1),
  (SELECT status_id FROM order_status WHERE status_value = 'Processing'),
  '2024-04-05 18:30:00'
),
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'jamesbond01@gmail.com')
   ORDER BY order_date DESC LIMIT 1),
  (SELECT status_id FROM order_status WHERE status_value = 'Shipped'),
  '2024-04-06 09:15:00'
),
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'jamesbond01@gmail.com')
   ORDER BY order_date DESC LIMIT 1),
  (SELECT status_id FROM order_status WHERE status_value = 'Delivered'),
  '2024-04-08 14:00:00'
),
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'jamesbond01@gmail.com')
   ORDER BY order_date DESC LIMIT 1),
  (SELECT status_id FROM order_status WHERE status_value = 'Return Requested'),
  '2024-04-09 10:30:00'
),
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'jamesbond01@gmail.com')
   ORDER BY order_date DESC LIMIT 1),
  (SELECT status_id FROM order_status WHERE status_value = 'Return Approved'),
  '2024-04-09 14:45:00'
),

-- Daddy Kool's order (cancelled)
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'kool@gmail.com')),
  (SELECT status_id FROM order_status WHERE status_value = 'Pending'),
  '2024-01-30 11:10:00'
),
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'kool@gmail.com')),
  (SELECT status_id FROM order_status WHERE status_value = 'Cancelled'),
  '2024-01-30 13:25:00'
),

-- Shukri Hassan's order (delivered)
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'san@gmail.com')),
  (SELECT status_id FROM order_status WHERE status_value = 'Pending'),
  '2024-03-18 13:25:00'
),
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'san@gmail.com')),
  (SELECT status_id FROM order_status WHERE status_value = 'Processing'),
  '2024-03-18 15:40:00'
),
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'san@gmail.com')),
  (SELECT status_id FROM order_status WHERE status_value = 'Shipped'),
  '2024-03-19 10:15:00'
),
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'san@gmail.com')),
  (SELECT status_id FROM order_status WHERE status_value = 'Delivered'),
  '2024-03-21 16:30:00'
),

-- Ngozi Chukwu's order (out for delivery)
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'ngozichukwu@gmail.com')),
  (SELECT status_id FROM order_status WHERE status_value = 'Pending'),
  '2024-02-28 15:40:00'
),
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'ngozichukwu@gmail.com')),
  (SELECT status_id FROM order_status WHERE status_value = 'Processing'),
  '2024-02-28 17:55:00'
),
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'ngozichukwu@gmail.com')),
  (SELECT status_id FROM order_status WHERE status_value = 'Shipped'),
  '2024-02-29 09:30:00'
),
(
  (SELECT order_id FROM cust_order 
   WHERE customer_id = (SELECT customer_id FROM customer WHERE email = 'ngozichukwu@gmail.com')),
  (SELECT status_id FROM order_status WHERE status_value = 'Out for Delivery'),
  '2024-03-02 08:15:00'
);