CREATE TABLE Role (
    RoleID SERIAL PRIMARY KEY,
    Level CHAR(1),
    RoleDescription VARCHAR(50),
    Approves INT
);

CREATE TABLE Department (
    DepartmentID SERIAL PRIMARY KEY,
    DepartmentName VARCHAR(50),
    UserID INT
);

CREATE TABLE Users (
    UserID SERIAL PRIMARY KEY,
    Data JSONB,
    Email VARCHAR(255) UNIQUE,
    HolidayEntitlement INTEGER,
    DepartmentID INT,
    RoleID INTEGER,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID) ON DELETE CASCADE,
    FOREIGN KEY (RoleID) REFERENCES Role(RoleID) ON DELETE CASCADE
);

CREATE TABLE Requests (
    RequestID SERIAL PRIMARY KEY,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    RequestFrom DATE,
    RequestTo DATE,
    Status VARCHAR(20)
);

ALTER TABLE Requests
ADD CONSTRAINT fk_user_requests
FOREIGN KEY (UserID)
REFERENCES Users(UserID)
ON DELETE CASCADE;

INSERT INTO public.role(roleid, level, roledescription, approves) VALUES (1,'A','Manager',10);
INSERT INTO public.role(roleid, level, roledescription, approves) VALUES (2,'B','Supervisor',5);
INSERT INTO public.role(roleid, level, roledescription, approves) VALUES (3,'C','Employee',0);

INSERT INTO public.department(departmentname) VALUES ('Finance');
INSERT INTO public.department(departmentname) VALUES ('Sales');
INSERT INTO public.department(departmentname) VALUES ('Marketing');

INSERT INTO public.users(data, email, holidayentitlement, roleid, departmentid) 
VALUES 
('{"phone number": "938373634", "name": "John Doe"}'::jsonb,'john.doe@example.com',25,1,3),
('{"phone number": "3456789012", "name": "Olivia Martinez"}'::jsonb, 'olivia.martinez@example.com', 30, 3, 1),
('{"phone number": "4567890123", "name": "William Anderson"}'::jsonb, 'william.anderson@example.com', 30, 3, 2),
('{"phone number": "938373634", "name": "Bob Johnson"}'::jsonb,'bob.johnson@example.com',30,2,3),
('{"phone number": "5678901234", "name": "Sophia Taylor"}'::jsonb, 'sophia.taylor@example.com', 30, 3, 3),
('{"phone number": "6789012345", "name": "David Thomas"}'::jsonb, 'david.thomas@example.com', 30, 3, 1),
('{"phone number": "7890123456", "name": "Oliver Garcia"}'::jsonb, 'oliver.garcia@example.com', 30, 3, 2),
('{"phone number": "8901234567", "name": "Evelyn Perez"}'::jsonb, 'evelyn.perez@example.com', 30, 3, 3),
('{"phone number": "0123456789", "name": "Sophia Johnson"}'::jsonb, 'sophia.johnson@example.com', 30, 3, 2),
('{"phone number": "1234567890", "name": "James Davis"}'::jsonb, 'james.davis@example.com', 30, 3, 3),
('{"phone number": "938373634", "name": "Jane Smith"}'::jsonb,'jane.smith@example.com',14,2,2),
('{"phone number": "2345678901", "name": "Ethan Brown"}'::jsonb, 'ethan.brown@example.com', 30, 3, 1),
('{"phone number": "9876543210", "name": "Michael Johnson"}'::jsonb, 'michael.johnson@example.com', 30, 3, 3),
('{"phone number": "938373634", "name": "test2 Doe"}'::jsonb,'test2.doe@example.com',27,1,1),
('{"phone number": "938373634", "name": "Alice Oliveira"}'::jsonb,'alice.johnson@example.com',30,3,2),
('{"phone number": "0123456789", "name": "Emily Brown"}'::jsonb, 'emily.brown@example.com', 30, 3, 1),
('{"phone number": "2345678901", "name": "Daniel Wilson"}'::jsonb, 'daniel.wilson@example.com', 30, 3, 2),
('{"phone number": "9012345678", "name": "Mia Lopez"}'::jsonb, 'mia.lopez@example.com', 30, 3, 3);

UPDATE public.department SET userid = 4 WHERE departmentid = 3;
UPDATE public.department SET userid = 11 WHERE departmentid = 2;
UPDATE public.department SET userid = 1 WHERE departmentid = 1;

INSERT INTO Requests (UserID, RequestFrom, RequestTo, Status)
VALUES
(1, '2024-01-01', '2024-01-05', 'pending'),
(2, '2024-01-01', '2024-01-05', 'pending'),
(3, '2024-01-01', '2024-01-05', 'pending'),
(4, '2024-01-01', '2024-01-05', 'pending'),
(5, '2024-01-01', '2024-01-05', 'pending'),
(2, '2024-01-01', '2024-01-05', 'pending'),
(3, '2024-01-01', '2024-01-05', 'pending'),
(4, '2024-01-01', '2024-01-05', 'pending'),
(5, '2024-01-01', '2024-01-05', 'pending'),
(15, '2024-01-01', '2024-01-05', 'pending'),
(16, '2024-01-01', '2024-01-05', 'pending'),
(17, '2024-01-01', '2024-01-05', 'pending'),
(8, '2024-01-01', '2024-01-05', 'pending'),
(9, '2024-01-01', '2024-01-05', 'pending'),
(10, '2024-01-01', '2024-01-05', 'pending'),
(11, '2024-01-01', '2024-01-05', 'pending'),
(12, '2024-01-01', '2024-01-05', 'pending'),
(13, '2024-01-01', '2024-01-05', 'pending'),
(1, '2024-07-01', '2024-07-05', 'pending'),
(2, '2024-07-06', '2024-07-10', 'pending'),
(3, '2024-07-11', '2024-07-15', 'pending'),
(4, '2024-07-16', '2024-07-20', 'pending'),
(5, '2024-07-21', '2024-07-25', 'pending'),
(2, '2024-07-26', '2024-07-30', 'pending'),
(3, '2024-08-01', '2024-08-05', 'pending'),
(4, '2024-08-06', '2024-08-10', 'pending'),
(5, '2024-08-11', '2024-08-15', 'pending'),
(15, '2024-08-16', '2024-08-20', 'pending'),
(16, '2024-08-21', '2024-08-25', 'pending'),
(17, '2024-08-26', '2024-08-30', 'pending'),
(8, '2024-09-01', '2024-09-05', 'pending'),
(9, '2024-09-06', '2024-09-10', 'pending'),
(10, '2024-09-11', '2024-09-15', 'pending'),
(11, '2024-09-16', '2024-09-20', 'pending'),
(12, '2024-09-21', '2024-09-25', 'pending'),
(13, '2024-09-26', '2024-09-30', 'pending');