-- =====================================================
-- Bank of Badami - Data Exploration
-- =====================================================

-- Step 1: Check the number of records in each table

%sql
USE CATALOG workspace;
USE SCHEMA bank_of_badami;

SELECT 'accounts' AS table_name, COUNT(*) AS record_count FROM accounts
UNION ALL
SELECT 'branches', COUNT(*) FROM branches
UNION ALL
SELECT 'card_transactions', COUNT(*) FROM card_transactions
UNION ALL
SELECT 'cards', COUNT(*) FROM cards
UNION ALL
SELECT 'customers', COUNT(*) FROM customers
UNION ALL
SELECT 'employees', COUNT(*) FROM employees
UNION ALL
SELECT 'loan_payments', COUNT(*) FROM loan_payments
UNION ALL
SELECT 'loans', COUNT(*) FROM loans
UNION ALL
SELECT 'support_tickets', COUNT(*) FROM support_tickets
UNION ALL
SELECT 'transactions', COUNT(*) FROM transactions;


