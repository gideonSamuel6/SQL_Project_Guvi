CREATE DEFINER=`root`@`localhost` PROCEDURE `project`()
BEGIN
-- 2. Create tables ( order, person, returns )

select * from orders;

select * from returns;

select * from people;

-- 3. Create new table using join tables based on keys order, person, returns - orderId, Person

create view collab as select orders.Order_Id , people.person from orders, people;

select * from collab;

-- 4. City wise sales, profit

select city, sales, profit from orders
order by city asc;

-- 5. segment wise max sales, discount, profit
	-- cannot able to do the segment wise max sales, discount, profit. Its shows error because when includes discount and profit.

select max(sales), segment from orders
group by segment;

-- 6. City wise top 3 sales

select city , sales, rank() over(partition by sales order by city) as rnk from orders
where sales > 3 ;

-- 7. Create store procedure for all above 6 tasks
END