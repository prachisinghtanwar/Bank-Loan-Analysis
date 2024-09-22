                                          /* BANK LOAN GRID QUERIES */


--MONTHLY TRENDS BY ISSUE DATE
SELECT        MONTH(issue_date) AS 'Month Number',
              DATENAME(MONTH,issue_date) AS 'Month Name',
              COUNT(id) AS 'Total Loan Applications',
			  SUM(loan_amount) AS 'Total funded amount',
			  SUM(total_payment) AS 'Total amount received'
FROM          Bank_loan_data
GROUP BY      MONTH(issue_date),DATENAME(MONTH,issue_date)
ORDER BY      MONTH(issue_date)

--REGIONAL ANALYSIS BY STATE
SELECT        address_state,
              COUNT(id) AS 'Total Loan Applications',
			  SUM(loan_amount) AS 'Total funded amount',
			  SUM(total_payment) AS 'Total amount received'
FROM          Bank_loan_data
GROUP BY      address_state
ORDER BY      address_state

--LOAN TERM ANALYSIS
SELECT        term,
              COUNT(id) AS 'Total Loan Applications',
			  SUM(loan_amount) AS 'Total funded amount',
			  SUM(total_payment) AS 'Total amount received'
FROM          Bank_loan_data
GROUP BY      term
ORDER BY      term

--EMPLOYEE LENGTH ANALYSIS
SELECT        emp_length,
              COUNT(id) AS 'Total Loan Applications',
			  SUM(loan_amount) AS 'Total funded amount',
			  SUM(total_payment) AS 'Total amount received'
FROM          Bank_loan_data
GROUP BY      emp_length
ORDER BY      emp_length

--LOAN PURPOSE BREAKDOWN
SELECT        purpose,
              COUNT(id) AS 'Total Loan Applications',
			  SUM(loan_amount) AS 'Total funded amount',
			  SUM(total_payment) AS 'Total amount received'
FROM          Bank_loan_data
GROUP BY      purpose
ORDER BY      COUNT(id) DESC

--HOME OWNERSHIP ANALYSIS
SELECT        home_ownership,
              COUNT(id) AS 'Total Loan Applications',
			  SUM(loan_amount) AS 'Total funded amount',
			  SUM(total_payment) AS 'Total amount received'
FROM          Bank_loan_data
GROUP BY      home_ownership
ORDER BY      home_ownership

--HOME OWNERSHIP ANALYSIS WITH GRADE 'A' AND STATE = CA
SELECT        home_ownership,
              COUNT(id) AS 'Total Loan Applications',
			  SUM(loan_amount) AS 'Total funded amount',
			  SUM(total_payment) AS 'Total amount received'
FROM          Bank_loan_data
WHERE         grade = 'A' AND address_state = 'CA'
GROUP BY      home_ownership
ORDER BY      home_ownership
