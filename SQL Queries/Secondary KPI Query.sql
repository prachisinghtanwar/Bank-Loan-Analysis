                                     /* SECONDARY KPI QUERIES */


--GOOD LOAN PERCENTAGE
SELECT          (COUNT(CASE WHEN loan_status = 'Fully paid' OR loan_status = 'Current' THEN id END)*100)
                /
				COUNT(id) 
				AS 'GOOD LOAN PERCENTAGE'
FROM            Bank_loan_data

--BAD LOAN PERCENTAGE
SELECT          (COUNT(CASE WHEN loan_status = 'Charged off' THEN id END)*100)
                /
				COUNT(id) 
				AS 'BAD LOAN PERCENTAGE'
FROM            Bank_loan_data

--GOOD LOAN APPLICATION
SELECT          COUNT(CASE WHEN loan_status = 'Fully paid'
                      OR loan_status = 'Current' THEN id END)
					  AS 'GOOD LOAN APPLICATION'
FROM            Bank_loan_data

--BAD LOAN APPLICATION
SELECT          COUNT(CASE WHEN loan_status = 'Charged off' THEN id END)
					  AS 'BAD LOAN APPLICATION'
FROM            Bank_loan_data

--GOOD LOAN FUNDED AMOUNT
SELECT          SUM(loan_amount) AS 'GOOD LOAN FUNDED AMOUNT'
FROM            Bank_loan_data
WHERE           loan_status = 'Fully paid' OR loan_status = 'Current'


--BAD LOAN FUNDED AMOUNT
SELECT          SUM(loan_amount) AS 'BAD LOAN FUNDED AMOUNT'
FROM            Bank_loan_data
WHERE           loan_status = 'Charged off'

--GOOD LOAN TOTAL RECEIVED AMOUNT
SELECT          SUM(total_payment) AS 'GOOD LOAN FUNDED AMOUNT'
FROM            Bank_loan_data
WHERE           loan_status = 'Fully paid' OR loan_status = 'Current'

--BAD LOAN TOTAL RECEIVED AMOUNT
SELECT          SUM(total_payment) AS 'BAD LOAN FUNDED AMOUNT'
FROM            Bank_loan_data
WHERE           loan_status = 'Charged off'


--LOAN STATUS GRID
SELECT          loan_status,
                COUNT(id) AS 'Total Loan Applications',
				SUM(loan_amount) AS 'Total funded amount',
				SUM(total_payment) AS 'Total amount received',
				AVG(int_rate*100) AS 'Average interest rate',
				AVG(dti*100) AS 'Average dti'
FROM            Bank_loan_data
GROUP BY        loan_status

-- MTD LOAN STATUS GRID
SELECT          loan_status,
                COUNT(id) AS 'MTD Total Loan Applications',
				SUM(loan_amount) AS 'MTD Total funded amount',
				SUM(total_payment) AS 'MTD Total amount received'
FROM            Bank_loan_data
WHERE           MONTH(issue_date) = 12
GROUP BY        loan_status

-- PMTD LOAN STATUS GRID
SELECT          loan_status,
                COUNT(id) AS 'MTD Total Loan Applications',
				SUM(loan_amount) AS 'MTD Total funded amount',
				SUM(total_payment) AS 'MTD Total amount received'
FROM            Bank_loan_data
WHERE           MONTH(issue_date) = 11
GROUP BY        loan_status