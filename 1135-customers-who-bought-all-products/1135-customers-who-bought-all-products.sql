/* Write your T-SQL query statement below */

select customer_id from Customer
group by customer_id
HAVING count(distinct product_key) = (select count(distinct product_key) from Product)
;