/*
DASHBOARD 1
WILL BE NEEDING THIS DATA
1. TOTAL ORDERS
2. TOTAL SALES
3. TOTAL ITEMS 
4. AVERAGE ORDER VALUE
5. SALES BY  CATEGORY 
6. TOP SELLING ITEMS 
7. ORDERS BY HOUR 
8. SALES BY HOUR 
9. ORDERS BY ADDRESS
10. ORDERS BY DELIVERY/PICKUP
*/

SELECT 
o.order_id,
i.item_price,
o.quantity,
/* AVERAGE VALUE = TOTAL PRICE / TOTAL ORDERS --> IN BI TOOL */
i.item_cat,
i.item_name,
o.created_at,
a.delivery_address1,
a.delivery_address2,
a.delivery_city,
a.delivery_zipcode,
o.delivery
FROM orders o LEFT JOIN item i ON o.item_id = i.item_id LEFT JOIN address a ON o.add_id = a.add_id

