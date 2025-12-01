**normalization with that tables**



studentname age address phone class teachername teacherexperiance teachersalary coursename fees duration





STUDENT Table

studentid(PK) studentname age address phone teacherid(FK)



TEACHER TABLE

teacherid(PK) teachername teacherexperiance teachersalary courseid(FK)



COURSE TABLE

courseid(PK) coursename fees duration





empid empname salary dob experience managername departmentname houserent(10%)



Employee Table

empid(PK) empname salary dob experience  managerid(FK)



Manager Table

managerid(PK) managername departmentid(FK)



Department table

Departmentid(PK) departmentname



houserent(10%) we can calculate from salary



