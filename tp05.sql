--a. List all articles ordered by designation in ascending order:
SELECT * FROM ARTICLE ORDER BY designation ASC;

--b. List all articles ordered by price in descending order:
SELECT * FROM ARTICLE ORDER BY prix DESC;

--c. List all articles which are bolt, ordered by price in ascending order:
SELECT * FROM ARTICLE WHERE DESIGNATION LIKE '%boulon%' ORDER BY prix ASC;

-- d. List all articles which designation contain the word 'sachet':
SELECT * FROM ARTICLE WHERE DESIGNATION LIKE '%sachet%';

-- e. List all articles which designation contain the word 'sachet'. The request must be case insensitive: INFO => Since the encoding type of the database is utf_general_ci, the sorting is already case insensitive, so we dont need to specify anything about the case:
SELECT * FROM ARTICLE WHERE DESIGNATION LIKE '%sachet%'; 

-- f. List all articles with their corresponding supplier information. The results must be sorted alphabetically by the suppliers' names and then by price in descending order:
SELECT * FROM ARTICLE LEFT JOIN FOURNISSEUR ON ARTICLE.ID_FOU = FOURNISSEUR.ID ORDER BY FOURNISSEUR.NOM ASC, PRIX DESC;

-- g. List all articles from 'Dubois & Fils' company:
SELECT ARTICLE.* FROM ARTICLE LEFT JOIN FOURNISSEUR ON ARTICLE.ID_FOU = FOURNISSEUR.ID 
WHERE FOURNISSEUR.NOM = 'Dubois & Fils';



