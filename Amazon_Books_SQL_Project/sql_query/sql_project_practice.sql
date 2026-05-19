


SELECT * FROM Amazon_Books


-- Show all books with rating greater than 4.5.

SELECT *
FROM Amazon_Books
WHERE rating > 4.5



--  Find books priced above 20

SELECT * 
FROM Amazon_Books
WHERE Price_USD > 20

-- Display all Fiction books.

SELECT * 
FROM Amazon_Books
WHERE Category = 'Fiction'


-- Show books published after 2020.

SELECT * 
FROM Amazon_Books
WHERE Year_Published > 2020


-- Find books written by a specific author.

SELECT * 
FROM Amazon_Books
WHERE Author = 'Andy Weir'

-- List books sorted by highest rating.


SELECT *
FROM Amazon_Books
ORDER BY rating DESC


-- List top 10 most expensive books.


SELECT TOP 10 * 
FROM Amazon_Books
ORDER BY Price_USD DESC


-- Show books with more than 10,000 reviews.


SELECT * 
FROM Amazon_Books
WHERE Reviews > 10000



-- Find books whose title contains the word “Life”.

SELECT * 
FROM Amazon_Books
WHERE title LIKE '%Life%'


-- Display books in Paperback format only.

SELECT * 
FROM Amazon_Books
WHERE format = 'paperback'




---- LEVEL : 02 ----


-- Find the average rating of all books by category.



SELECT Category, AVG(rating) AS avg_rating
FROM Amazon_Books
GROUP BY Category


-- Find the highest-priced book.


SELECT TOP 1 * 
FROM Amazon_Books
ORDER BY price_usd DESC



-- Find the lowest-rated book.


SELECT TOP 1 * 
FROM Amazon_Books
ORDER BY rating ASC




-- Count total number of books in dataset.


SELECT COUNT(*) AS total_count 
FROM Amazon_Books


-- Count unique authors.

SELECT COUNT(DISTINCT(author)) AS unique_author
FROM Amazon_Books


-- Find average price of books.


SELECT ROUND(AVG(price_usd),2) AS total_avg
FROM Amazon_Books


-- Find total reviews across all books.


SELECT  COUNT(reviews) AS total_reviews
FROM Amazon_Books


-- Find the maximum weeks on list.


SELECT MAX(Weeks_on_List) AS max_week
FROM Amazon_Books


-- Find average reviews per book.


SELECT Title, AVG(reviews) AS avg_reviews
FROM Amazon_Books
GROUP BY Title


-- Find total number of publishers.


SELECT COUNT(publisher) AS publisher_count 
FROM Amazon_Books



--- LEVEL : 03 ----


-- Find average rating by category.


	SELECT category, ROUND(AVG(rating) ,2 )AS avg_rating 
	FROM Amazon_Books
	GROUP BY category 



-- Count books in each category.


SELECT category, COUNT(*)  AS total_count
FROM Amazon_Books
GROUP BY Category




-- Find average price by format.


SELECT format, AVG(price_usd) AS avg_price_per_froamt
FROM Amazon_Books
GROUP BY format 



-- Find total reviews by publisher.


SELECT publisher , COUNT(reviews) AS total_reviews
FROM Amazon_Books
GROUP BY publisher



-- Count books published each year.


SELECT Year_Published, COUNT(*) AS count
FROM Amazon_Books
GROUP BY Year_Published


select * from Amazon_Books

-- Find highest-rated book in each category.


SELECT category, MAX(rating) AS rating 
FROM Amazon_Books
GROUP BY Category 


-- Find average weeks on list by sub-genre.



SELECT Sub_Genre, AVG(weeks_on_list) AS average
FROM Amazon_Books
GROUP BY Sub_Genre



-- Count books by author.


SELECT author, COUNT(*) AS no_of_books
FROM Amazon_Books
GROUP BY author




-- Find average price by publisher.


SELECT publisher, AVG(price_usd) AS average
FROM Amazon_Books
GROUP BY Publisher



-- Find publishers with more than 5 bestselling books.

SELECT publisher, COUNT(*)
FROM Amazon_Books
GROUP BY Publisher
HAVING COUNT(*) > 5



--- LEVEL : 04 --- 


-- Show categories with average rating above 4.5.


SELECT category, AVG(rating) AS average_rating
FROM Amazon_Books
GROUP BY category 
HAVING avg(rating) > 4.0






-- Find publishers with more than 5 books.


SELECT publisher, COUNT(*)  AS total_count 
FROM Amazon_Books
GROUP BY Publisher
HAVING COUNT(*) > 5



-- Show authors whose books received more than 50,000 total reviews.


SELECT author, SUM(reviews) AS reviews  
FROM Amazon_Books
GROUP BY Author
HAVING SUM(reviews) > 50000


-- Find formats whose average price exceeds 20.


SELECT format, AVG(price_usd)  AS average
FROM Amazon_Books
GROUP BY Format
HAVING AVG(price_usd) > 20 


-- Show sub-genres having more than 10 books.


SELECT sub_genre, COUNT(*) AS count 
FROM Amazon_Books
GROUP BY Sub_genre
HAVING COUNT(*) > 10 


select * from Amazon_Books



-- Find years where more than 20 books were published


SELECT Year_Published, COUNT(*) AS count
FROM Amazon_Books
GROUP BY Year_Published
HAVING COUNT(*) > 20 



-- Show categories with average weeks on list above 30.


SELECT * FROM Amazon_Books



SELECT category, AVG(weeks_on_list) AS avg
FROM Amazon_Books
GROUP BY category 
HAVING AVG(weeks_on_list) > 30





 
-- LEVEL 5 — Business-Oriented Questions


-- Which books have the highest reviews?

SELECT * FROM Amazon_Books


SELECT title, reviews
FROM Amazon_Books
ORDER BY reviews DESC



-- Which category gets the most customer reviews?


SELECT category, SUM(reviews ) AS reviews
FROM Amazon_Books
GROUP BY category
ORDER BY SUM(reviews) DESC



-- Do highly rated books always have high reviews?


select * from Amazon_Books


SELECT title,
       rating,
       reviews
FROM Amazon_Books
ORDER BY rating DESC, reviews DESC;



-- Which publisher has the highest average reviews?

SELECT TOP 1 * 
FROM (
SELECT publisher, AVG(reviews) AS average
FROM Amazon_Books
GROUP BY Publisher ) k ORDER BY average DESC 

SELECT TOP 1 publisher, AVG(reviews) AS average
FROM Amazon_Books
GROUP BY Publisher
ORDER BY AVG(reviews) DESC




-- Which books remained longest on bestseller list?

SELECT * FROM Amazon_Books


SELECT * 
FROM Amazon_Books
ORDER BY Weeks_on_List DESC


-- Which category contains the most expensive books?


SELECT category, SUM(Price_USD) as sum
FROM Amazon_Books
GROUP BY category 
ORDER BY SUM(price_usd) DESC


-- What is the average price of Fiction vs Non-Fiction?



SELECT category, AVG(price_usd) AS average
FROM Amazon_Books
GROUP BY Category



-- Are highly priced books highly rated?


SELECT title, price_usd, rating 
FROM Amazon_Books
ORDER BY price_usd desc, rating desc




-- Which format is cheapest on average?


SELECT format, AVG(price_usd) AS avg
FROM Amazon_Books
GROUP BY format
ORDER BY avg




-- Find books with high ratings but low prices.


SELECT title, rating, price_usd
FROM Amazon_Books
ORDER BY rating DESC, price_usd ASC




-- Which publisher has the most bestselling books?



SELECT publisher, COUNT(*) 
FROM Amazon_Books
GROUP BY publisher
ORDER BY COUNT(*) DESC 



-- Which publisher produces highest-rated books?


SELECT publisher , AVG(rating) AS avg
FROM Amazon_Books
GROUP BY publisher 
ORDER BY AVG(rating) DESC


-- Which publishers dominate specific genres?  

SELECT category,
       publisher,
       COUNT(*) AS total_books
FROM Amazon_Books
GROUP BY category, publisher
ORDER BY category, total_books DESC;



-- Which publisher has books with longest weeks on list?




-- Find books priced above average price.


SELECT * FROM Amazon_Books
WHERE price_usd > (

SELECT ROUND(AVG(Price_Usd),2)
FROM Amazon_Books )



-- Find books with rating higher than overall average rating.



SELECT * FROM 
Amazon_Books
WHERE Rating > (
SELECT ROUND(AVG(rating),2) 
FROM Amazon_Books
)



-- Find publishers whose total reviews are above average publisher reviews.



SELECT publisher, SUM(reviews) AS average_rev
FROM Amazon_Books
group by Publisher
HAVING SUM(reviews) >  (

SELECT AVG(average_rev) 
FROM ( 

SELECT publisher, SUM(reviews) AS average_rev
FROM Amazon_Books
group by Publisher


) k
)




-- Find books having maximum reviews in each category.



SELECT category, title, MAX(reviews)
FROM Amazon_Books
GROUP BY category, title
ORDER BY category , MAX(reviews) DESC


  

-- Find books whose price is equal to highest price in their category.



SELECT title,
       category,
       price_usd
FROM Amazon_Books a
WHERE price_usd = (
SELECT MAX(price_Usd) 
FROM Amazon_Books b 
WHERE a.Category= b.category
)




-- Find categories with total reviews greater than overall average reviews.


select * from Amazon_Books

    
 SELECT category, SUM(reviews) AS avg_col
 FROM Amazon_Books
 GROUP BY category 
 HAVING SUM(reviews) > (


 SELECT AVG(avg_col)
 FROM (
 SELECT category, AVG(reviews) AS avg_col
 FROM Amazon_Books
 GROUP BY category 
 ) K

 )