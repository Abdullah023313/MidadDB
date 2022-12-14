Create Table   Users (
	 UserId     int  Primary  Key,
	 Username   nvarchar (256) NOT NULL,
	 Email      nvarchar (256) NOT NULL,
	 PasswordHash   nvarchar (max) NOT NULL,
	 PhoneNumber   nvarchar (max) NULL
)


Create Table   Roles (
	 RoleId  int  Primary  Key,
	 Name    nvarchar (max) NOT NULL
)

	 Create Table   UserRoles (
	 UserRoleId   int  NOT NULL,
	 RoleId  int  NOT NULL,
	 UserId  int  NOT NULL,
	Foreign Key(RoleId) References   Roles  (RoleId),
	Foreign Key(UserId) References   Users  (UserId)
)

Create Table   Students (
	 StudentId  int   Primary  Key,
	 UserId     int  NOT NULL,
	 FirstName  nvarchar (max) NOT NULL,
	 LastName   nvarchar (max) NOT NULL,
	Foreign Key(UserId) References   Users  (UserId)
)


Create Table   Teachers (
	TeacherId   int  Primary  Key,
	UserId      int  NOT NULL, 
	FirstName   int  NOT NULL, 
	LastName   int  NOT NULL,
	Foreign Key(UserId) References   Users  (UserId)
)	
	
Create Table   Universities (
	UniversityId  int  Primary  Key,
	Name   nvarchar (max) NOT NULL

)

	

Create Table   Colleges (
	 collegeId  int  Primary  Key ,
	 UniversityId  int  NOT NULL,
	 Name   nvarchar (250) NOT NULL,
	 StudYears   int  NOT NULL,
	Foreign Key(UniversityId) References   Universities  (UniversityId)
)


Create Table   CollegeStudents (
	 collegestudentId   int  Primary  Key,
	 collegeId  int  NOT NULL,
	 StudentId  int  NOT NULL,
	Foreign Key( collegeId) References   Colleges  ( collegeId),
	Foreign Key(StudentId) References   Students  (StudentId)
)


Create Table   Courses (
	 CourseId   int  Primary  Key,
	 TeacherId   int  NOT NULL,
	 Name   nvarchar (max) NOT NULL,
	 StartDate   datetime  NULL,
	 EndDate   datetime  NULL,
	Foreign Key( TeacherId) References   Teachers  ( TeacherId)
)

Create Table   Sessions (
	 SessionId   int  Primary  Key,
	 CourseId   int  NOT NULL,
	 Topic   nvarchar (max) NOT NULL,
	 Assignment   nvarchar (max) NOT NULL,
	 DeliveryendTime   datetime  NOT NULL,
	 Grade   float  NOT NULL,
	Foreign Key( CourseId) References   Courses  ( CourseId)
)

	 
Create Table   Attendees (
	 AttendeesId int  Primary  Key,
	 SessionId   int  NOT NULL,
	 StudentId   int  NOT NULL,
	 TimeAttendance   time (7) NOT NULL,
	Foreign Key( SessionId) References   Sessions  ( SessionId),
	Foreign Key(StudentId) References   Students  (StudentId)
)

Create Table   Assignments (
	 AssignmentId   int  Primary  Key ,
	 StudentId  int  NOT NULL,
	 SessionId   int  NOT NULL,
	 text   ntext  NULL,
	 Grade   float  NULL,
	 SubmissionStatus   nvarchar (50) NOT NULL,
	 LastModified   datetime  NULL,
	 FeedbackComments   nvarchar (max) NULL,
	Foreign Key( SessionId) References   Sessions  ( SessionId),
	Foreign Key(StudentId) References   Students  (StudentId)
)



Create Table   AssignmentFiles (
	 AssignmentFileId   int Primary  Key ,
	 AssignmentId   int  NOT NULL,
	 Url   nvarchar (max) NOT NULL,
	 Name   nvarchar (max) NOT NULL,
	Foreign Key( AssignmentFileId) References   Assignments  ( AssignmentId)
)

Create Table   Companies (
	 CompanyId  int  Primary  Key,
	 Name       nvarchar (250) NOT NULL,
	 Email      nvarchar (250) NULL
)


	 
Create Table   employees (
	 employeeId   int  Primary  Key,
	 StudentId  int  NOT NULL,
	 CompanyId  int  NOT NULL,
	Foreign Key(CompanyId) References   Companies  (CompanyId),
    Foreign Key(StudentId) References   Students  (StudentId)
)


Create Table   EmploymentAd (
	AdId  int  Primary  Key,
	 CompanyId  int  NOT NULL,
	 Date   datetime  NOT NULL,
	Foreign Key(CompanyId) References   Companies  (CompanyId)
)

Create Table   Exams (
	 ExamId     int  Primary  Key,
	 StudentId  int  NOT NULL,
	 CourseId   int  NOT NULL,
	 Date   datetime  NOT NULL
	Foreign Key( CourseId) References   Courses  ( CourseId),
	Foreign Key(StudentId) References   Students  (StudentId), 
)


Create Table   JobTitle (
	 JobTitleId   int  Primary  Key,
	 Name   nvarchar (max) NOT NULL
)

	 
Create Table   Years (
	 YearId  int  Primary  Key,
	 year    date  NOT NULL
)
	 
Create Table   Months (
	 MonthId   int  Primary  Key,
	 YearId    int  NOT NULL,
	 Month     int  NOT NULL,
	Foreign Key( YearId) References   Years  ( YearId)
)

Create Table   JobRank (
	 JobRankId   int  Primary  Key,
	 JobTitleId   int  NOT NULL,
	 employeeId   int  NOT NULL,
	 CompanyId  int  NULL,
	 Start   int  NOT NULL,
	 [end]   int  NOT NULL,
	 Salary   money  NULL,
   	Foreign Key(CompanyId) References   Companies  (CompanyId),
	Foreign Key( employeeId) References   employees  ( employeeId),                                                                                                                                                                                                     
	Foreign Key( JobTitleId) References   JobTitle  ( JobTitleId),                                                                                                                                                                                                       
	Foreign Key( Start) References   Months  ( MonthId),                                                                                                                                                                                                       
	Foreign Key( [end]) References   Months  ( MonthId),
)


Create Table   Posts (
	 PostId   int  Primary  Key,
	UserId  int  NOT NULL,
	 Test   nvarchar (max) NOT NULL,
	 Date   datetime  NULL,
	Foreign Key(UserId) References   Users  (UserId)
)


Create Table   Comments (
	 CommentId   int  Primary  Key,
	 PostId   int  NOT NULL,
	UserId  int  NOT NULL,
	 Text   nvarchar (max) NOT NULL,
	 Date   datetime  NULL,
	 Parent   int  NULL,
    Foreign Key( Parent) References   Comments  ( CommentId),
    Foreign Key( PostId) References   Posts  ( PostId),
    Foreign Key(UserId) References   Users  (UserId)
)


Create Table   Projects (
	 ProjectId   int  Primary  Key,
	StudentId  int  NOT NULL,
	 URL   nvarchar (max) NOT NULL,
	 Description   nvarchar (max) NULL,
	Foreign Key(StudentId) References   Students  (StudentId)
)


Create Table   Languages (
	 LanguageId  int  Primary  Key,
	 Language   nvarchar (max) NOT NULL  
)

Create Table   LanguagesUsed (
	 LanguageUsedId   int  Primary  Key,
	 LanguageId  int  NULL,
	 ProjectId   int  NOT NULL,
	Foreign Key(ProjectId) References   Projects  ( ProjectId),
    Foreign Key(LanguageId)References   Languages  (LanguageId)
)



Create Table   Questions (
	 questionId  int  Primary  Key,
	 ExamId   int  NOT NULL,
	 question   int  NOT NULL,
	 Grade   float  NOT NULL,
	Foreign Key(questionId) References   Exams  ( ExamId),
	
)


Create Table Answers (
	 AnswerId   int  Primary  Key ,
	 questionId  int  NOT NULL,
	 answer   ntext  NOT NULL,
	 IsRight   bit  NOT NULL,
	Foreign Key(questionId)  References   Questions  (questionId)
)

Create Table   Requirements (
	 RequirementsId   int  Primary  Key,
	 LanguageId  int  NULL,
	 AdId  int  NULL,
	Foreign Key(AdId) References   EmploymentAd  (AdId) ,                                                                                               
	Foreign Key(LanguageId) References   Languages  (LanguageId)  )       


