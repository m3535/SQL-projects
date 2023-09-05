show tables;
desc sales;
select * from sales;
select amount,customers from sales;
select amount,customers from sales;
select saledate,amount,pizza_salesboxes,amount/boxes as 'Amount per boxes' from sales;
select saledate,amount,boxes,amount/boxes as 'Amount per boxes' from sales
where amount >5000
order by amount desc;
select spid,amount,boxes,saledate,customers,weekday(saledate) from sales
where weekday(saledate)= '4';

select * from sales;
select * from people
where salesperson like 'B%';
select * from sales;
select customers,amount,
	case
		when amount<1000 then 'Normal Customer'
        when amount>1000 and amount<5000 then 'Standard Customer'
        else 'Premium Customers'
        end as 'Category'
	from sales;
select saledate, amount from sales
where amount>10000 and year(saledate)=2022
order by amount desc;
select * from sales
where boxes >0 and boxes<=50;

select * from sales
where amount > 2000 and boxes <100;
select* from sales
where saledate between '2022-01-01' and '2022-01-31';
select* from sales
where Customers<100 and boxes <100;
select *,
case when weekday(saledate)=2 then'wednesday shipment'
else
end 'shipment'
from sales
where customers <100 and boxes <100;

select p.salesperson, count(*) as 'shipment count' from sales s
join people p on s.spid = p.spid
where saledate between '2022-01-01' and '2022-01-31'
group by p.Salesperson;
select * from products;

select pr.product, sum(boxes) as 'total boxes' from sales s
join products pr  on s.pid = pr.pid
where pr.product in ('milk bars','eclairs')
group by pr.product;

select pr.product, sum(boxes) as 'total boxes' from sales s
join products pr on s.pid=pr.pid
where pr.product in ('milk bars','eclairs')
and saledate between '2022-02-01' and '2022-02-07'
group by pr.product;

select *from sales
where customers<100 and boxes<100 and weekday(saledate) =2;

select distinct p.salesperson from sales s 
join people p on p.spid = s.spid
where s.saledate between '2022-01-01' and '2022-01-07';

select p.Salesperson, count(s.SaleDate) as 'Total Count' from sales s
inner join people p on s.SPID=p.SPID 
where s.SaleDate between '2022-01-01' and '2022-01-07' 
group by p.Salesperson having count(s.SaleDate) <1;

select p.salesperson from people p	
where p.spid not in (select distinct s.spid from sales s 
where s.saledate between '2022-01-01' and '2022-01-07');

select count(*) from orders 
where boxes>1000
group by month(shipped_date);

select* from sales;
select year(saledate)'YEAR', month(saledate) 'MONTH',count(*)'times we shipped more then 1000 boxes'
from sales
where boxes >1000
group by year(saledate),month(saledate)
order by year(saledate), month(saledate);





