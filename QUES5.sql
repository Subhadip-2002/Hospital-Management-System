--QUESNO 5
--LIST YEARWISE AND DEPARTMENTWISE VISITED PATIENTS

select year(VisitDate) as year,dp.Name as departmentname,
count(v.VisitId) as patient
from visit v
inner join Doctor  d
on v.DoctorID=d.DoctorID
inner join Department dp
on d.DepartmentID=dp.DepartmentID
group by year(VisitDate),dp.Name
order by year
;