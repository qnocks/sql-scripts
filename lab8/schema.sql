CREATE TABLE IF NOT EXISTS owner (
    id int PRIMARY KEY,
    first_name varchar(50) NOT NULL,
    second_name varchar(50) NOT NULL,
    patronymic varchar(50),
    birthdate date,
    dummy varchar(255)
);

CREATE TABLE IF NOT EXISTS garden (
    id int PRIMARY KEY,
    number varchar(30) NOT NULL,
    area int NOT NULL,
    cost bigint
);

CREATE TABLE IF NOT EXISTS owner_garden (
    id int PRIMARY KEY,
    owner_id int REFERENCES owner(id) ON DELETE CASCADE ON UPDATE RESTRICT,
    garden_id int REFERENCES garden(id) ON DELETE CASCADE ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS building_type (
    id int PRIMARY KEY,
    name varchar(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS building (
    id int PRIMARY KEY,
    garden_id int REFERENCES garden(id) ON DELETE CASCADE ON UPDATE RESTRICT,
    building_type_id int REFERENCES building_type(id) ON DELETE CASCADE ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS contribution (
    id int PRIMARY KEY,
    name varchar(100) NOT NULL,
    description varchar(500),
    price int NOT NULL,
    contribution_date date NOT NULL
);

CREATE TABLE IF NOT EXISTS payment (
    id int PRIMARY KEY,
    amount int NOT NULL,
    payment_date date NOT NULL,
    owner_id int REFERENCES owner(id) ON DELETE CASCADE ON UPDATE RESTRICT,
    contribution_id int REFERENCES contribution(id) ON DELETE CASCADE ON UPDATE RESTRICT
);