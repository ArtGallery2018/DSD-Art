--Student Bob Dust
--Project 4 SAMPLE
--Problem 11
Select FirstName, MiddleInitial, LastName, Title, BaseSalary, HireDate, DateOfBirth
From Employee 
Order by LastName;

--Problem 12
Select FirstName, MiddleInitial, LastName, Title, BaseSalary, HireDate, DateOfBirth
From Employee
Where HireDate < '2009-01-01'
Order By LastName;

--Problem 13
Select FirstName, MiddleInitial, LastName, Title, BaseSalary, E.DepartmentCode, Department
From Employee E
	Left Join Department D on E.DepartmentCode = D.DepartmentCode
Order by Department, LastName;

--Problem 14
Select D.DepartmentCode, Department, FirstName + ' ' + IsNull(MiddleInitial + ' ', '') + LastName as Manager, Title
From Department D 
	Left Join Employee E on D.ManagerNumber = E.EmployeeNumber
Order by Department;

--Problem 15
Select D.DepartmentCode, Department, E1.FirstName + ' ' + E1.LastName as Manager, E1.Title, E2.FirstName + ' ' + E2.LastName as Employee, E2.Title
From Department D 
	Left Join Employee E1 on D.ManagerNumber = E1.EmployeeNumber
	Left Join Employee E2 on D.DepartmentCode = E2.DepartmentCode
Order by Department, E2.LastName;

--Problem 16
Select D.DepartmentCode, Department, Count(*) as NumberOfEmployees, SUM(BaseSalary) as TotalSalary, AVG(BaseSalary) as AverageSalary
From Department D
	Left Join Employee E on D.DepartmentCode = E.DepartmentCode
Group By D.DepartmentCode, Department
Order by 4 Desc;

--Problem 17
select FirstName, LastName, HireDate, DateOfBirth, datediff("M",DateOfBirth,GetDate())/12 as AgeInYears
from employee
Order by 5 desc;

--Problem 18
Select count(*) as EmployeesWithDependents
From Employee
Where EmployeeNumber in (Select EmployeeNumber from Dependent);

--Problem 19
Select Job, sum(BaseSalary * 12) as TotalAnnualSalary
From Job
	inner join Employee on Job.JobClass = Employee.JobClass
Group By Job
Order by 2 Desc;

--Problem 20
Select Training.TrainingID, Description as Training, StartDate, count(EmployeeNumber) as Enrollment
From Training
	Left Join EmployeeTraining ET on Training.TrainingID = ET.TrainingID
Group By Training.TrainingID, Description, StartDate
Order By 4, Training;