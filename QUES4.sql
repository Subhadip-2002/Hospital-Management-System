--QUES4
--List the patient who visited as well as admitted in Cardiology dept in the year 2022


/* those tables are required 
visit table
admission table
doctor
dept table*/


--Method 1
select  v.VisitDate ,dp.name as [Dept Name],
a.AdmissionDate ,
p.FirstName+' '+p.LastName as [Patient Name],
p.PatientID
from visit v
inner join Admission a
on v.PatientId=a.PatientId
inner join doctor d
on v.DoctorID=d.DoctorID
inner join Department dp
on d.DepartmentID=dp.DepartmentID
inner join Patient p
on v.PatientId=p.PatientID
where dp.name='Cardiology'
AND
Year(AdmissionDate)=2022
AND 
Year(VisitDate)=2022;

--Method2
select v.PatientId,dp.Name
from Visit v
inner join doctor d
on v.DoctorID=d.DoctorID
inner join Department dp
on d.DepartmentID=dp.DepartmentID
where Year(VisitDate)=2022
and  dp.name='Cardiology'
intersect
select a.PatientId,dp.Name
from Admission a
inner join doctor d
on a.DoctorID=d.DoctorID
inner join Department dp
on d.DepartmentID=dp.DepartmentID
where Year(AdmissionDate)=2022
and  dp.name='Cardiology';


