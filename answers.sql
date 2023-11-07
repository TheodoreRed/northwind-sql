-- 1
SELECT * 
FROM customers;

-- 2
SELECT DISTINCT country 
FROM customers;

-- 3
SELECT *
FROM customers
WHERE customer_id LIKE 'BL%';

-- 4
SELECT * 
FROM orders
limit 100;

-- 5
SELECT *
FROM customers
WHERE postal_code IN ('1010', '3012', '12209', '05023');

-- 6
SELECT * 
FROM orders
WHERE ship_region IS NOT NULL;

-- 7
SELECT *
FROM customers
ORDER BY country, city;

-- 8
INSERT INTO customers 
(customer_id,company_name,contact_name,contact_title,address,city,region,postal_code,country,phone,fax)
VALUES
('THDR','techCompany','Theodore','dev','123 rd','grand rapids','midwest',49504,'usa',55512345567,999999);

-- 9
UPDATE orders
SET ship_region = 'EuroZone'
WHERE ship_country = 'France';


-- 10
DELETE FROM order_details 
WHERE quantity=1;

-- 11
SELECT
AVG(quantity) as average,
MAX(quantity) as maximum,
MIN(quantity) as minimum
FROM 
order_details;

-- 12
SELECT
AVG(quantity) as average,
MAX(quantity) as maximum,
MIN(quantity) as minimum
FROM 
order_details
group by order_id;

-- 13
SELECT customer_id
FROM orders
WHERE order_id = 10290;

-- 14 a
SELECT *
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id;

-- 14 b
SELECT *
FROM orders
LEFT JOIN customers
ON orders.customer_id = customers.customer_id;

-- 14 c
SELECT *
FROM orders
RIGHT JOIN customers
ON orders.customer_id = customers.customer_id;

-- 15
SELECT ship_city, ship_country 
FROM orders
RIGHT JOIN customers
ON orders.ship_city = customers.city
WHERE customers.city = 'London';

-- 16
SELECT ship_name
from orders
INNER JOIN order_details
ON orders.order_id = order_details.order_id
INNER JOIN products
ON order_details.product_id = products.product_id
WHERE products.discontinued = 1;

-- 17
SELECT first_name
FROM employees
WHERE reports_to IS NULL;

-- 18
SELECT e.first_name
FROM employees e
INNER JOIN employees e2
ON e.reports_to = e2.employee_id
WHERE e2.first_name = 'Andrew';

-- 19
CREATE INDEX idx_customer_id 
ON customers (customer_id);