create table Groups(
	ID int PRIMARY KEY IDENTITY,
	name nvarchar(10) NOT NULL
)

create table Teachers(
	ID int PRIMARY KEY IDENTITY, 
	name nvarchar(15) NOT NULL,
	surname nvarchar(20) NOT NULL,
	patronymic nvarchar(20)
)

create table Subjects(
	ID int PRIMARY KEY IDENTITY, 
	name nvarchar(50) NOT NULL,
	SubjectType int
)

create table Students(
	ID int PRIMARY KEY IDENTITY, 
	name nvarchar(15) NOT NULL,
	surname nvarchar(20) NOT NULL,
	patronymic nvarchar(15)
)

create table SubjectInstances(
	ID int PRIMARY KEY IDENTITY, 
	teachersID integer not null foreign key references Teachers(ID),
	subjectsID integer not null foreign key references Subjects(ID)
)

create table Works(
	ID int PRIMARY KEY IDENTITY,
	subjectInstanceID integer not null foreign key references SubjectInstances(ID),
	maxPoint int,
	workType nvarchar(20),
	workdate date,
	theme nvarchar(50)
)

create table Marks(
	ID int PRIMARY KEY IDENTITY,
	studentId integer not null foreign key references Students(ID),
	workId integer not null foreign key references Works(ID),
	point int
)


create table StudentsGroup(
	ID int PRIMARY KEY IDENTITY,
	studentID integer not null foreign key references Students(ID),
	groupId integer not null foreign key references Groups(ID)
)

create table GroupSubjectInstance(
	ID int PRIMARY KEY IDENTITY,
	subjectInstanceID integer not null foreign key references SubjectInstances(ID),
	groupID integer not null foreign key references Groups(ID)
)