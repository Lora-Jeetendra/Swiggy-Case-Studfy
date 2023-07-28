select count(*) from swiggy;

-- Q1 HOW MANY RESTAURANTS HAVE A RATING GREATER THAN 4.5?
select * from swiggy where rating>4.5;

-- Q2 WHICH IS THE TOP 1 CITY WITH THE HIGHEST NUMBER OF RESTAURANTS?
select city, count(distinct restaurant_name) as restaurant_count from swiggy
group by city
order by restaurant_count desc
limit 1;

-- Q3 HOW MANY RESTAURANTS HAVE THE WORD "PIZZA" IN THEIR NAME?
select count(distinct restaurant_name) as Name from swiggy 
where restaurant_name like '%Pizza%';

-- Q4  WHAT IS THE MOST COMMON CUISINE AMONG THE RESTAURANTS IN THE DATASET?
select cuisine, count(*) as count from swiggy
group  by cuisine
order by count desc
limit 1;

-- Q5 WHAT IS THE AVERAGE RATING OF RESTAURANTS IN EACH CITY?
select avg(rating) from swiggy;

-- Q6 WHAT IS THE HIGHEST PRICE OF ITEM UNDER THE 'RECOMMENDED' MENU
-- CATEGORY FOR EACH RESTAURANT?
select restaurant_name, max(price) as maxPrice from swiggy
where menu_category='Recommended'
group by restaurant_name;

-- Q7 FIND THE TOP 5 MOST EXPENSIVE RESTAURANTS THAT OFFER CUISINE OTHER THAN
-- INDIAN CUISINE.
select distinct restaurant_name, cost_per_person from swiggy
where cuisine <>'Indian'
group by restaurant_name,cost_per_person 
ORDER BY cost_per_person desc
limit 5;

-- Q8 FIND THE RESTAURANTS THAT HAVE AN AVERAGE COST WHICH IS HIGHER THAN THE
-- TOTAL AVERAGE COST OF ALL RESTAURANTS TOGETHER.
select distinct restaurant_name, cost_per_person from swiggy
where cost_per_person>(select  avg(cost_per_person) from swiggy);

-- Q9 RETRIEVE THE DETAILS OF RESTAURANTS THAT HAVE THE SAME NAME BUT ARE
-- LOCATED IN DIFFERENT CITIES.
select distinct t1.restaurant_name, t1.city,t2.city
from swiggy t1, swiggy t2
where t1.restaurant_name= t2.restaurant_name
and t1.city<> t2.city;

-- Q10 WHICH RESTAURANT OFFERS THE MOST NUMBER OF ITEMS IN THE 'MAIN COURSE'
-- CATEGORY?
select restaurant_name, count(item) as items_count from swiggy
where menu_category='main course'
group by restaurant_name
order by items_count desc
limit 1;

-- Q11 LIST THE NAMES OF RESTAURANTS THAT ARE 100% VEGEATARIAN IN
-- ALPHABETICAL ORDER OF RESTAURANT NAME.
select distinct restaurant_name from swiggy
where veg_or_nonveg='veg'
order by restaurant_name;

-- Q12 WHICH IS THE RESTAURANT PROVIDING THE LOWEST AVERAGE PRICE FOR ALL ITEMS?
select restaurant_name, avg(price) from swiggy
group by restaurant_name
order by avg(price)
limit 1;

-- Q13 WHICH TOP 5 RESTAURANT OFFERS HIGHEST NUMBER OF CATEGORIES?
select restaurant_name, count(distinct menu_category) from swiggy
group by restaurant_name
order by count(distinct menu_category) desc
limit 5;

-- Q14 WHICH RESTAURANT PROVIDES THE HIGHEST PERCENTAGE OF NON-VEGEATARIAN FOOD?
select distinct restaurant_name,
(count(case when veg_or_nonveg='Non-veg' then 1 end)*100
/count(*)) as nonvegetarian_percentage
from swiggy
group by restaurant_name
order by nonvegetarian_percentage desc limit 1;