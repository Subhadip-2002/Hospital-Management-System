--ques2
--patient visited at hospital 

select A.AdmissionDate,A.IPDNumber ,
pc.name as patient_category,p.FirstName+' '+p.LastName as [patient name],
d.FirstName+' '+d.LastName as [doctor name],
ds.dischargeDate
from Admission A
inner join PatientCategory pc
on A.PatientCategoryID=pc.PatientCategoryID
inner join patient p
on A.PatientID=p.PatientID
inner join Doctor d
on A.DoctorID=d.DoctorID
inner join Discharge ds
on A.AdmissionId=ds.AdmissionId
select top 10 * from Admission;
