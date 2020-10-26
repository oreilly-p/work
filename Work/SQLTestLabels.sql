-- Short SQL Query to remove the use-by-date prompt, weight prompt, 
-- and control source group constraint from the product table. Only to be run on the Test System.
UPDATE tblProduct
set UseByDatePromptYN = 0, getWeightYN = 0, idControlSourceGroup = 1