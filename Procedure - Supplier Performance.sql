CREATE PROCEDURE `Supplier Performance` ()
BEGIN
SELECT sp.supp_id, s.supp_name, avg(r.rat_ratstars) as rating,
CASE 
WHEN r.rat_ratstars = 5 then 'Excellent Service'
WHEN r.rat_ratstars = 4 then 'Good Service'
WHEN r.rat_ratstars >= 2 then 'Average Service'
ELSE 'Poor Service'
END AS 'Type_of_Service'
FROM supplier s
JOIN supplier_pricing sp
ON s.supp_id = sp.supp_id
JOIN orders o 
ON sp.pricing_id = o.pricing_id
JOIN rating r
ON r.ord_id = o.ord_id
GROUP BY sp.supp_id;
END
