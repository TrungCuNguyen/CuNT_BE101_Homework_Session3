CREATE SCHEMA sales;

CREATE TABLE sales.Members
(
    member_id SERIAL PRIMARY KEY,
    first_name  VARCHAR(50) NOT NULL,
    last_name   VARCHAR(50) NOT NULL,
    email       VARCHAR(50) NOT NULL UNIQUE,
    phone       VARCHAR(11)
);

CREATE TABLE sales.Products
(
    product_id     SERIAL PRIMARY KEY,
    product_name   VARCHAR(100)   NOT NULL,
    price          NUMERIC(10, 2) NOT NULL,
    stock_quantity INT            NOT NULL
);

CREATE TABLE sales.Orders
(
    order_id       SERIAL PRIMARY KEY,
    member_id    INT REFERENCES sales.Members (member_id),
    order_date     DATE NOT NULL
);

CREATE TABLE sales.OrderDetails
(
    order_detail_id SERIAL PRIMARY KEY,
    order_id      INT REFERENCES sales.Orders (order_id),
    product_id    INT REFERENCES sales.Products (product_id),
    quantity      INT CHECK ( quantity >= 1 )
);
