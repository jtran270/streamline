-- CREATE TABLES
CREATE TABLE login_listeneruserid (
User_ID INT PRIMARY KEY,
Email VARCHAR(255) NOT NULL,
First_Name VARCHAR(255),
Last_Name VARCHAR(255),
Age INT,
UNIQUE(Email)
);

CREATE TABLE login_listeneremail (
Email VARCHAR(255) PRIMARY KEY,
Password VARCHAR(255),
FOREIGN KEY (Email) REFERENCES login_listeneruserid (Email)
ON DELETE CASCADE
ON UPDATE CASCADE
);

-- INSERT VALUES
INSERT INTO login_listeneruserid (User_ID,Email,First_Name,Last_Name,Age) 
VALUES
(6, 'dog@dog.com', 'John', 'Doe', 23),
(7,	'mouse@mouse.com', 'Mary', 'Jane', 15),
(8,	'lion@lion.com', 'Simon', 'Smith', 7),
(9, 'cat@cat.com', 'Neko', 'Kawaii', 14),
(10, 'jesus@holywater.com',	'Jesus', 'Christ',2018)
;

INSERT INTO login_listeneremail (Email, Password)
VALUES
('dog@dog.com', '12345'),
('mouse@mouse.com', 'iluvyou'),
('lion@lion.com', '11111'),
('cat@cat.com', '12345'),
('jesus@holywater.com', 'qwerty')
;