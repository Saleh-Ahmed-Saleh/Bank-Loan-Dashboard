select * from bank_loan_data

--The Total Numbers Of Loan Applications
SELECT COUNT(ID) as LoanApplicationsNumbers FROM bank_loan_data

--MTD (Month To Date) Loan Applications 
SELECT COUNT(ID) as MTD_Total_Applications  FROM bank_loan_data
Where MONTH(issue_date) =12 AND YEAR(issue_date)=2021


-- (PMTD) Previous month to date Loan Applications
Select COUNT(id) as PMTD_Total_Applications 
from bank_loan_data
Where MONTH(issue_date)=11 AND YEAR(issue_date)=2021

--MTD Total Funded Amount
Select Sum(loan_amount) as MTD_Total_Funded_Amount from bank_loan_data
Where MONTH(issue_date)=12 AND YEAR(issue_date)=2021

--PMTD Total Funded Amount
Select Sum(loan_amount) as MTD_Total_Funded_Amount from bank_loan_data
Where MONTH(issue_date)=11 AND YEAR(issue_date)=2021


--Total_Amount_Received
Select Sum(total_payment) as Total_Amount_Received from bank_loan_data

-- MTD Total_Amount_Received
Select Sum(total_payment) as MTD_Total_Amount_Received from bank_loan_data 
Where MONTH(issue_date)=12 AND YEAR(issue_date)=2021


-- PMTD Total_Amount_Received
Select Sum(total_payment) as MTD_Total_Amount_Received from bank_loan_data 
Where MONTH(issue_date)=11 AND YEAR(issue_date)=2021

--AVG Interest Rate 
select ROUND(AVG(int_rate) * 100 ,0)  as AVG_Interest_Rate from bank_loan_data 

--MTD --AVG Interest Rate 
Select Round(AVG(int_rate) * 100, 2) as MTD_AVG_Interest_Rate from bank_loan_data 
Where MONTH(issue_date)=12 AND YEAR(issue_date)=2021

--PMTD --AVG Interest Rate 
Select Round(AVG(int_rate) * 100, 4) as MTD_AVG_Interest_Rate from bank_loan_data 
Where MONTH(issue_date)=11 AND YEAR(issue_date)=2021


--AVG Debt-to_income Ratio (DTI)
Select Round(AVG(dti) * 100,2 ) as AVG_dti from bank_loan_data 

Select 
