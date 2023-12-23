create database QLBT;
use QLBT;
Create table Department (
    DepartmentID int auto_increment primary key,
    DepartmentName varchar(50) not null
);

 Create table Position (
    PositionID int auto_increment primary key,
    PositionName varchar(50)not null
);

 Create table Account (
    AccountID int auto_increment primary key,
    Email varchar(50),
    Username VARCHAR(20),
    FullName VARCHAR(20),
    DepartmentID int,
    PositionID int,
    CreateDate date,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES Position (PositionID)
);

create table Group1 (
    GroupID int auto_increment primary key,
    GroupName varchar(70) not null,
    CreatorID int,
    CreateDate date,
    FOREIGN KEY (CreatorID) REFERENCES Account (AccountID)
);

CREATE TABLE GroupAccount (
    GroupID INT,
    AccountID INT,
    JoinDate DATE,
    PRIMARY KEY (GroupID, AccountID),
    FOREIGN KEY (GroupID) REFERENCES Group1 (GroupID),
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

CREATE TABLE TypeQuestion (
    TypeID INT AUTO_INCREMENT PRIMARY KEY,
    TypeName VARCHAR(70) NOT NULL
);

CREATE TABLE CategoryQuestion (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName enum('Java', '.NET', 'SQL', 'Postman', 'Ruby') NOT NULL
);
select*from CategoryQuestion;
CREATE TABLE Answer (
    AnswerID INT AUTO_INCREMENT PRIMARY KEY,
    Content TEXT NOT NULL,
    QuestionID INT,
    IsCorrect BOOLEAN NOT NULL,
    FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID)
);

CREATE TABLE Question (
    QuestionID INT AUTO_INCREMENT PRIMARY KEY,
    Content TEXT NOT NULL,
    CategoryID INT,
    TypeID INT,
    CreatorID INT,
    CreateDate DATE,
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY (CreatorID) REFERENCES Account(AccountID)
);
CREATE TABLE Answer (
    AnswerID INT AUTO_INCREMENT PRIMARY KEY,
    Content TEXT NOT NULL,
    QuestionID INT,
    IsCorrect BOOLEAN NOT NULL,
    FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID)
);
CREATE TABLE Exam (
    ExamID INT AUTO_INCREMENT PRIMARY KEY,
    Code VARCHAR(50) NOT NULL,
    Title VARCHAR(100) NOT NULL,
    CategoryID INT,
    Duration INT NOT NULL,
    CreatorID INT,
    CreateDate DATE,
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY (CreatorID) REFERENCES Account(AccountID)
);

CREATE TABLE ExamQuestion (
    ExamID INT,
    QuestionID INT,
    PRIMARY KEY (ExamID, QuestionID),
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);
ALTER TABLE Position CHANGE PositionName Position ENUM('Dev', 'Test','Scrum Master','PM') NOT NULL;
ALTER TABLE TypeQuestion CHANGE TypeName Position ENUM('Essay','Multiple-Choice') NOT NULL;
