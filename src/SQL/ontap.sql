CREATE DATABASE OnTap;
GO
USE OnTap;
GO



CREATE TABLE Students
(
StudentID INT PRIMARY KEY  ,
StudentName NVARCHAR(50) NULL,
Age INT NULL,
Email VARCHAR(100) NULL,
) ;

CREATE TABLE Classes
(
    ClassID INT PRIMARY KEY  ,
    ClassName NVARCHAR(50)
);

CREATE TABLE ClassStudent
(
    ClassID INT PRIMARY KEY  ,
    StudentID INT FOREIGN KEY REFERENCES Students(StudentID)
);

CREATE TABLE Subjects
(
   SubjectID INT PRIMARY KEY  ,
   SubjectName NVARCHAR(50)
)

CREATE TABLE Marks
(
    Mark INT  ,
    SubjectID INT FOREIGN KEY REFERENCES Subjects(SubjectID),
    StudentID INT FOREIGN KEY REFERENCES Students(StudentID)
)
INSERT into Marks VALUES
(8,1,1),
(4,2,1),
(9,1,1),
(7,1,3),
(3,1,4),
(5,2,5),
(8,3,3),
(1,3,5),
(3,2,4)
set IDENTITY_INSERT Marks ON

select * FROM Marks
SELECT * FROM Students
SELECT * FROM ClassStudent
SELECT * FROM Subjects
SELECT * FROM Classes

INSERT into Students(StudentID,StudentName,Age,Email) VALUES
(1,'Nguyen Quang An', 18 , 'an@yahoo.com'),
(2,'Nguyen Cong Vinh',20,'vinh@gmail.com'),
(3,'Nguyen Van Quyen',19,'quyen'),
(4,'Pham Thanh Binh',25,'binh@gmail.com'),
(5,'Nguyen Van Tai Em',30,'taiem@sport.vn')


INSERT into Classes(ClassID,ClassName) VALUES
(1,'C0706L'),
(2,'C0708G')

INSERT into ClassStudent(ClassID,StudentID) VALUES
(1,1),
(2,1),
(3,2),
(4,2),
(5,2);

insert into Subjects(SubjectID,SubjectName) VALUES
(1,'SQL'),
(2,'Java'),
(3,'C'),
(4,'Visual Basic')

--------------------------- Truy Vấn --------------------

-- 1.Hien thi danh sach tat ca cac hoc vien

SELECT * FROM Students

-- 2.Hien thi danh sach tat ca cac mon hoc

SELECT * FROM Subjects

-- 3.Tinh diem trung binh

SELECT AVG(Mark) FROM Marks

-- 4.Hien thi mon hoc nao co hoc sinh thi duoc diem cao nhat

SELECT Students.StudentID AS 'ID hs' , StudentName as 'Tên hs',MAX(Mark) as'Điểm hs' FROM Students JOIN Marks
                        ON Students.StudentID = Marks.StudentID
GROUP BY Students.StudentID , StudentName
HAVING MAX(Mark)>= all(select MAX(Mark) FROM Marks)

-- 5.Danh so thu tu cua diem theo chieu giam

SELECT Mark as 'Điểm' , StudentName as 'Tên hs' FROM Marks JOIN Students ON Marks.StudentID=Students.StudentID
ORDER BY Mark DESC

-- 6.Thay doi kieu du lieu cua cot SubjectName trong bang Subjects thanh nvarchar(max)

ALTER TABLE Subjects
ALTER COLUMN SubjectName nvarchar(max)

-- 7.Cap nhat them dong chu « Day la mon hoc «  vao truoc cac ban ghi tren cot SubjectName trong bang Subjects

SELECT * FROM Subjects


-- 8.Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu cau Age >15 va Age < 50

ALTER TABLE Students
Add CONSTRAINT Age  CHECK (Age >15 and Age <50)

-- 9.Loai bo tat ca quan he giua cac bang

-- 10.Xoa hoc vien co StudentID la 1

DELETE from ClassStudent
WHERE StudentID = 1
DELETE from Students
WHERE StudentID=1

-- 11.Trong bang Student them mot column Status co kieu du lieu la Bit va co gia tri Default la 1

ALTER TABLE Students
ADD STATUS BIT DEFAULT 1

-- 12.Cap nhap gia tri Status trong bang Student thanh 0

UPDATE Students SET Status = 0


