-- This SQL script is designed to populate a book database with sample data.
-- It includes the insertion of book languages, publishers, authors, books, and book-author relationships.

--  1.Insert book languages
INSERT INTO book_language (language_code, language_name) VALUES
('EN', 'English'),
('SW', 'Swahili'),
('FR', 'French'),
('DE', 'German'),
('ZH', 'Chinese'),
('HI', 'Hindi'),
('AR', 'Arabic'),
('ES', 'Spanish'),
('YO', 'Yoruba'),
('ZU', 'Zulu');


-- 2.Publisher
INSERT INTO publisher (publisher_name) VALUES
('Penguin Random House'),
('HarperCollins'),
('Macmillan Publishers'),
('Hachette Livre'),
('Simon & Schuster'),
('East African Educational Publishers'),
('Kwani Trust'),
('Chennai Books'),
('Casa de las Américas'),
('Editions Présence Africaine');


-- 3.Author
INSERT INTO author (author_name, birth_date, biography) VALUES
('Ngũgĩ wa Thiong''o', '1938-01-05', 'Kenyan writer and academic who writes primarily in Gikuyu and English'),
('Chimamanda Ngozi Adichie', '1977-09-15', 'Nigerian writer whose works range from novels to short stories to nonfiction'),
('Nadine Gordimer', '1923-11-20', 'South African writer and political activist who received the Nobel Prize in Literature'),
('Thomas Sankara', '1949-12-21', 'Revolutionary and President of Burkina Faso whose speeches were compiled into books'),
('Wei Hui', '1973-06-06', 'Chinese novelist best known for her controversial novel Shanghai Baby'),
('Jorge Luis Borges', '1899-08-24', 'Argentine short-story writer, essayist, poet and translator'),
('Ayi Kwei Armah', '1939-10-28', 'Ghanaian writer known for his novels about political and cultural corruption'),
('Alaa Al Aswany', '1957-05-26', 'Egyptian writer best known for The Yacoubian Building'),
('Mariama Bâ', '1929-04-17', 'Senegalese author and feminist who wrote in French'),
('Binyavanga Wainaina', '1971-01-18', 'Kenyan author and journalist famous for "How to Write About Africa"');


-- 4. Books
INSERT INTO book (title, isbn, publisher_id, language_id, num_pages, publication_date, price, stock_quantity) VALUES
-- For Kenyan customers
('Decolonising the Mind', '978-0852555019', 
 (SELECT publisher_id FROM publisher WHERE publisher_name = 'East African Educational Publishers'),
 (SELECT language_id FROM book_language WHERE language_code = 'EN'), 256, '1986-01-01', 24.99, 50),

('Wizard of the Crow', '978-0099504156',
 (SELECT publisher_id FROM publisher WHERE publisher_name = 'Penguin Random House'),
 (SELECT language_id FROM book_language WHERE language_code = 'EN'), 768, '2006-01-01', 19.99, 30),

-- For Nigerian customers
('Half of a Yellow Sun', '978-0007200283',
 (SELECT publisher_id FROM publisher WHERE publisher_name = 'HarperCollins'),
 (SELECT language_id FROM book_language WHERE language_code = 'EN'), 448, '2006-01-01', 15.99, 40),

('Things Fall Apart', '978-0385474542',
 (SELECT publisher_id FROM publisher WHERE publisher_name = 'Macmillan Publishers'),
 (SELECT language_id FROM book_language WHERE language_code = 'EN'), 209, '1958-01-01', 12.99, 60),

-- For South African customers
('July''s People', '978-0143026259',
 (SELECT publisher_id FROM publisher WHERE publisher_name = 'Penguin Random House'),
 (SELECT language_id FROM book_language WHERE language_code = 'EN'), 192, '1981-01-01', 14.99, 25),

('Born a Crime', '978-0399588174',
 (SELECT publisher_id FROM publisher WHERE publisher_name = 'Simon & Schuster'),
 (SELECT language_id FROM book_language WHERE language_code = 'EN'), 304, '2016-01-01', 18.99, 35),

-- For Chinese customers
('Shanghai Baby', '978-0743419341',
 (SELECT publisher_id FROM publisher WHERE publisher_name = 'Simon & Schuster'),
 (SELECT language_id FROM book_language WHERE language_code = 'ZH'), 240, '1999-01-01', 22.99, 20),

-- For French customers
('So Long a Letter', '978-0435905558',
 (SELECT publisher_id FROM publisher WHERE publisher_name = 'Editions Présence Africaine'),
 (SELECT language_id FROM book_language WHERE language_code = 'FR'), 112, '1979-01-01', 11.99, 30),

-- For German customers
('The Reader', '978-0375408267',
 (SELECT publisher_id FROM publisher WHERE publisher_name = 'Hachette Livre'),
 (SELECT language_id FROM book_language WHERE language_code = 'DE'), 218, '1995-01-01', 16.99, 25),

-- For Mexican customers
('Ficciones', '978-0802130303',
 (SELECT publisher_id FROM publisher WHERE publisher_name = 'Casa de las Américas'),
 (SELECT language_id FROM book_language WHERE language_code = 'ES'), 174, '1944-01-01', 13.99, 20);


 -- 5.Create book-author relationships
INSERT INTO book_author (book_id, author_id) VALUES
((SELECT book_id FROM book WHERE title = 'Decolonising the Mind'), 
 (SELECT author_id FROM author WHERE author_name = 'Ngũgĩ wa Thiong''o')),

((SELECT book_id FROM book WHERE title = 'Wizard of the Crow'), 
 (SELECT author_id FROM author WHERE author_name = 'Ngũgĩ wa Thiong''o')),

((SELECT book_id FROM book WHERE title = 'Half of a Yellow Sun'), 
 (SELECT author_id FROM author WHERE author_name = 'Chimamanda Ngozi Adichie')),

((SELECT book_id FROM book WHERE title = 'Things Fall Apart'), 
 (SELECT author_id FROM author WHERE author_name = 'Ayi Kwei Armah')),

((SELECT book_id FROM book WHERE title = 'July''s People'), 
 (SELECT author_id FROM author WHERE author_name = 'Nadine Gordimer')),

((SELECT book_id FROM book WHERE title = 'Born a Crime'), 
 (SELECT author_id FROM author WHERE author_name = 'Binyavanga Wainaina')),

((SELECT book_id FROM book WHERE title = 'Shanghai Baby'), 
 (SELECT author_id FROM author WHERE author_name = 'Wei Hui')),

((SELECT book_id FROM book WHERE title = 'So Long a Letter'), 
 (SELECT author_id FROM author WHERE author_name = 'Mariama Bâ')),

((SELECT book_id FROM book WHERE title = 'The Reader'), 
 (SELECT author_id FROM author WHERE author_name = 'Alaa Al Aswany')),

((SELECT book_id FROM book WHERE title = 'Ficciones'), 
 (SELECT author_id FROM author WHERE author_name = 'Jorge Luis Borges'));


 -- 6. Customer table
INSERT INTO customer (first_name, last_name, email, phone) VALUES
('Brian', 'Mwangi', 'briankush05@gmail.com', '+25424345670')
('James', 'Bond', 'jamesbond01@gmail.com', '+23324867463')  
('Daddy', 'Kool', 'kool@gmail.com', '+25524567453')
('Shukri', 'Hassan', 'san@gmail.com', '+445924824457')
('Ngozi', 'Chukwu', 'ngozichukwu@gmail.com', '+234802345678'),
('Amahle', 'Dlamini', 'amahled@eyahoo.com', '+27821234567'),
('Sophie', 'Müller', 'sophiemueller2@yahoo.com', '+4915123456789'),
('Jean', 'Dupont', 'jeandupon6t@gmail.com', '+33123456789'),
('Wei', 'Chen', 'weichen@outlook.com', '+8613812345678'),
('Priya', 'Patel', 'priyapatel@gmail.com', '+919876543210'),
('Youssef', 'Alfarsi', 'youssefalfarsi@yahoo.com', '+966501234567'),
('Sofía', 'García', 'sofigarcia896@yahoo.com', '+5215512345678'),
('Aisha', 'Johnson', 'aishajohnsonofficial@outlook.com', '+447912345678'),
('Tyrone', 'Williams', 'tyronew@gmail.com', '+12025551234');

-- 7. Country table
INSERT INTO country (country_name, country_code) VALUES
('Kenya', '+254'),       
('Ghana', '+233'),        
('Tanzania', '+255'),    
('United Kingdom', '+44'), 
('Nigeria', ' +234'),     
('South Africa', '+27'),  
('Germany', '+49'),     
('France', '+33'),      
('China', '+86'),       
('India', '+91'),        
('Saudi Arabia', '+966'), 
('Mexico', '+52'),      
('United States', '+1');  

-- 8. Address table
INSERT INTO address (street_number, street_name, city, country_id, postal_code) VALUES
('17', 'Kenyatta Road', 'Mombasa', (SELECT country_id FROM country WHERE country_code = '+254'), '80100'),
('1', 'Spintex Road', 'Accra', (SELECT country_id FROM country WHERE country_code = '+233'), 'GA123'),
('22', 'Oxford Street', 'Kumasi', (SELECT country_id FROM country WHERE country_code = '+233'), 'KS456'),
('10', 'Samora Avenue', 'Dar es Salaam', (SELECT country_id FROM country WHERE country_code = '+255'), '11101'),
('45', 'Uhuru Street', 'Arusha', (SELECT country_id FROM country WHERE country_code = '+255'), '23101'),
('221B', 'Baker Street', 'London', (SELECT country_id FROM country WHERE country_code = '+44'), 'NW1 6XE'),
('10', 'Downing Street', 'London', (SELECT country_id FROM country WHERE country_code = '+44'), 'SW1A 2AA'),
('42', 'Adeniran Ogunsanya', 'Lagos', (SELECT country_id FROM country WHERE country_code = '+234'), '101241'),
('15', 'Awolowo Road', 'Ikeja', (SELECT country_id FROM country WHERE country_code = '+234'), '101233'),
('12', 'Vilakazi Street', 'Soweto', (SELECT country_id FROM country WHERE country_code = '+27'), '1804'),
('101', 'Friedrichstraße', 'Berlin', (SELECT country_id FROM country WHERE country_code = '+49'), '10117'),
('45', 'Kurfürstendamm', 'Berlin', (SELECT country_id FROM country WHERE country_code = '+49'), '10719'),
('8', 'Champs-Élysées', 'Paris', (SELECT country_id FROM country WHERE country_code = '+33'), '75008'),
('72', 'Rue de Rivoli', 'Paris', (SELECT country_id FROM country WHERE country_code = '+33'), '75004'),
('88', 'Jianguo Road', 'Beijing', (SELECT country_id FROM country WHERE country_code = '+86'), '100025'),
('120', 'Nanjing Road', 'Shanghai', (SELECT country_id FROM country WHERE country_code = '+86'), '200003'),
('32', 'Marine Drive', 'Mumbai', (SELECT country_id FROM country WHERE country_code = '+91'), '400020'),
('12', 'MG Road', 'Bangalore', (SELECT country_id FROM country WHERE country_code = '+91'), '560001'),
('1', 'King Fahd Road', 'Riyadh', (SELECT country_id FROM country WHERE country_code = '+966'), '11564'),
('45', 'Paseo de la Reforma', 'Mexico City', (SELECT country_id FROM country WHERE country_code = '+52'), '06500'),
('120', 'Avenida Juárez', 'Guadalajara', (SELECT country_id FROM country WHERE country_code = '+52'), '44100'),
('10', 'Kensington High Street', 'London', (SELECT country_id FROM country WHERE country_code = '+44'), 'W8 5NP'),
('1', 'Princes Street', 'Edinburgh', (SELECT country_id FROM country WHERE country_code = '+44'), 'EH2 2EQ'),
('123', '5th Avenue', 'New York', (SELECT country_id FROM country WHERE country_code = '+1'), '10001'),
('456', 'Martin Luther King Blvd', 'Chicago', (SELECT country_id FROM country WHERE country_code = '+1'), '60616');

-- 9 .Address status table
 INSERT INTO address_status (status_name, description) VALUES
('Current', 'Primary active address'),
('Previous', 'Former address no longer in use'),
('Billing', 'Address used for billing purposes'),
('Shipping', 'Address used for shipping/delivery'),
('Temporary', 'Short-term address'),
('Work', 'Business or work-related address'),
('Vacation', 'Seasonal or vacation address');


-- 10. Customer_adress
INSERT INTO customer_address (customer_id, address_id, status_id) VALUES
-- Brian Mwangi
(
  (SELECT customer_id FROM customer WHERE email = 'briankush05@gmail.com'),
  1,
  (SELECT status_id FROM address_status WHERE status_name = 'Current')
),
(
  (SELECT customer_id FROM customer WHERE email = 'briankush05@gmail.com'),
  2,
  (SELECT status_id FROM address_status WHERE status_name = 'Shipping')
),

-- James Bond
(
  (SELECT customer_id FROM customer WHERE email = 'jamesbond01@gmail.com'),
  3,
  (SELECT status_id FROM address_status WHERE status_name = 'Current')
),
(
  (SELECT customer_id FROM customer WHERE email = 'jamesbond01@gmail.com'),
  4,
  (SELECT status_id FROM address_status WHERE status_name = 'Billing')
),

-- Daddy Kool
(
  (SELECT customer_id FROM customer WHERE email = 'kool@gmail.com'),
  5,
  (SELECT status_id FROM address_status WHERE status_name = 'Current')
),
(
  (SELECT customer_id FROM customer WHERE email = 'kool@gmail.com'),
  6,
  (SELECT status_id FROM address_status WHERE status_name = 'Shipping')
),

-- Shukri Hassan
(
  (SELECT customer_id FROM customer WHERE email = 'san@gmail.com'),
  7,
  (SELECT status_id FROM address_status WHERE status_name = 'Current')
),
(
  (SELECT customer_id FROM customer WHERE email = 'san@gmail.com'),
  8,
  (SELECT status_id FROM address_status WHERE status_name = 'Billing')
),

-- Ngozi Chukwu
(
  (SELECT customer_id FROM customer WHERE email = 'ngozichukwu@gmail.com'),
  9,
  (SELECT status_id FROM address_status WHERE status_name = 'Current')
),
(
  (SELECT customer_id FROM customer WHERE email = 'ngozichukwu@gmail.com'),
  10,
  (SELECT status_id FROM address_status WHERE status_name = 'Shipping')
),

-- Amahle Dlamini
(
  (SELECT customer_id FROM customer WHERE email = 'amahled@eyahoo.com'),
  11,
  (SELECT status_id FROM address_status WHERE status_name = 'Current')
),
(
  (SELECT customer_id FROM customer WHERE email = 'amahled@eyahoo.com'),
  12,
  (SELECT status_id FROM address_status WHERE status_name = 'Previous')
),

-- Sophie Müller
(
  (SELECT customer_id FROM customer WHERE email = 'sophiemueller2@yahoo.com'),
  13,
  (SELECT status_id FROM address_status WHERE status_name = 'Current')
),
(
  (SELECT customer_id FROM customer WHERE email = 'sophiemueller2@yahoo.com'),
  14,
  (SELECT status_id FROM address_status WHERE status_name = 'Billing')
),

-- Jean Dupont
(
  (SELECT customer_id FROM customer WHERE email = 'jeandupon6t@gmail.com'),
  15,
  (SELECT status_id FROM address_status WHERE status_name = 'Current')
),
(
  (SELECT customer_id FROM customer WHERE email = 'jeandupon6t@gmail.com'),
  16,
  (SELECT status_id FROM address_status WHERE status_name = 'Shipping')
),

-- Wei Chen
(
  (SELECT customer_id FROM customer WHERE email = 'weichen@outlook.com'),
  17,
  (SELECT status_id FROM address_status WHERE status_name = 'Current')
),
(
  (SELECT customer_id FROM customer WHERE email = 'weichen@outlook.com'),
  18,
  (SELECT status_id FROM address_status WHERE status_name = 'Billing')
),

-- Priya Patel
(
  (SELECT customer_id FROM customer WHERE email = 'priyapatel@gmail.com'),
  19,
  (SELECT status_id FROM address_status WHERE status_name = 'Current')
),
(
  (SELECT customer_id FROM customer WHERE email = 'priyapatel@gmail.com'),
  20,
  (SELECT status_id FROM address_status WHERE status_name = 'Shipping')
),

-- Youssef Alfarsi
(
  (SELECT customer_id FROM customer WHERE email = 'youssefalfarsi@yahoo.com'),
  21,
  (SELECT status_id FROM address_status WHERE status_name = 'Current')
),
(
  (SELECT customer_id FROM customer WHERE email = 'youssefalfarsi@yahoo.com'),
  22,
  (SELECT status_id FROM address_status WHERE status_name = 'Billing')
),

-- Sofía García
(
  (SELECT customer_id FROM customer WHERE email = 'sofigarcia896@yahoo.com'),
  23,
  (SELECT status_id FROM address_status WHERE status_name = 'Current')
),
(
  (SELECT customer_id FROM customer WHERE email = 'sofigarcia896@yahoo.com'),
  24,
  (SELECT status_id FROM address_status WHERE status_name = 'Shipping')
),

-- Aisha Johnson
(
  (SELECT customer_id FROM customer WHERE email = 'aishajohnsonofficial@outlook.com'),
  25,
  (SELECT status_id FROM address_status WHERE status_name = 'Current')
),
(
  (SELECT customer_id FROM customer WHERE email = 'aishajohnsonofficial@outlook.com'),
  26,
  (SELECT status_id FROM address_status WHERE status_name = 'Previous')
),

-- Tyrone Williams
(
  (SELECT customer_id FROM customer WHERE email = 'tyronew@gmail.com'),
  27,
  (SELECT status_id FROM address_status WHERE status_name = 'Current')
),
(
  (SELECT customer_id FROM customer WHERE email = 'tyronew@gmail.com'),
  28,
  (SELECT status_id FROM address_status WHERE status_name = 'Billing')
);


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