-- 5 Analytics Questions to solve
-- Q1. Find the top 5 most frequently borrowed in the library's history
SELECT b.title,
       b.author,
       b.genre,
       COUNT(l.loan_id) AS total_borrowed_count
FROM books b
INNER JOIN loans l ON b.book_id = l.book_id
GROUP BY b.book_id, b.title, b.author, b.genre
ORDER BY total_borrowed_COUNT DESC
LIMIT 5;
-- Q2. Identify all members with unpaid penalties, showing their full name and the total amount due
SELECT m.first_name,
       m.last_name, 
       SUM(p.amount_due) AS total_unpaid_fines
FROM members m
INNER JOIN loans l ON m.member_id = l.member_id
INNER JOIN penalties p ON l.loan_id = p.loan_id
WHERE p.payment_status = "Unpaid"
GROUP BY m.member_id, m.first_name, m.last_name
ORDER BY total_unpaid_fines DESC;
-- Q3. List all members who returned books late more than 3 times
select m.member_id,
       m.first_name,
       m.last_name,
       COUNT(l.loan_id) AS total_late_returns
from members m
INNER JOIN loans l ON m.member_id = l.member_id
WHERE l.return_date > l.due_date
GROUP BY m.member_id, m.first_name, m.last_name
HAVING COUNT(l.loan_id) > 3
ORDER BY total_late_returns DESC;
-- Q4. Determine the percentage of copies currently checked out for each genre
SELECT 
    b.genre,
    SUM(b.total_copies) AS total_inventory_copies,
    COUNT(CASE WHEN l.return_date IS NULL AND l.issue_date IS NOT NULL THEN 1 END) AS copies_currently_checked_out,
    ROUND(
        COUNT(CASE WHEN l.return_date IS NULL AND l.issue_date IS NOT NULL THEN 1 END) * 100.0 / SUM(b.total_copies), 
        2
    ) AS utilization_rate_percentage
FROM books b
LEFT JOIN loans l ON b.book_id = l.book_id
GROUP BY b.genre
ORDER BY utilization_rate_percentage DESC;
-- Q5. Find out which month of the year sees the highest columns of the book checkouts
SELECT 
	MONTHNAME(issue_date) as checkout_month,
    COUNT(loan_id) AS total_checkouts
FROM loans
GROUP BY MONTH(issue_date), MONTHNAME(issue_date)
ORDER BY total_checkouts DESC;
