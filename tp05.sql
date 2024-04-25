-- List all articles ordered by designation in ascending order:
SELECT * FROM ARTICLE ORDER BY designation ASC;

-- List all articles ordered by price in descending order:
SELECT * FROM ARTICLE ORDER BY prix DESC;

-- List all articles which are bolt, ordered by price in ascending order:
SELECT * FROM ARTICLE WHERE DESIGNATION LIKE '%boulon%' ORDER BY prix ASC;
