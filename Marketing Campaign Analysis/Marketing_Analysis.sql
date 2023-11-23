                                                --- Project Overview ---

-- XYZ Paints Inc. is a paint company which was recently launched in 2019. Since then, 
-- they have established their name in top tier 1 and 2 cities (slowly expanding to tier 3 cities as well). 

-- They have orders coming from household, industrial and government sectors. 
-- In recent years, they are seeing quite a steady growth and would like to continue that in future. 


                                                --- Projected Outcome ---

-- You have been hired as a Data Analyst for their data consulting team, which offers services across various departments such as sales, 
-- marketing, logistics, etc.

-- A sample of data from their databases has been provided to the new hire. 
-- The Data Scientist is tasked with addressing some of the pain points of the marketing team, such as consumer growth, 
-- lead conversions, etc. Furthermore, support is expected in working on a new set of campaigns or conducting market basket analysis.



-- LET'S DIVE INTO THE ANALYSIS:


-- SECTION 1 -- Getting the overview of the data.
-- PART 1 -- Check out the cardinality of following columns:

--  Different color segments (categories) provided by the company.

select count(distinct(item_category)) as total_colour_segments
from project_db.item;


-- Different Coupon Types that are offered.

select distinct(coupontype) as coupon_types
from project_db.couponmapping;


-- States where the company is currently delivering its products and services.

select distinct(state) as current_active_states
from project_db.citydata;


-- Different Order Types.

select distinct(ordertype) as order_types
from project_db.customertransactiondata;


-- PART 2 -- Identify total number of sales (transactions) happened by

-- Total number of sales by Yearly basis

select year(purchasedate) as year, count(trans_id) as no_of_sales
from project_db.customertransactiondata
group by year(purchasedate)
order by year;


-- Total number of sales by Quarterly basis

select year(purchasedate) as year, quarter(purchasedate) as quarter, 
count(trans_id) as no_of_sales 
from project_db.customertransactiondata
group by year(purchasedate), quarter(purchasedate)
order by year, quarter;


-- Total number of sales by Yearly and Monthly basis

select year(purchasedate) as year, month(purchasedate) as month,
count(trans_id) as no_of_sales 
from project_db.customertransactiondata
group by year(purchasedate), month(purchasedate)
order by year, month;

"Observations:"
1. "Year 2020 had most number of sales for the company."
2. "For the data by the company, the sales has a significant pattern of upscaling in the 4th quarter."
3. "Over the years, month of december has been a key driver of number of sales."

-- PART 3 -- Identify the total purchase order by

-- Total purchase order by Product category

select i.item_category, sum(cd.quantity * cd.purchasingamt) as total_purchase
from project_db.customertransactiondata cd 
join project_db.item i 
on i.item_id = cd.item_id 
group by i.item_category
order by total_purchase desc;


-- Total purchase order by Yearly and Quarterly basis

select year(purchasedate) as year, quarter(purchasedate) as quarter,
sum(cd.quantity * cd.purchasingamt) as total_purchase
from project_db.customertransactiondata cd 
join project_db.item i 
on i.item_id = cd.item_id 
group by year(purchasedate), quarter(purchasedate)
order by year, quarter;


-- Total purchase order by Order Type

select ordertype, sum(quantity * purchasingamt) as total_purchase
from project_db.customertransactiondata
group by ordertype
order by total_purchase desc;


-- Total purchase order by City Tier

select cid.citytier, sum(cd.quantity * cd.purchasingamt) as total_purchase
from project_db.customertransactiondata cd 
join project_db.customer c 
on c.customer_id = cd.cust_id 
join project_db.citydata cid 
on c.city_id = cid.city_id
group by cid.citytier
order by total_purchase desc;

"Observation:"
1. "Anti-Corrosive Paint category followed by Oil Paint has been two leading item categoru interms of total sales."
2. "For the company government has been the leading customer, followed by Industrial and Household to be the least in terms of total sales."
3. "Tier 2 has the most sales, followed by tier 1 and tier 3."

-- SECTION 2 -- Understanding lead conversion

-- PART 1 -- Company wants to understand the customer path to conversion 
-- as a potential purchaser based on our campaigns.

-- Identify the total number of transactions with campaign coupon vs total 
-- number of transactions without campaign coupon.

select "Without_Coupons" as campaign_coupons, count(trans_id) as total_transaction
from project_db.customertransactiondata 
where campaign_id is null

union all 

select "With_Coupons" as campaign_coupons, count(trans_id) as total_transaction
from project_db.customertransactiondata
where campaign_id is not null

order by total_transaction desc;


-- Identify the number of customers with first purchase done with or without campaign coupons.

with transaction_rank as 
(select *
from
(select *,
dense_rank() over (partition by cust_id order by purchasedate) as purchase_rank
from project_db.customertransactiondata) t1
where purchase_rank = 1)

select "Without_Coupons" as campaign_coupons, count(trans_id) as total_first_transaction
from transaction_rank 
where campaign_id is null 
union all 
select "With_Coupons" as campaign_coupons, count(trans_id) as total_first_transaction
from transaction_rank
where campaign_id is not null

order by total_first_transaction desc;

"Observations:"
1. "Campaign coupon has been a plus in terms of number of sales/transactions for the company."
2. "The company's number of transaction has an overwhelming 63.29% increase in transaction count with campaign coupons."
3. "Fist time consumers tend to use campaign coupons 100% more than without campaign coupons."

-- SECTION 3 -- Understanding company growth and decline

-- PART 1 -- Marketing team is interested in understanding the growth and decline pattern of the 
-- company in terms of new leads or sales amount by the customers.

-- Identify the total growth on an year by year basis

-- Based on Quantity of paint that's sold.

with yoy_quantity as 
(select year(purchasedate) as year, sum(quantity) as total_quantity
from project_db.customertransactiondata
group by year(purchasedate)
order by year),

previous_year_quantity as 
(select year,
lag(total_quantity) over (order by year) as previous_year_quantity
from yoy_quantity)

select yoy.year, yoy.total_quantity, 
(total_quantity - previous_year_quantity)/previous_year_quantity *100 as yoy_growth
from yoy_quantity yoy 
join previous_year_quantity pyq
on yoy.year = pyq.year 
order by year;


-- Total growth Based on amount of paint that's sold.

with yoy_amount as 
(select year(purchasedate) as year, sum(quantity*purchasingamt) as total_amount
from project_db.customertransactiondata
group by year(purchasedate)
order by year),

previous_year_amount as 
(select year, 
lag(total_amount) over (order by year) as previous_year
from yoy_amount)

select yoy_a.year, yoy_a.total_amount,
(total_amount - previous_year)/previous_year *100 as yoy_growth
from yoy_amount yoy_a 
join previous_year_amount pya 
on yoy_a.year = pya.year 
order by year;


-- Total Growth Customers that's acquired [New + Repeated].

select *
from
(select year, new_users as new_users_2022,
lag(new_users) over (order by year) as pastoffset_1,
lag(new_users, 2) over (order by year) as pastoffset_2,
lag(new_users, 3) over (order by year) as pastoffset_3
from
(select year(purchasedate) as year, count(distinct(cust_id)) as new_users
from project_db.customertransactiondata
group by year(purchasedate)
having year < 2023) as t1) as t2
where t2.year = 2022;


-- Segregate the above By OrderType and select based on number of customers.

select *
from 
(select year, OrderType, new_users as new_users_2022,
lag(new_users) over (partition by OrderType order by year) as pastoffset_1,
lag(new_users, 2) over (partition by OrderType order by year) as pastoffset_2,
lag(new_users, 3) over (partition by OrderType order by year) as pastoffset_3
from 
(select year(purchasedate) as year, OrderType,
count(distinct(cust_id)) as new_users
from project_db.customertransactiondata
group by year(purchasedate), OrderType
having year < 2023
order by year) as t1) as t2
where t2.year = 2022;

"Observations:"
1. "2023 data is still ongoing, so we are not taking it under consideration."
2. "The company has been facing a steep decline since year 2020 till 2022 in terms of quantity of paint sold."
3. "In terms of total sales, the company has seen a rigorous decline from year 2020 to 2021, and also it declined in the year 2022."
4. "In terms of new + past users, there has been an increase in the year 2022 from the year 2021. But year 2020 had the most number of customers"
5. "By ordertype the household category has seen an increase in the number of customers from the year 2021."

-- Identify the total decline, if any, within the total sales amount on an year by year basis. 
-- Comment on whether we need to launch a campaign for the consumers based on the recent pattern. 
-- What campaign type will be more appropriate for this scenario out of all the predefined campaign types?


" below code is for year on year growth analysis "
with yoy_amount as 
(select year(purchasedate) as year, sum(quantity*purchasingamt) as total_amount
from project_db.customertransactiondata
group by year(purchasedate)
order by year),

previous_year_amount as 
(select year, 
lag(total_amount) over (order by year) as previous_year
from yoy_amount)

select yoy_a.year, yoy_a.total_amount,
(total_amount - previous_year)/previous_year *100 as yoy_growth
from yoy_amount yoy_a 
join previous_year_amount pya 
on yoy_a.year = pya.year 
order by year;

" below code is for campaign wise sales analysis for each year "
with campaign_sales as 
(select year(cd.purchasedate) as year, c.campaigntype, 
sum(cd.quantity * cd.purchasingamt) as total_sales 
from project_db.customertransactiondata as cd 
join project_db.campaign c
on cd.campaign_id = c.campaign_id
group by year(cd.purchasedate), c.campaigntype
order by year, total_sales desc)

select *
from 
(select *, 
dense_rank() over (partition by year order by total_sales desc) as campaign_sales_rank
from campaign_sales
order by year ) t1 
where t1.campaign_sales_rank = 1


"Recommendation" : 
1. "Brand-Awareness, Product-Launch and Seasonal-Push are major drivers of sales"
2. "In year 2020, the sales due to brand-awareness was all time high, but due to covid people were mostly at homes.
that can be a major driver of sales"
3. "Based on above analysis Brand-Awareness can act as major driver of sales if executed properly"


-- SECTION 4 -- Market Basket Analysis

-- A market basket analysis is defined as a customer’s overall buying pattern of different sets of products.
-- Essentially, the marketing team wants to understand customer purchasing patterns. 
-- Their proposal is if they promote the products in their next campaign, which are bought a couple of times 
-- together, then this will increase the revenue for the company.

-- Identify the dates when the same customer has purchased some product from the company outlets.

with transaction_table as 
(select
date_format(purchasedate, "%d-%m-%Y") as purchase_date,
trans_id, cust_id, item_id
from project_db.customertransactiondata)

select purchase_date, cust_id, group_concat(item_id) as item
from transaction_table
group by purchase_date, cust_id
having count(item_id) > 1
order by purchase_date;


-- Out of the above analysis, identifying the same combination of products coming at least thrice sorted 
-- in descending order of their appearance.

select cd1.OrderType, concat_ws(",", cd1.item_id, cd2.item_id) as item_combination, 
count(*) as total_transaction
from project_db.customertransactiondata cd1 
join project_db.customertransactiondata cd2 
on cd1.cust_id = cd2.cust_id
where cd1.trans_id != cd2.trans_id
and cd1.OrderType = cd2.OrderType
and cd1.item_id != cd2.item_id
group by cd1.OrderType, concat_ws(",", cd1.item_id, cd2.item_id)
having total_transaction >= 3
order by total_transaction desc;


"Obervation:"
1. "Item 16 and Item 13, Item 9 and Item 45, Item 14 and Item 35 are being bought frequently together amongst different sectors."
2. "Especially in households, we have seen quite a good demand for these products."
3. "We can try to promote all the 3 in the household sector and the first combination in all the sectors."