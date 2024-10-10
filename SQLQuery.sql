select * from [Bank Loan DB]..bank_loan_data

--The Total Numbers Of Loan Applications
SELECT COUNT(ID) as LoanApplicationsNumbers FROM [Bank Loan DB]..bank_loan_data

--MTD (Month To Date) Loan Applications 
SELECT COUNT(ID) as MTD_Total_Applications  FROM [Bank Loan DB]..bank_loan_data
Where MONTH(issue_date) =12 AND YEAR(issue_date)=2021


-- (PMTD) Previous month to date Loan Applications
Select COUNT(id) as PMTD_Total_Applications 
from [Bank Loan DB]..bank_loan_data
Where MONTH(issue_date)=11 AND YEAR(issue_date)=2021

--MTD Total Funded Amount
Select Sum(loan_amount) as MTD_Total_Funded_Amount from [Bank Loan DB]..bank_loan_data
Where MONTH(issue_date)=12 AND YEAR(issue_date)=2021

--PMTD Total Funded Amount
Select Sum(loan_amount) as MTD_Total_Funded_Amount from [Bank Loan DB]..bank_loan_data
Where MONTH(issue_date)=11 AND YEAR(issue_date)=2021


--Total_Amount_Received
Select Sum(total_payment) as Total_Amount_Received from [Bank Loan DB]..bank_loan_data

-- MTD Total_Amount_Received
Select Sum(total_payment) as MTD_Total_Amount_Received from [Bank Loan DB]..bank_loan_data 
Where MONTH(issue_date)=12 AND YEAR(issue_date)=2021


-- PMTD Total_Amount_Received
Select Sum(total_payment) as MTD_Total_Amount_Received from [Bank Loan DB]..bank_loan_data 
Where MONTH(issue_date)=11 AND YEAR(issue_date)=2021

--AVG Interest Rate 
select ROUND(AVG(int_rate) * 100 ,0)  as AVG_Interest_Rate from [Bank Loan DB]..bank_loan_data 

--MTD --AVG Interest Rate 
Select Round(AVG(int_rate) * 100, 2) as MTD_AVG_Interest_Rate from [Bank Loan DB]..bank_loan_data 
Where MONTH(issue_date)=12 AND YEAR(issue_date)=2021

--PMTD --AVG Interest Rate 
Select Round(AVG(int_rate) * 100, 4) as MTD_AVG_Interest_Rate from [Bank Loan DB]..bank_loan_data 
Where MONTH(issue_date)=11 AND YEAR(issue_date)=2021


--AVG Debt-to_income Ratio (DTI)
Select Round(AVG(dti) * 100,2 ) as AVG_dti from [Bank Loan DB]..bank_loan_data 



--AVG MTD Debt-to_income Ratio (DTI)
Select Round(AVG(dti) * 100, 2) as AVG_MTD_dti from [Bank Loan DB]..bank_loan_data
Where MONTH(issue_date) = 12 AND YEAR(issue_date)= 2021
  
  --AVG PMTD Debt-to_income Ratio (DTI)
Select Round(AVG(dti) * 100, 2) as AVG_PMTD_dti from [Bank Loan DB]..bank_loan_data
Where MONTH(issue_date) = 11 AND YEAR(issue_date)= 2021


--Good Loan Application Percentage
select (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END)* 100 )
/
Count(id) as GoodLoanApplicationPercentage
from [Bank Loan DB]..bank_loan_data


--Good Loan Applications
select Count(case when loan_status= 'fully paid' or loan_status = 'current' then id END) TotalGoodLoanApplications
from [Bank Loan DB]..bank_loan_data

--Good Loan Funded Amount
Select SUM(loan_amount) as GoodLoanFundedAmount 
From [Bank Loan DB]..bank_loan_data
Where loan_status = 'Fully Paid' OR loan_status = 'Current'


--Good Loan Total Received Amount
select sum(total_payment) as GoodLoanTotalReceivedAmount 
From [Bank Loan DB]..bank_loan_data
Where loan_status = 'Fully Paid' OR loan_status = 'Current'


--Bad Application Percentage
select (COUNT(CASE WHEN loan_status = 'charged off' THEN id END)* 100 )
/
Count(id) as BadLoanApplicationPercentage
from [Bank Loan DB]..bank_loan_data


--Bad Loan Applications
select Count(case when loan_status = 'charged off' then id END) TotalBadLoanApplications
from [Bank Loan DB]..bank_loan_data

--BAD Loan Funded Amount
Select SUM(loan_amount) as GoodLoanFundedAmount 
From [Bank Loan DB]..bank_loan_data
Where loan_status = 'charged off' 


--Good Loan Total Received Amount
select sum(total_payment) as GoodLoanTotalReceivedAmount 
From [Bank Loan DB]..bank_loan_data
Where loan_status = 'charged off' 



--Loan Status Grid
SELECT loan_status as LoanStatus 
, Count(id) as TotalLoanApplications,
Sum(loan_amount) as TotalFundedAmount, 
Sum(total_payment) as TotalAmountReceived
From [Bank Loan DB]..bank_loan_data
Group by loan_status

--MTD Loan Status Grid
SELECT loan_status as LoanStatus 
, Count(id) as TotalLoanApplications,
Sum(loan_amount) as TotalFundedAmount, 
Sum(total_payment) as TotalAmountReceived
From [Bank Loan DB]..bank_loan_data
Where Month(issue_date) =12 
Group by loan_status

--PMTD Loan Status Grid
SELECT loan_status as LoanStatus 
, Count(id) as TotalLoanApplications,
Sum(loan_amount) as TotalFundedAmount, 
Sum(total_payment) as TotalAmountReceived
From [Bank Loan DB]..bank_loan_data
Where Month(issue_date) =11
Group by loan_status