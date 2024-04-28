-- 3a. Lowercase the designation of the item whose ID is 2:
UPDATE article 
SET designation = LOWER(designation)
WHERE id = 2;

-- 3b. Uppercase the designations of all items whose price is strictly greater than 10€:
UPDATE article 
SET designation = UPPER(designation)
WHERE prix > 10;

-- 3c. Lower the price of all items that have not been ordered by 10%:
UPDATE article 
LEFT JOIN compo ON compo.id_art = article.id
LEFT JOIN bon ON bon.id = compo.id_bon 
SET article.prix = article.prix * 0.9
WHERE compo.id_art IS NULL;

-- 3d. An error has crept into the orders for Française d'imports. The base figures are not correct. The quantities of all items ordered from this company must be doubled:
UPDATE article 
LEFT JOIN compo ON compo.id_art = article.id
LEFT JOIN bon ON bon.id = compo.id_bon 
LEFT JOIN fournisseur ON fournisseur.id = bon.id_fou
SET compo.qte = compo.qte * 2
WHERE fournisseur.nom = "Française d'Imports";

-- 3e. Develop an update query that allows you to remove the elements in parentheses in the designations. You will need to use functions such as substring and position:


