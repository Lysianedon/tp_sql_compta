-- List all data about articles:
SELECT * FROM ARTICLE;

-- Only list the references and designations of articles that cost more than 2 euros:
SELECT REF, DESIGNATION FROM ARTICLE WHERE PRIX > 2;

-- List all articles which price is between 2 and 6.25€ using comparisons operator:
SELECT * FROM ARTICLE WHERE PRIX >= 2 AND PRIX <= 6.25;

-- List all articles which price is between 2 and 6.25€ using BETWEEN operator:
SELECT * FROM ARTICLE WHERE PRIX BETWEEN 2 AND 6.25;

-- List all articles in descending order, which price is NOT between 2 and 6.25€ and which supplier is
-- Française d'Imports
SELECT * FROM ARTICLE WHERE PRIX NOT BETWEEN 2 AND 6.25 AND ID_FOU = 1 ORDER BY PRIX DESC;

-- List all articles which supplier is either Française d'Imports or Dubois & Fils using a logical operator:
SELECT * FROM ARTICLE WHERE ID_FOU = 1 OR ID_FOU = 3;

-- Make the same request using the "IN" operator:
SELECT * FROM ARTICLE WHERE ID_FOU IN (1, 3);

-- List all articles which supplier is not Française d'Imports nor Dubois & Fils using using "NOT" and "IN":
SELECT * FROM ARTICLE WHERE ID_FOU NOT IN (1, 3);

-- List all purchase orders which order date is between 02/01/2019 and 04/30/2019:
SELECT * FROM BON WHERE DATE_CMDE BETWEEN '2019-02-01' AND '2019-04-30';

