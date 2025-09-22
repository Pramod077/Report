use Papollo_Hospital;
select * from PatientData;

1.	Average Length of Stay by Diagnosis
create view Avg_Length_of_Stay_by_Diagnosis as
SELECT Diagnosis, AVG(DATEDIFF(DAY, Admit_Date, Discharge_Date)) AS Avg_Length_Of_Stay
FROM PatientData
GROUP BY Diagnosis ;

select * from Avg_Length_of_Stay_by_Diagnosis;

2. Total Revenue Generated Per Department
Create View Total_Revenue_by_Department as
select Bed_Occupancy as Department, sum(Billing_Amount) as Revenue 
from PatientData
group by Bed_Occupancy;

select * from Revenue_by_Department;

3. Most Common Diagnoses
create view Most_Common_Diagnosis as 
SELECT Diagnosis, COUNT(*) AS Total_Patient_Count
FROM PatientData
GROUP BY Diagnosis;

select * from Most_Common_Diagnosis;

4. Doctor with Highest Average Feedback
create view Doctor_with_Highest_Average_Feedback as 
select Doctor, avg(Feedback) as Avg_feedback
from PatientData
group by Doctor;

select * from Doctor_with_Highest_Average_Feedback
order by Avg_feedback desc;


5. Avg Feedback Scores by Test Types
create view Avg_Feedback_Scores_by_Test_Types as 
select Test, AVG(Feedback) as Avg_feedback_score
from PatientData
group by Test;

select * from Avg_Feedback_Scores_by_Test_Types;

6. Utilization Rate of Bed Types
create view Utilization_Rate_of_Bed_Types as
select Bed_Occupancy AS Department, count(*) as Total_Occupied_Days
from PatientData
group by Bed_Occupancy;

select * from Utilization_Rate_of_Bed_Types
order by Total_Occupied_Days desc;

7. Insurance Coverage by Diagnosis
create view Insurance_Coverage_by_Diagnosis as 
select Diagnosis,AVG(Health_Insurance_Amount) as Insurance_coverage
from PatientData
group by Diagnosis;

select * from Insurance_Coverage_by_Diagnosis
order by Insurance_coverage;

8. Top 3 Most Common Diagnoses
create view Top_3_Common_Diagnoses as
select Top 3 Diagnosis, count(*) as Total_Patients
from PatientData
group by Diagnosis
order by Total_Patients desc;

 select * from Top_3_Common_Diagnoses;

drop view Top_3_Most_Common_Diagnoses;


9. Average Feedback Score per Doctor
create view Average_Feedback_Score_per_Doctor as 
select Doctor, avg(Feedback) as Avg_Feedback
from PatientData
group by Doctor;

select * from Average_Feedback_Score_per_Doctor
order by Avg_Feedback desc;

10. Billing Trends by Diagnosis Type
create view Billing_Trends_by_Diagnosis_Type as
select top 3 Diagnosis, sum(Billing_Amount) as Total_Billing
from PatientData
group by Diagnosis
order by Total_Billing desc;

select * from Billing_Trends_by_Diagnosis_Type;

11. Insurance Contributions to Billing
create view Insurance_Contributions_to_Billing as
select SUM(Health_Insurance_Amount) as Total_Insurance_Contribution, 
sum(Billing_Amount) as Total_Billing
from PatientData;

select * from Insurance_Contributions_to_Billing;

12. ICU vs. General Ward Patient Counts
create view ICU_vs_General_Ward_Patient_Counts as
select Bed_Occupancy, count(*) as total_patients
from PatientData
where Bed_Occupancy in ('ICU','General')
group by Bed_Occupancy;

select * from ICU_vs_General_Ward_Patient_Counts;

13. Common Follow-Up Date Trends
create view Common_FollowUp_Date as 
SELECT top 20 Followup_Date, COUNT(*) AS Followup_Count
FROM PatientData
GROUP BY Followup_Date
ORDER BY Followup_Count DESC;

select * from Common_FollowUp_Date;

14. Average Revenue by Bed Type
create view Avg_Revenue_by_Bed_Type as
select Bed_Occupancy, sum(Billing_Amount) as Revenue_per_bed 
from PatientData
group by Bed_Occupancy;

select * from Avg_Revenue_by_Bed_Type
order by Revenue_per_bed desc;

15. Test Utilization Rates
create view Test_Utilization_Rates as 
select Test, count(*) as Total_Test_Count
from PatientData
group by Test;

select * from Test_Utilization_Rates
order by Total_Test_Count desc;

16. Doctor-Wise Revenue Contribution
create view Doctor_Wise_Revenue_Contribution as
select Doctor, SUM(Billing_Amount) as Doctor_wise_revenue
from PatientData
group by Doctor;

select * from Doctor_Wise_Revenue_Contribution
order by Doctor_wise_revenue desc;

17. Patients with the Highest Bills
create view Patients_with_Highest_Bills as
select top 10 Patient_ID, max(Billing_Amount) as Max_billing
from PatientData
group by Patient_ID;

select * from Patients_with_Highest_Bills
order by Max_billing desc;




