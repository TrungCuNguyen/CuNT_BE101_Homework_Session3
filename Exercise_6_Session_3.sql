CREATE DATABASE LibraryDB;

CREATE SCHEMA library;

CREATE TABLE library.Books
(
    book_id        SERIAL PRIMARY KEY,
    title          VARCHAR(100) NOT NULL,
    author         VARCHAR(50)  NOT NULL,
    published_year DATE,
    available      BOOLEAN DEFAULT True
);

CREATE TABLE library.Members
(
    member_id SERIAL PRIMARY KEY,
    name      VARCHAR(100) NOT NULL,
    email     VARCHAR(50)  NOT NULL UNIQUE ,
    join_date DATE DEFAULT CURRENT_DATE
);