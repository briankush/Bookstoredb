

--  Order Status Update
INSERT INTO order_history (order_id, status_id)
VALUES (
    @order_id,
    (SELECT status_id FROM order_status WHERE status_value = 'Processing')
);
 
 -- Customer Order
SELECT c.first_name, c.last_name, o.order_id, b.title, ol.quantity, ol.price
FROM customer c
JOIN cust_order o ON c.customer_id = o.customer_id
JOIN order_line ol ON o.order_id = ol.order_id
JOIN book b ON ol.book_id = b.book_id
WHERE c.email = 'briankush05@gmail.com'
ORDER BY o.order_date DESC;

-- Inventory Valuation Report
SELECT 
    b.title,
    a.author_name,
    b.stock_quantity,
    b.price,
    (b.stock_quantity * b.price) AS inventory_value
FROM book b
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id
ORDER BY inventory_value DESC;