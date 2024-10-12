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


--Total Funded Amount
select sum(loan_amount) as Total_Funded_Amount 
From [Bank Loan DB]..bank_loan_data

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
Select Sum(total_payment) as PMTD_Total_Amount_Received from [Bank Loan DB]..bank_loan_data 
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
SELECT loan_status  
, Count(id) as TotalLoanApplications,
Sum(loan_amount) as TotalFundedAmount, 
Sum(total_payment) as TotalAmountReceived,
Round(AVG(int_rate) * 100, 2) as InterestRatePercentage,
Round(AVG(dti) * 100, 2) as DtiPercentage
From [Bank Loan DB]..bank_loan_data
Group by loan_status

--MTD Loan Status Grid
SELECT loan_status  
, Count(id) as TotalLoanApplications,
Sum(loan_amount) as TotalFundedAmount, 
Sum(total_payment) as TotalAmountReceived,
Round(AVG(int_rate) * 100, 2) as InterestRatePercentage,
Round(AVG(dti) * 100, 2) as DtiPercentage
From [Bank Loan DB]..bank_loan_data
Where Month(issue_date) =12 
Group by loan_status

--PMTD Loan Status Grid
SELECT loan_status  
, Count(id) as TotalLoanApplications,
Sum(loan_amount) as TotalFundedAmount, 
Sum(total_payment) as TotalAmountReceived,
Round(AVG(int_rate) * 100, 2) as InterestRatePercentage,
Round(AVG(dti) * 100, 2) as DtiPercentage
From [Bank Loan DB]..bank_loan_data
Where Month(issue_date) =11
Group by loan_status

--Monthly Trend By Issue Date
Select 
MONTH(issue_date) as MonthNumber,
DATENAME(MONTH,issue_date) as Month,
Count(id) as TotalApplicationsOfLoans,
sum(loan_amount) as TotalLoans ,
sum(total_payment) as TotalPayment
From [Bank Loan DB]..bank_loan_data
Group by DATENAME(MONTH,issue_date) ,MONTH(issue_date)
Order By MonthNumber

--Regional Analysis by state
Select address_state as State,
Count(id) as TotalApplicationsOfLoans,
Sum(loan_amount) as TotalLoans ,
Sum(total_payment) as TotalPayment
From [Bank Loan DB]..bank_loan_data
Group by address_state
Order By sum(loan_amount) desc

--Analysis by Long Term  
Select term as Term,
Count(id) as TotalApplicationsOfLoans,
Sum(loan_amount) as TotalLoans ,
Sum(total_payment) as TotalPayment
From [Bank Loan DB]..bank_loan_data
Group BY Term
Order By TotalApplicationsOfLoans desc


--Analysis by Employee Lenght
Select emp_length as Employee_Lenght,
Count(id) as TotalApplicationsOfLoans,
Sum(loan_amount) as TotalLoans ,
Sum(total_payment) as TotalPayment
From [Bank Loan DB]..bank_loan_data
Group BY emp_length 
Order By  Count(id) DESC

-- Loan Purpose Breakdown Analysis
select purpose as PurposeOfLoan,
Count(id) as TotalApplicationsOfLoans,
Sum(loan_amount) as TotalLoans ,
Sum(total_payment) as TotalPayment
From [Bank Loan DB]..bank_loan_data
Group BY purpose 
Order By Count(id) DESC


-- Home Ownership Analysis
Select home_ownership as HomeOwnership,
Count(id) as TotalApplicationsOfLoans,
Sum(loan_amount) as TotalLoans ,
Sum(total_payment) as TotalPayment
From [Bank Loan DB]..bank_loan_data
Where grade = 'A' AND address_state = 'CA'
Group BY home_ownership
Order By Count(id) DESC