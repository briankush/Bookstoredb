-- Customer table
insert into customer (first_name, last_name, email, phone) values('Brian', 'Mwangi', 'briankush05@gmail.com', '+25424345670');
insert into customer (first_name, last_name, email, phone) values('James', 'Bond', 'jamesbond01@gmail.com', '+23324867463');
insert into customer (first_name, last_name, email, phone) values('Daddy', 'Kool', 'kool@gmail.com', '+25524567453');
insert into customer (first_name, last_name, email, phone) values('Shukri', 'Hassan', 'san@gmail.com', '+445924824457');
INSERT INTO customer (first_name, last_name, email, phone) VALUES
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

-- Country table
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


-- Address table
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


