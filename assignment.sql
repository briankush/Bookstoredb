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
