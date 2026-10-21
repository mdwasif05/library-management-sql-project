-- 1. Create the MEMBERS table
-- Stores registration information for students and cardholders.
CREATE TABLE members (
    member_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    join_date DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'Active' CHECK (status IN ('Active', 'Inactive'))
);

-- 2. Create the BOOKS table
-- Stores the catalog details and baseline inventory.
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    published_year INT,
    total_copies INT NOT NULL DEFAULT 1
);

-- 3. Create the LOANS table
-- Tracks every borrowing transaction. Links members and books.
CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    issue_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE, -- Will remain NULL until the book is actually returned
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (member_id) REFERENCES members(member_id) ON DELETE CASCADE
);

-- 4. Create the PENALTIES table
-- Tracks fines generated from late book returns.
CREATE TABLE penalties (
    penalty_id INT PRIMARY KEY,
    loan_id INT,
    amount_due DECIMAL(6, 2) NOT NULL,
    payment_status VARCHAR(20) DEFAULT 'Unpaid' CHECK (payment_status IN ('Paid', 'Unpaid')),
    FOREIGN KEY (loan_id) REFERENCES loans(loan_id) ON DELETE CASCADE
);
