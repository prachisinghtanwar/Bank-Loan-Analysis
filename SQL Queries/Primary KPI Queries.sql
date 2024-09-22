                                            /* PRIMARY KPI QUERIES */


SELECT        *
FROM          Bank_loan_data

--TOTAL LOAN APPLICATION
SELECT        COUNT(id) AS 'TOTAL LOAN APPLICATION'
FROM          Bank_loan_data

--MONTH-TO-DATE TOTAL LOAN APPLICATION(MTD TOTAL LOAN APPLICATION)
SELECT        COUNT(id) AS 'MTD TOTAL LOAN APPLICATION'
FROM          Bank_loan_data
WHERE         MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

--PREVIOUS-MONTH-TO-DATE TOTAL LOAN APPLICATION(PMTD TOTAL LOAN APPLICATION)
SELECT        COUNT(id) AS 'PMTD TOTAL LOAN APPLICATION'
FROM          Bank_loan_data
WHERE         MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

--TOTAL FUNDED AMOUNT
SELECT        SUM(loan_amount) AS 'TOTAL FUNDED AMOUNT'
FROM          Bank_loan_data

--MONTH-TO-DATE TOTAL FUNDED AMOUNT
SELECT        SUM(loan_amount) AS 'MTD TOTAL FUNDED AMOUNT'
FROM          Bank_loan_data
WHERE         MONTH(issue_date) = 12

--PREVIOUS-MONTH-TO-DATE TOTAL FUNDED AMOUNT
SELECT        SUM(loan_amount) AS 'PMTD TOTAL FUNDED AMOUNT'
FROM          Bank_loan_data
WHERE         MONTH(issue_date) = 11

--TOTAL AMOUNT RECEIVED
SELECT        SUM(total_payment) AS 'TOTAL AMOUNT RECEIVED'
FROM          Bank_loan_data   

--MTD TOTAL AMOUNT RECEIVED
SELECT        SUM(total_payment) AS 'MTD TOTAL AMOUNT RECEIVED'
FROM          Bank_loan_data   
WHERE         MONTH(issue_date) = 12

--PMTD TOTAL AMOUNT RECEIVED
SELECT        SUM(total_payment) AS 'PMTD TOTAL AMOUNT RECEIVED'
FROM          Bank_loan_data   
WHERE         MONTH(issue_date) = 11

--AVERAGE INTEREST RATE
SELECT        ROUND(AVG(int_rate),4)*100 AS 'AVERAGE INTEREST RATE'
FROM          Bank_loan_data

--MTD AVERAGE INTEREST RATE
SELECT        ROUND(AVG(int_rate),4)*100 AS 'MTD AVERAGE INTEREST RATE'
FROM          Bank_loan_data
WHERE         MONTH(issue_date) = 12

--PMTD AVERAGE INTEREST RATE 
SELECT        ROUND(AVG(int_rate),4)*100 AS 'PMTD AVERAGE INTEREST RATE'
FROM          Bank_loan_data
WHERE         MONTH(issue_date) = 11

--AVERAGE DTI
SELECT        ROUND(AVG(dti),4)*100 AS 'AVERAGE DTI RATIO'
FROM          Bank_loan_data

--MTD AVERAGE DTI
SELECT        ROUND(AVG(dti),4)*100, AS 'MTD AVERAGE DTI RATIO'
FROM          Bank_loan_data
WHERE         MONTH(issue_date) = 12

--PMTD AVERAGE DTI
SELECT        ROUND(AVG(dti),4)*100 AS 'PMTD AVERAGE DTI RATIO'
FROM          Bank_loan_data
WHERE         MONTH(issue_date) = 11