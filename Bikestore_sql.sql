select
	ord.order_id,
	CONCAT(cus.first_name,' ', cus.last_name) as 'customer',
	cus.city,
	cus.state,
	ord.order_date,
	sum(ite.quantity) as 'total_units',
	sum(ite.quantity * ite.list_price) as 'revenue',
	pro.product_name,
	cat.category_name,
	sto.store_name,
	bra.brand_name,
	CONCAT(sta.first_name,' ', sta.last_name) as 'sales_rep'


from sales.orders ord
join sales.customers cus
on cus.customer_id = ord.customer_id
join sales.order_items ite
on ord.order_id = ite.order_id
join production.products pro
on pro.product_id = ite.product_id
join production.categories cat
on cat.category_id = pro.category_id
join production.brands bra 
on bra.brand_id = pro.brand_id
join sales.stores sto
on sto.store_id = ord.store_id
join sales.staffs sta
on sta.staff_id = ord.staff_id


group by 
	ord.order_id,
	CONCAT(cus.first_name,' ', cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name,
	sto.store_name,
	bra.brand_name,
	CONCAT(sta.first_name,' ', sta.last_name)


