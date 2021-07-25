create database if not exists MytestDB;
use MytestDB;
create table if not EXISTS user
(
    User_id        integer UNIQUE auto_increment,
    User_firstName varchar(255),
    User_lastName  varchar(255),
    User_Email     varchar(255),
    User_password  varchar(255),
    User_dob varchar(255),
    CONSTRAINT U_User_ID_PK PRIMARY KEY (User_id)
);


#inserter en record av en bruker inn i databasen otra.
insert into user (User_firstName,
                       User_lastName,
                       User_Email,
                       User_password,
                       User_dob)
values (
        'trym',
        'Staurheim',
        'trym@example.com',
        '12345',
        '1993-25-09');