/*
DASHBOARD 2 - INVENTORY MANAGMENT
KEEP TRACK OF HOW MUCH INVENTORY ARE WE USING, AND WHEN IT IS THE TIME 
TO REORDER
ALSO WANT TO KNOW HOW MUCH EACH PRODUCT COSTS BASED ON COSTS OF INGREDIENTS
TO KEEP AN EYE ON PRICING 

WE WILL NEED:
1. TOTAL QUANTITY OF INGREDIENT
2. TOTAL COST OF INGREDIENTS
3. CALCULATED COST OF PIZZA
4. PRECENTAGE STOCK REMAINING BY INGREDIENT 
*/

/* 1ST STEP IS TO MAKE QUERY THAT WILL SHOW HOW MUCH EACH PIZZA WAS ORDERED
*/


SELECT * FROM ingredient


	
SELECT 
s1.item_name,
s1.ing_id,
s1.ing_name,
s1.ing_weight,
s1.ing_price,
s1.how_many_products,
s1.recipe_quantity,
s1.recipe_quantity * s1.how_many_products AS ordered_weight,
s1.ing_price / s1.ing_weight AS unit_cost,
(s1.recipe_quantity * s1.how_many_products) * (s1.ing_price / s1.ing_weight) AS cost_of_ingredient
FROM (
SELECT
o.item_id,
i.sku,
i.item_name,
r.ing_id,
ing.ing_name,
r.quantity AS recipe_quantity,
SUM(o.quantity) AS how_many_products,
ing.ing_weight,
ing.ing_price
FROM orders o LEFT JOIN item i ON o.item_id = i.item_id
LEFT JOIN recipe r ON i.sku = r.recipe_id
LEFT JOIN ingredient ing ON r.ing_id = ing.ing_id
GROUP BY 
o.item_id,
i.sku,
i.item_name,
r.ing_id,
r.quantity,
ing.ing_name,
ing.ing_weight,
ing.ing_price
) s1



CREATE VIEW stock1 AS 
SELECT 
s1.item_name,
s1.ing_id,
s1.ing_name,
s1.ing_weight,
s1.ing_price,
s1.how_many_products,
s1.recipe_quantity,
s1.recipe_quantity * s1.how_many_products AS ordered_weight,
s1.ing_price / s1.ing_weight AS unit_cost,
(s1.recipe_quantity * s1.how_many_products) * (s1.ing_price / s1.ing_weight) AS cost_of_ingredient
FROM (
SELECT
o.item_id,
i.sku,
i.item_name,
r.ing_id,
ing.ing_name,
r.quantity AS recipe_quantity,
SUM(o.quantity) AS how_many_products,
ing.ing_weight,
ing.ing_price
FROM orders o LEFT JOIN item i ON o.item_id = i.item_id
LEFT JOIN recipe r ON i.sku = r.recipe_id
LEFT JOIN ingredient ing ON r.ing_id = ing.ing_id
GROUP BY 
o.item_id,
i.sku,
i.item_name,
r.ing_id,
r.quantity,
ing.ing_name,
ing.ing_weight,
ing.ing_price
) s1



SELECT 
s2.ing_name,
s2.ordered_weight,
ing.ing_weight * inv.quantity AS total_weight_in_stock,
(ing.ing_weight * inv.quantity) - s2.ordered_weight AS remaining_weight
FROM
(
SELECT 
ing_id,
ing_name,
sum(ordered_weight) AS ordered_weight
FROM stock1 
GROUP BY 
ing_name,
ing_id
) s2
LEFT JOIN inventory inv ON inv.item_id = s2.ing_id
LEFT JOIN ingredient ing ON ing.ing_id = s2.ing_id
