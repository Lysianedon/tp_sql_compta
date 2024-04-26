-- 2 :
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

-- h. Calculate the average of the articles' prices of 'Dubois & Fils' supplier:
SELECT AVG(PRIX) FROM ARTICLE LEFT JOIN FOURNISSEUR ON ARTICLE.ID_FOU = FOURNISSEUR.ID 
WHERE FOURNISSEUR.NOM = 'Dubois & Fils';

-- i. Calculate the average of the articles' prices for each supplier:
SELECT FOURNISSEUR.NOM, AVG(PRIX) FROM ARTICLE LEFT JOIN FOURNISSEUR ON ARTICLE.ID_FOU = FOURNISSEUR.ID GROUP BY FOURNISSEUR.NOM;

-- j. Select all purchase orders created between 03/01/2019 and 04/05/2019 at 12h00:
SELECT * FROM BON WHERE DATE_CMDE BETWEEN '2019-03-01' AND '2019-04-05-12-00-00';

-- k. Select all purchase orders containing bolts:
SELECT BON.* FROM BON LEFT JOIN COMPO ON COMPO.ID_BON = BON.ID LEFT JOIN ARTICLE ON ARTICLE.ID = COMPO.ID_ART WHERE ARTICLE.DESIGNATION LIKE "%boulon%";

-- l. Select all purchase orders containing bolts with the related supplier's name :
SELECT BON.*, FOURNISSEUR.NOM FROM BON LEFT JOIN FOURNISSEUR ON FOURNISSEUR.ID = BON.ID_FOU LEFT JOIN COMPO ON COMPO.ID_BON = BON.ID LEFT JOIN ARTICLE ON ARTICLE.ID = COMPO.ID_ART WHERE ARTICLE.DESIGNATION LIKE "%boulon%";

-- m. Calculate the sum of each purchase order : (displaying the BON.ID for more clarity):
SELECT SUM(ARTICLE.PRIX * COMPO.QTE), BON.ID FROM ARTICLE LEFT JOIN COMPO ON COMPO.ID_ART = ARTICLE.ID LEFT JOIN BON ON BON.ID = COMPO.ID_BON GROUP BY BON.ID;

-- n. Count the number of articles of each purchase order:
SELECT SUM(QTE) FROM compo GROUP BY ID_BON; 

-- o. Display the purchase order numbers containing more than 25 articles and display the number of articles of each of the purchase order:
SELECT ID_BON, SUM(QTE) as totalQte FROM COMPO GROUP BY ID_BON HAVING totalQte > 25;

-- p. Calculate the total cost of the orders passed in April:
SELECT SUM(ARTICLE.PRIX * COMPO.QTE) FROM ARTICLE LEFT JOIN COMPO ON COMPO.ID_ART = ARTICLE.ID INNER JOIN BON ON BON.ID = COMPO.ID_BON WHERE BON.DATE_CMDE BETWEEN '2019-04-01' AND '2019-04-30';

-- 3:

