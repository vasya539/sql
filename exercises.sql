-- 1
select * from shippers;

-- 2
select category_name, description
from categories;

-- 3
select first_name, last_name, hire_date
from employees
where title = 'Sales Representative';

-- 4
select first_name, last_name, hire_date
from employees
where title = 'Sales Representative' and country = 'USA';

-- 5
select order_id, order_date
from orders
where employee_id = 5;

-- 6
select supplier_id, contact_name, contact_title
from suppliers
where contact_title <> 'Marketing Manager';

-- 7
select product_id, product_name from products where product_name ILIKE '%queso%';
select product_id, product_name from products where product_name LIKE '%Queso%';

-- 8
select order_id, customer_id, ship_country from orders where ship_country = 'France' or ship_country = 'Belgium';

-- 9
select order_id, customer_id, ship_country from orders where ship_country in ('Brazil', 'Mexico', 'Argentina', 'Venezuela');

-- 10
select first_name, last_name, title, birth_date from employees order by birth_date asc;


-- 11
select first_name, last_name, title, cast(birth_date as date) from employees order by birth_date asc;

-- 12
select first_name, last_name, concat_ws(' ', first_name, last_name) as full_name from employees;
select first_name, last_name, first_name || ' ' || last_name as full_name from employees;

-- 13
select order_id, product_id, unit_price, quantity, unit_price * quantity as total_price from order_details;

-- 14
select count(*) as total_customers from customers;

-- 15
select order_date as first_order from orders limit 1;
select min(order_date) as first_order from orders;

-- 16
select country from customers group by country;

-- 17
select contact_title, count(contact_title) from customers group by contact_title order by count(*) desc;

-- 18
select product_id, product_name, company_name from products inner join suppliers on products.supplier_id = suppliers.supplier_id order by product_id;

-- 19
select order_id, order_date, company_name from orders inner join shippers on orders.ship_via = shippers.shipper_id where order_id < 10300;

-- 20
select category_name, count(product_id) from products inner join categories on products.category_id = categories.category_id group by category_name order by count(product_id) desc;

-- 21
select country, city, count(customer_id) from customers group by country, city order by count(customer_id) desc;

-- 22
select product_id, product_name, units_in_stock, reorder_level from products where units_in_stock < reorder_level order by product_id;

-- 23
select product_id, product_name, units_in_stock, units_on_order, reorder_level, discontinued from products where units_in_stock + units_on_order <= reorder_level and discontinued = 0;

-- 24
select customer_id, company_name, region from customers order by case when Region is null then 1 else 0 end, region, customer_id;

--25
select ship_country, avg(freight) as average_freight from orders group by ship_country order by average_freight desc limit 3;

-- 26
select ship_country, avg(freight) as average_freight
from orders
  where extract(year from order_date) > 2015
group by ship_country
order by avg(freight) desc
limit 3;

-- 28
select ship_country, avg(freight) as average_freight
from orders
  where order_date >= date_trunc('month', (select max(order_date) from orders)) - interval '12 month'
group by ship_country
order by average_freight desc
limit 3;

-- 29
select orders.employee_id, last_name, orders.order_id, product_name, order_details.quantity
from orders
  inner join employees on employees.employee_id = orders.employee_id
  inner join order_details on orders.order_id = order_details.order_id
  inner join products on products.product_id = order_details.product_id
order by order_id;

-- 30
select customers.customer_id, orders.customer_id
from customers
  left outer join orders on customers.customer_id = orders.customer_id
where orders.customer_id is null;

-- 31
select customers.customer_id
from customers
  left outer join orders on customers.customer_id = orders.customer_id and employee_id = 4
where orders.customer_id is null;

-- 32
select orders.customer_id, customers.company_name, orders.order_id, sum(quantity * unit_price) as total_order_amount
from orders
where









