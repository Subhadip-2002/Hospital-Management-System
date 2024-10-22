--QUES3
--NUMBER OF PATIENT VISITED TO MEDICINE DEPT AT OCT 2022

/*VISIT
MEDICINE DEPT--filter
VISIT DATE=JUNE 2022*/

select 

--v.* ,d.FirstName as [Doctor's first name],dp.name as [Dept name],
--Year(VisitDate) as year,Month(VisitDate) as Month

count(v.VisitId) as [Patient Count]
from visit v
inner join Doctor d
on v.DoctorID=d.DoctorID
inner join Department dp
on d.DepartmentID=dp.DepartmentID
where
dp.name='Medicine'
AND
Year(VisitDate)=2022
AND
Month(VisitDate)=10;
