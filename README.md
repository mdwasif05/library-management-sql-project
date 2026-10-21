# Relational Database Design & Analytics: Library Management System

## Project Overview
This project demonstrates the end-to-end design, implementation, and analysis of a relational **Library Management System** using SQL. The project transitions from raw structural engineering (DDL) to data population (DML) and concludes with advanced exploratory data analysis to solve core business problems.

The goal of this system is to manage book inventories, track student/member checkout logs, monitor late returns, and calculate financial outstanding penalties.

---

## Database Architecture (Schema)
The database comprises **four tables** engineered with strict relational constraints, primary keys (PK), foreign keys (FK), and cascading deletions to guarantee data integrity.

| Table | Primary Key | Foreign Key(s) | Business Function |
| :--- | :--- | :--- | :--- |
| **`members`** | `member_id` | *None* | Tracks library cardholder accounts and status. |
| **`books`** | `book_id` | *None* | Main catalog containing book metadata and total copies. |
| **`loans`** | `loan_id` | `book_id`, `member_id` | Transaction logs recording every checkout. |
| **`penalties`**| `penalty_id` | `loan_id` | Financial ledger tracking unpaid late fees. |

### Repository Structure
* `/schema.sql`: Contains the Data Definition Language (DDL) scripts used to build the operational environment.
* `/data_population.sql`: Mock dataset scripts reflecting complex transaction scenarios (late returns, unreturned assets, active debts).
* `/analysis_queries.sql`: Practical analytical queries used to extract operational insights.

---

## Key Insights Uncovered

### 1. Inventory Asset Utilization
**Business Question:** *What percentage of total asset inventory is actively checked out right now per genre?*
* **SQL Concept:** `LEFT JOIN`, Conditional Aggregation (`CASE WHEN`), Arithmetic Operators, `ROUND()`.
* **Insight:** Identified that the library's **Fiction** genre carries the highest current circulation stress, operating at a **16.67% utilization rate**, closely followed by **Technology** at **11.11%**.

### 2. Risk Mitigation & Revenue Leakage
**Business Question:** *Which members have active outstanding debts from late returns?*
* **SQL Concept:** Multi-table chaining (`INNER JOIN` across 3 entities), Financial Aggregation (`SUM`), Condition Filtering.
* **Insight:** Discovered significant revenue leakage with \$170.00 in outstanding unpaid fines. Flagged two specific high-risk profiles: User *Ananya Iyer* (\$100.00 overdue debt) and *Priya Sharma* (\$70.00 overdue debt).

### 3. Foot Traffic & Staff Optimisation
**Business Question:** *Which months represent peak volume for checkouts to inform staffing schedules?*
* **SQL Concept:** Date parsing functions (`MONTHNAME`), Transactional Counting (`COUNT`).
* **Insight:** Identified clear seasonality peaks during **January, March, and April** (each generating maximum transactional volume), indicating optimal times to scale up student help desk staffing.

---

## Technical Stack & Competencies Shown
* **SQL Dialect:** MySQL / PostgreSQL / Standard ANSI SQL
* **Relational Concepts:** Entity Relationship Integrity, Cascading Actions (`ON DELETE CASCADE`), Schema Normalisation.
* **Analytical Tools:** Common Table Expressions (CTEs), Subqueries, Aggregate Functions, Pattern Evaluation.

---
*Developed as an end-to-end data portfolio project to showcase technical schema construction and business-minded relational querying.*
