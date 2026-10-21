-- 1. Populate MEMBERS
INSERT INTO members (member_id, first_name, last_name, join_date, status) VALUES
(101, 'Arjun', 'Mehta', '2025-01-15', 'Active'),
(102, 'Priya', 'Sharma', '2025-03-22', 'Active'),
(103, 'Rohan', 'Das', '2025-06-10', 'Active'),
(104, 'Ananya', 'Iyer', '2025-08-05', 'Active'),
(105, 'Kabir', 'Singh', '2025-11-01', 'Inactive');

-- 2. Populate BOOKS
INSERT INTO books (book_id, title, author, genre, published_year, total_copies) VALUES
(501, 'Introduction to SQL', 'Ben Forta', 'Technology', 2021, 5),
(502, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 1951, 3),
(503, 'A Brief History of Time', 'Stephen Hawking', 'Science', 1988, 2),
(504, 'Data Analytics Basics', 'Tristan Handy', 'Technology', 2023, 4),
(505, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, 3);

-- 3. Populate LOANS
-- Includes: clean returns, an unreturned loan, a late return, and an overdue book
INSERT INTO loans (loan_id, book_id, member_id, issue_date, due_date, return_date) VALUES
(1001, 501, 101, '2026-01-10', '2026-01-24', '2026-01-20'), -- Returned on time
(1002, 502, 102, '2026-02-01', '2026-02-15', '2026-02-20'), -- Returned LATE (5 days)
(1003, 501, 103, '2026-03-01', '2026-03-15', '2026-03-12'), -- Returned on time
(1004, 504, 101, '2026-03-10', '2026-03-24', NULL),         -- Checked out, not due yet
(1005, 503, 104, '2026-04-01', '2026-04-15', '2026-04-25'), -- Returned LATE (10 days)
(1006, 505, 102, '2026-04-05', '2026-04-19', NULL),         -- OVERDUE (Still unreturned)
(1007, 501, 102, '2026-05-01', '2026-05-15', '2026-05-22'); -- Returned LATE (7 days)

-- 4. Populate PENALTIES
-- Links directly to the late loan transactions above
INSERT INTO penalties (penalty_id, loan_id, amount_due, payment_status) VALUES
(2001, 1002, 50.00, 'Paid'),    -- Fine paid for loan 1002
(2002, 1005, 100.00, 'Unpaid'), -- Fine unpaid for loan 1005
(2003, 1007, 70.00, 'Unpaid');  -- Fine unpaid for loan 1007
