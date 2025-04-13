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