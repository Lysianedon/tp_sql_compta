-- 3a. Delete from the compo table all the lines concerning the April 2019 purchase orders:
DELETE FROM compo 
WHERE id_bon IN (SELECT id FROM bon WHERE date_cmde BETWEEN '2019-04-01' AND '2019-04-30');

-- 3b. Delete from the bon table all the April 2019 purchase orders:
DELETE FROM bon
WHERE date_cmde BETWEEN '2019-04-01' AND '2019-04-30';

