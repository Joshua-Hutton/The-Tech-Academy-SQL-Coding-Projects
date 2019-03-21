create database library_db;

USE library_db;

-----------------------------------
 --CREATE ALL TABLES IN DATABASE--
-----------------------------------
			CREATE TABLE library_branch_tbl(
				branch_id  INT PRIMARY KEY NOT NULL IDENTITY(1,1),
				branch_name VARCHAR(50) NOT NULL,
				branch_address VARCHAR(50)
			);

			CREATE TABLE borrower_tbl(
				card_No INT PRIMARY KEY NOT NULL IDENTITY(100000,1),
				borrower_name VARCHAR(50) NOT NULL,
				borrower_address VARCHAR (50),
				borrower_phone VARCHAR (50)
			);

			CREATE TABLE publisher_tbl(
				publisher_id VARCHAR(50) PRIMARY KEY NOT NULL,
				publisher_address VARCHAR(50) NOT NULL,
				publisher_phone VARCHAR(50)
			);

			CREATE TABLE authers_tbl(
				auther_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
				auther_name VARCHAR(50) NOT NULL
			);

			CREATE TABLE books_tbl(
				book_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
				book_title VARCHAR(50) NOT NULL,
				book_publisher VARCHAR (50) NOT NULL CONSTRAINT fk_publisher_id FOREIGN KEY REFERENCES publisher_tbl(publisher_id) ON UPDATE CASCADE ON DELETE CASCADE,
				book_auther Int	NOT NULL CONSTRAINT fk_auther_id FOREIGN KEY REFERENCES authers_tbl(auther_id) ON UPDATE CASCADE ON DELETE CASCADE	
			
			);

			CREATE TABLE book_loan_tbl(
				loan_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
				book_name INT NOT NULL  CONSTRAINT fk_book_name FOREIGN KEY REFERENCES books_tbl(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
				branch_id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES library_branch_tbl(branch_id)  ON UPDATE CASCADE ON DELETE CASCADE,
				card_No INT NOT NULL CONSTRAINT fk_borrower_id FOREIGN KEY REFERENCES borrower_tbl(card_No)  ON UPDATE CASCADE ON DELETE CASCADE,
				date_out DATE,
				date_due DATE
			);

			

			CREATE TABLE book_copies_tbl (
				copies_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
				book_name INT NOT NULL  CONSTRAINT fk_book_name_copies FOREIGN KEY REFERENCES books_tbl(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
				branch_id INT NOT NULL CONSTRAINT fk_branch_id_copies FOREIGN KEY REFERENCES library_branch_tbl(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
				number_of_copies INT NOT NULL
			);

------------------------------
 --INSERT DATA INTO TABLES--
------------------------------

		INSERT INTO library_branch_tbl
		(branch_name, branch_address)
		VALUES
		('Central', '343 S 5th Ave, Ann Arbor, MI 48104'),
		('Sharpstown', '1000 Some Where St, Ann Arbor, MI 48104'),
		('Traverwood', '3333 Traverwood Dr, Ann Arbor, MI 48105'),
		('Malletts Creek', '3090 E Eisenhower Pkwy, Ann Arbor, MI 48108')
		;

		INSERT INTO publisher_tbl
		(publisher_id,publisher_address,publisher_phone)
		Values
		('Viking Press', '375 Hudson St, New York, NY, 10014','212-366-2000'),
		('Doubleday', '1745 Broadway, New York, NY, 10019', '718-413-8769'),
		('Henery Holt & Co', '175 Fifth Ave, New York, NY, 10010', '646-307-5095'),
		('Scholastic Inc.', '557 Broadway, New York, NY, 10012', '800-724-6527'),
		('Harcourt', '6277 Sea Harbor Dr, Orlando, FL, 32887', '407-345-2000'),
		('Ace Fanticy', '375 Hudson St, New York, NY, 10014','212-366-2000'),
		('Solaris', 'Riverside House, Osney Mead, Oxford, OX2 0ES', '+44 (0) 1865 792 201'),
		('Berkley', '200 Madison Ave, New York, NY, 10016','N/A'),
		('Barns & Noble', '122 5th Ave New York, NY', '866-238-7323'),
		('Bantam', '375 Hudson St, New York, NY, 10014','212-366-2000'),
		('Ballantine',  '375 Hudson St, New York, NY, 10014','212-366-2000'),
		('Anchor',  '375 Hudson St, New York, NY, 10014','212-366-2000'),
		('Orbit', '237 Park Ave, New York, NY, 10017', 'N/A')
		; 

		INSERT INTO authers_tbl
		(auther_name)
		VALUES
		('Stephen King'),
		('Edward Marriott'),
		('J.K. Rowlling'),
		('Jose Saramago'),
		('Brian Jaques'),
		('Gail Z Martin'),
		('Michal Moorcock'),
		('Braim Stoker'),
		('Mary Shelley'),
		('Judith Rock'),
		('J.R.R. Tolkien'),
		('Clinua Achebe'),
		('Karen Miller')
		;

		INSERT INTO books_tbl 
		(book_title,book_publisher, book_auther)
		VALUES
		('It', 'Viking Press', 1),
		('The Shining', 'Doubleday', 1),
		('The Lost Tribe', 'Henery Holt & Co', 2),
		('Harry Potter: And the Sorcerer''s Stone', 'Scholastic Inc.', 3),
		('Harry Potter: And the Chanmber of Secrets', 'Scholastic Inc.', 3),
		('Death with Interruptions', 'Harcourt', 4),
		('The Long Patrol', 'Ace Fanticy', 5),
		('The Summoner', 'Solaris', 6),
		('Eiric of Melnibone', 'Berkley', 7),
		('Dracula', 'Barns & Noble', 8),
		('Frankenstien', 'Bantam', 9),
		('The Rhetoric of Death', 'Berkley', 10),
		('The Hobbit', 'Ballantine', 11),
		('The Fellowship of the Ring', 'Ballantine', 11),
		('The Two Towers',  'Ballantine', 11),
		('The Return of the King',  'Ballantine', 11),
		('RedWall', 'Ace Fanticy', 5),
		('Things Fall Apart', 'Anchor', 12),
		('The Blood King', 'Solaris', 6), 
		('The Innocent Mage', 'Orbit', 13)
		;

		INSERT INTO book_copies_tbl
		(branch_id,book_name,number_of_copies)
		VALUES
		--CENTRAL BRANCHES INVENTORY
		(1,1,2),(1,2,2),(1,3,5),(1,4,8),(1,5,2),(1,6,0),(1,7,4),(1,8,0),(1,9,2),(1,10,7),
		(1,11,1),(1,12,2),(1,13,9),(1,14,0),(1,15,2),(1,16,4),(1,17,6),(1,18,2),(1,19,2),(1,20,3),
		--SHARPSTOWN'S INVENTORY
		(2,1,3),(2,2,2),(2,3,4),(2,4,0),(2,5,6),(2,6,2),(2,7,4),(2,8,2),(2,9,7),(2,10,3),
		(2,11,2),(2,12,3),(2,13,2),(2,14,5),(2,15,4),(2,16,2),(2,17,3),(2,18,0),(2,19,2),(2,20,2),
		--TRAVARWOOD'S INVENTORY
		(3,1,0),(3,2,2),(3,3,3),(3,4,2),(3,5,2),(3,6,5),(3,7,3),(3,8,9),(3,9,2),(3,10,4),
		(3,11,2),(3,12,4),(3,13,2),(3,14,2),(3,15,4),(3,16,3),(3,17,5),(3,18,2),(3,19,5),(3,20,4),
		--MALLETTS CREEK'S INVENTORY
		(4,1,3),(4,2,5),(4,3,2),(4,4,4),(4,5,6),(4,6,2),(4,7,3),(4,8,2),(4,9,4),(4,10,10),
		(4,11,2),(4,12,5),(4,13,3),(4,14,2),(4,15,3),(4,16,2),(4,17,0),(4,18,3),(4,19,2),(4,20,3)
		;

		INSERT INTO borrower_tbl
		(borrower_name,borrower_address,borrower_phone)
		VALUES
		('Malcolm Reynalds', '36 Bonnet Way, Space, Space, 00000', '123-456-7890'),
		('Zoe Washburne', '72 Hero Trl, Ann Arbor, MI, 45105', '456-789-0123'),
		('Hoban Washburne', '72 Hero Trl, Ann Arbor, MI, 45105', '456-789-0123'),
		('Inara Sarra', '69 Companion Dr, Ypsilanti MI, 48197', '789-012-3456'),
		('Jayne Cobb', '211 Mudders St, Jayne''s Town, Higgins Moon,99528', '147-258-3690'),
		('Kaylee Frye', '44 Froofala blvd, Saline,MI,48947', '963-852-7410'),
		('Simon Tam', '7890 Medical Center dr, Ann Arbor, MI 48104', '951-753-4862'),
		('River Tam', '7890 Medical Center dr, Ann Arbor, MI 48104', '951-753-4862'),
		('Derrial Book', '240 Shepherd Ct, Ypislanti, MI, 48198', '579-148-6023')
		;
		
		INSERT INTO book_loan_tbl
		(book_name,branch_id,card_No,date_out,date_due)
		VALUES
		(7,1,100000,'2019-03-11','2019-04-10'),
		(4,1,100000,'2019-03-11','2019-04-10'),
		(12,1,100000,'2019-03-11','2019-04-10'),
		(20,1,100000,'2019-03-11','2019-04-10'),
		(16,1,100000,'2019-03-11','2019-04-10'),
		(9,1,100000,'2019-03-11','2019-04-10'),

		(13,3,100001,'2019-03-20','2019-04-19'),
		(18,3,100001,'2019-03-20','2019-04-19'),
		(14,3,100001,'2019-03-20','2019-04-19'),
		(8,3,100001,'2019-03-20','2019-04-19'),
		(5,3,100001,'2019-03-20','2019-04-19'),

		(6,3,100002,'2019-03-20','2019-04-19'),
		(16,3,100002,'2019-03-20','2019-04-19'),
		(12,3,100002,'2019-03-20','2019-04-19'),
		(4,3,100002,'2019-03-20','2019-04-19'),

		(3,2,100003,'2019-03-02','2019-04-01'),
		(17,2,100003,'2019-03-02','2019-04-01'),
		(19,2,100003,'2019-03-02','2019-04-01'),
		(2,2,100003,'2019-03-02','2019-04-01'),
		(9,2,100003,'2019-03-02','2019-04-01'),

		(14,1,100005,'2019-03-04','2019-04-03'),
		(10,1,100005,'2019-03-04','2019-04-03'),
		(16,1,100005,'2019-03-04','2019-04-03'),
		(2,1,100005,'2019-03-04','2019-04-03'),
		(4,1,100005,'2019-03-04','2019-04-03'),

		(1,1,100006,'2019-03-21','2019-04-20'),
		(3,1,100006,'2019-03-21','2019-04-20'),
		(5,1,100006,'2019-03-21','2019-04-20'),
		(7,1,100006,'2019-03-21','2019-04-20'),
		(9,1,100006,'2019-03-21','2019-04-20'),
		(11,1,100006,'2019-03-21','2019-04-20'),
		(13,1,100006,'2019-03-21','2019-04-20'),
		(15,1,100006,'2019-03-21','2019-04-20'),
		(17,1,100006,'2019-03-21','2019-04-20'),
		(19,1,100006,'2019-03-21','2019-04-20'),
		(2,2,100006,'2019-02-20','2019-03-21'),
		(4,2,100006,'2019-02-20','2019-03-21'),
		(6,2,100006,'2019-02-20','2019-03-21'),
		(8,2,100006,'2019-02-20','2019-03-21'),
		(10,2,100006,'2019-02-20','2019-03-21'),
		(12,2,100006,'2019-02-20','2019-03-21'),

		(2,1,100007,'2019-03-17','2019-04-16'),
		(6,1,100007,'2019-03-17','2019-04-16'),
		(10,1,100007,'2019-03-17','2019-04-16'),
		(14,1,100007,'2019-03-17','2019-04-16'),
		(18,1,100007,'2019-03-17','2019-04-16'),
		(20,1,100007,'2019-03-17','2019-04-16'),

		(3,2,100008,'2019-03-07','2019-04-06'),
		(7,2,100008,'2019-03-07','2019-04-06'),
		(11,2,100008,'2019-03-07','2019-04-06'),
		(15,2,100008,'2019-03-07','2019-04-06'),
		(19,2,100008,'2019-03-07','2019-04-06')
		;


-------------------------------		
 --CREATE STORED PROCEDURES--
-------------------------------


--LOST TRIBE COPIES IN SHARPSTOWN
GO 
CREATE PROC lostTribeInSharpstown
AS
	SELECT 
	t3.branch_name, t2.book_title, t1.number_of_copies
	FROM book_copies_tbl t1
	INNER JOIN books_tbl t2 ON t2.book_id = t1.book_name
	INNER JOIN library_branch_tbl t3 ON t3.branch_id = t1.branch_id
	WHERE t1.book_name in(
	SELECT book_id From books_tbl WHERE book_title = 'The Lost Tribe') and t1.branch_id in(
	SELECT branch_id FROM library_branch_tbl Where branch_name = 'Sharpstown'); 
GO

--LOST TRIBE COPIES IN ALL BRANCHES 
GO 
CREATE PROC lostTribeInAll
AS
	SELECT t2.branch_name, t1.number_of_copies 
	FROM book_copies_tbl t1
	INNER JOIN library_branch_tbl t2 ON t2.branch_id = t1.branch_id
	 WHERE book_name in(SELECT book_id FROM books_tbl WHERE book_title = 'The Lost Tribe')
 Go

 --SHARPSTOWN BOOK DUE TODAY
 GO
 CREATE PROC booksDueSharpstown
 AS
	 SELECT T3.book_title,T2.borrower_name,T2.borrower_address  
	 FROM book_loan_tbl T1
	 INNER JOIN borrower_tbl T2 ON T2.card_No = T1.card_No
	 INNER JOIN books_tbl T3 ON T3.book_id = T1.book_name
	 INNER JOIN library_branch_tbl T4 ON T4.branch_id = T1.branch_id
	 WHERE T1.date_due = CONVERT(DATE, GETDATE()) AND T1.branch_id IN(
	 SELECT branch_id FROM library_branch_tbl WHERE branch_name='Sharpstown');
 GO 

 --BORROWERS WITH NO BOOKS
 GO 
 CREATE PROC borrowersNoBooks
 AS
	 SELECT T2.borrower_name
	 FROM book_loan_tbl T1
	 RIGHT JOIN borrower_tbl T2 ON T2.card_No = T1.card_No
	 WHERE T1.card_No IS NULL;
 GO

 --TOTAL NUMBER OF BOOK ON LOAN FROM EACH BRANCH
 GO 
 CREATE PROC booksOutByBranch
 AS
	 SELECT COUNT(T1.branch_id) AS 'Books Loaned',T2.branch_name 
	 FROM book_loan_tbl T1
	 INNER JOIN library_branch_tbl T2 ON T2.branch_id=T1.branch_id
	 GROUP BY branch_name;
 GO

 --ALL WITH MORE THEN 5 BOOKS
 GO 
 CREATE PROC moreThen5Out
 AS
	 SELECT COUNT(T2.card_No) AS 'Books Out',
	 T1.borrower_name,T1.borrower_address,T1.borrower_phone
	 FROM borrower_tbl T1
	 INNER JOIN book_loan_tbl T2 ON T2.card_No= T1.card_No
	 GROUP BY T1.borrower_name,T1.borrower_address,T1.borrower_phone
	 HAVING COUNT(T2.card_No) > 5;
 GO

 --CENTRAL'S STEPHEN KING BOOKS
 GO 
 CREATE PROC stephenKingAtCentral
 AS
	 SELECT T2.book_title,T1.number_of_copies,T3.branch_name
	 FROM book_copies_tbl T1
	 INNER JOIN books_tbl T2 ON T2.book_id= T1.book_name
	 INNER JOIN library_branch_tbl T3 ON T3.branch_id = T1.branch_id
	 WHERE T3.branch_name = 'Central' AND 
	 T2.book_auther IN( SELECT auther_id FROM authers_tbl WHERE auther_name='Stephen King');
 GO
	