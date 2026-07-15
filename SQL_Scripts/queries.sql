//all farmers//

SELECT *
FROM farmers;

//all produce with categories//

SELECT
    p.produce_name,
    c.category_name
FROM produce p
JOIN produce_categories c
ON p.category_id = c.category_id;

//Show Produce Collected by Each Farmer//

SELECT
    f.first_name,
    f.last_name,
    p.produce_name,
    pc.quantity,
    pc.grade
FROM farmers f
JOIN produce_collections pc
ON f.farmer_id = pc.farmer_id
JOIN produce p
ON pc.produce_id = p.produce_id
ORDER BY pc.quantity DESC;

//Total Quantity Collected per Produce//

SELECT
    p.produce_name,
    SUM(pc.quantity) AS total_quantity
FROM produce p
JOIN produce_collections pc
ON p.produce_id = pc.produce_id
GROUP BY p.produce_name;

//Buyers Who Have More Than One Order//

SELECT
    b.buyer_name,
    COUNT(o.order_id) AS total_orders
FROM buyers b
JOIN orders o
ON b.buyer_id = o.buyer_id
GROUP BY b.buyer_name
HAVING COUNT(o.order_id) > 1;

//Produce with Available Stock Greater Than 100//

SELECT
    p.produce_name,
    i.available_quantity
FROM produce p
JOIN inventory i
ON p.produce_id = i.produce_id
WHERE i.available_quantity > 100;

//Display Payment Details//

SELECT
    o.order_id,
    b.buyer_name,
    pay.amount,
    pay.payment_method,
    pay.payment_date
FROM payments pay
JOIN orders o
ON pay.order_id = o.order_id
JOIN buyers b
ON o.buyer_id = b.buyer_id;

//Highest Quantity Delivered//

SELECT
    produce_id,
    quantity
FROM produce_collections
WHERE quantity =
(
    SELECT MAX(quantity)
    FROM produce_collections
);

