--1 Buku apa saja yang diminati user namun sering mengalami shortage?
SELECT 
    title, 
    SUM(qty) AS total_qty, 
    COUNT(loan_id) AS total_loans, 
    COUNT(hold_id) AS total_holds,
    (COUNT(loan_id) + COUNT(hold_id)) AS total_demand,
    (COUNT(loan_id) + COUNT(hold_id)) - SUM(qty) AS shortage
FROM 
    books
JOIN 
    library_books USING(book_id)
LEFT JOIN 
    loans USING(library_book_id)
LEFT JOIN 
    holds USING (library_book_id)
GROUP BY 
    title
HAVING 
    (COUNT(loan_id) + COUNT(hold_id)) > SUM(qty)
ORDER BY 
    shortage DESC, total_demand DESC
LIMIT 10;

--2 Berapa rata-rata durasi peminjaman buku pada seluruh genre?
SELECT 
	genre, 
	AVG(EXTRACT(DAY FROM (return_date - loan_date))) AS avg_loan_duration
FROM loans
JOIN library_books USING(library_book_id)
JOIN books USING(book_id)
JOIN book_genre USING(book_id)
JOIN genres USING(genre_id)
GROUP BY genre;

--3 Buku mana yang memiliki frekuensi peminjaman tertinggi di semua library?
SELECT 
	title, 
	qty, 
	COUNT(loan_id) AS loan_count
FROM 
	books
JOIN 
	library_books USING(book_id)
JOIN 
	loans USING(library_book_id)
GROUP BY title, qty
ORDER BY loan_count DESC
LIMIT 10;


--4. Buku mana yang jarang dipinjam meskipun tersedia di banyak perpustakaan?
SELECT 
	title, 
	COUNT(loan_id) AS loan_count, 
	COUNT(DISTINCT library_id) AS library_count
FROM 
	books
JOIN 
	library_books USING(book_id)
LEFT JOIN 
	loans USING(library_book_id)
GROUP BY title
HAVING COUNT(loan_id) = 0 AND COUNT(DISTINCT library_id) > 1
ORDER BY library_count DESC;

--5. Perpustakaan mana yang memiliki jumlah pengguna aktif terbanyak dan bagaimana hubungan dengan jumlah ketersediaan buku pada perpustkaan tersebut?
SELECT 
	name AS library_name, 
	COUNT(DISTINCT user_id) AS active_users, 
	SUM(qty) AS total_books
FROM 
	libraries
JOIN 
	library_books USING(library_id)
JOIN 
	loans USING(library_book_id)
GROUP BY name
ORDER BY active_users DESC;






