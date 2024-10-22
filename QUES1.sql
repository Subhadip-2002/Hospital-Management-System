--question 1
--patient visited to hospital
select v.VisitId,v.VisitDate,v.OPDNumber,
PC.Name ,
p.FirstName+' '+p.LastName as [patient name],
D.FirstName+' '+D.LastName as [doctor name] , D.Qualification as [doctor's qualification],
u.name as [unit name],
dp.Name as [Department name]
from visit v
inner join  PatientCategory PC
on v.PatientCategoryID=PC.PatientCategoryID
inner join Patient p
on v.PatientId=p.PatientID
inner join doctor D
on v.DoctorID=d.DoctorID
inner join Unit u
on v.UnitId=u.UnitID
inner join Department dp
on D.DepartmentID=dp.DepartmentID;