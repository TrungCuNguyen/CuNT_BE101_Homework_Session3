ALTER TABLE library.Books ADD COLUMN genre varchar(100);

ALTER TABLE library.Books RENAME COLUMN available TO is_available;

ALTER TABLE library.members DROP COLUMN email;

DROP TABLE sales.OrderDetails;