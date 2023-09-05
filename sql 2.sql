
SELECT * FROM project.dataset2;
select * from project. dataset1;
---    number of rows from dataset

select count(*) from project.dataset1;
select count(*) from project.dataset2;

-- dataset for jharkhand and bihar,

select * from project.dataset1 where state in ('jharkhand','Bihar');

-- Population of India.
select * from project.dataset2;

select sum(Population) as Total_Population from project.dataset2;


---- avg-growth
select avg(Growth) as avg_Growth from project.dataset1;

select State, avg(Growth) as avg_Growth from project.dataset1 
group by state
order by avg_Growth desc limit 10 ;

--Population density
SELECT 
    District,
    State,
    Population,
    Area_km2,
    Population / Area_km2 AS Population_Density 
FROM project.dataset2 
order by Population_density desc limit 10 ;

      --Average Population Density by State
SELECT 
    State,
    AVG(Population / Area_km2) AS Avg_Population_Density
FROM project.dataset2 
GROUP BY State
order by Avg_Population_Density desc limit 5;







-- avg sex ratio
select State, round(avg(Sex_Ratio),0) as avg_sex_Ratio from project.dataset1 
group by state
order by avg_sex_Ratio desc;

-- avg literacy rate

select State, round(avg(literacy),0) as avg_literacy_Ratio from project.dataset1 
group by state having round(avg(literacy),0)> 90
order by avg_literacy_Ratio desc;

--- top 3 state showing highest growth
select  State, avg(Growth) as avg_Growth from project.dataset1 
group by state
order by avg_Growth desc limit 3 ;

--- bottom 3 state showing lowest sex ratio

select State, round(avg(Sex_Ratio),0) as avg_sex_Ratio from project.dataset1 
group by state
order by avg_sex_Ratio asc limit 3;


--- states starting with letter a

select distinct state from project.dataset1 
where lower(state) like 'a%'or lower(state) like 'b%';



select d.state,sum(d.males) total_males, sum(d.females) total_females from 
(select c.district,c.state,round(c.population/(c.sex_ratio+1),0)males,round((c.population*c.sex_ratio)/(c.sex_ratio+1),0) females from 
(select a.district,a.state,a.sex_ratio/1000 sex_ratio, b.population from project.dataset1 a 
inner join project.dataset2 b on a.district=b.district)c)d
group by d.state; 

select c.state, sum(literarte_people) total_literate_pop,sum(illiterate_people) total_illiterate_pop from
(select d.district,d.state,round(d.literacy_ratio*d.population,0)literate_people,
round(1-d.literacy_ratio)* d.population,0) illiterate_people ,
(select a.district,a.state,a.literacy/100 literacy_ratio,b.population from
 project.dataset1 a
inner join project.dataset2 b on a.district=b.district)d)c 
group by c.state;


select a.* from 
(select district,state,literacy,rank() over(partition by state order by literacy desc) rnk 
from project.dataset1)a
where a.rnk in (1,2,3) order by state;

SELECT state, district, population,
       SUM(population) OVER (PARTITION BY state) AS state_population,
       AVG(population) OVER (PARTITION BY state) AS state_avg_population
FROM project.dataset2;

select * from project.dataset2;

select a.District, a.State, a.Sex_Ratio, b.Population
from project.dataset1 a
inner join project.dataset2 b on a.District = b.District;

