CREATE DATABASE IF NOT EXISTS walmart_project ;
use walmart_project ;

CREATE TABLE walmart(
invoice_id VARCHAR(100) NOT NULL PRIMARY KEY,
branch VARCHAR(100) NOT NULL,
city VARCHAR(100) NOT NULL,
customer_type VARCHAR(100) NOT NULL,
gender VARCHAR(100) NOT NULL,
product_line VARCHAR(100) NOT NULL,
unit_price DECIMAL(10,2) NOT NULL,
quantity INT(20) NOT NULL,
vat FLOAT(6,4) NOT NULL,
revenue DECIMAL(12, 4) NOT NULL,
date DATE NOT NULL,
time TIME NOT NULL,
payment VARCHAR(100) NOT NULL,
rating FLOAT(5, 1)
);
select * from walmart;
SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
select @@secure_file_priv ;

LOAD DATA INFILE 
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Walmart_data.csv'
INTO TABLE walmart
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;
select * from walmart ;

-------- Adding  feature ---------
select date , monthname(date) as month_name from walmart ;
select date , dayname(date) as day_name from walmart;

 set sql_safe_updates = 0;
 
alter table walmart
add column day_name varchar(20) ,
add column month_name varchar(20);

update walmart 
set month_name = monthname(date) ;

update walmart 
set day_name = dayname(date) ;

select * from walmart ;

----- time_of_day----------
select time ,( case
          when time between "00:00:00" and '12:00:00' then 'Morning'
          when time between "12:01:00" and '16:00:00' then 'Afternoon'
          else 'Evening' 
           end  ) as time_of_day from walmart ;
           
           
 alter table walmart 
 add column time_of_day varchar (20); 
 
 update walmart 
 set time_of_day = ( case
          when time between "00:00:00" and '12:00:00' then 'Morning'
          when time between "12:01:00" and '16:00:00' then 'Afternoon'
          else 'Evening' 
           end  ) ;
           
           
           
---------------------------------------------------------------------------------------------------
        
           


------------------------------ EDA------------------


##### A. Sales and Revenue Analysis
    
    
# 1.What is the total sales revenue (total) generated per branch?
select branch , sum(revenue) as revenue from walmart
group by branch ;


#2.Which city has the highest sales revenue?
select city , sum(revenue) as revenue from walmart
group by city
order by revenue desc limit 1 ;


# 3. Which product line is the most expensive?
select product_line , unit_price from walmart
order by unit_price desc limit 1;



#4.What is the total tax collected (Tax) across different  cities?
select city, sum(vat) as tax from walmart
group by city ;



# 5.Number of sales made in each time of the day per weekday
select day_name , time_of_day , sum(revenue) as Total_sales from walmart 
group by day_name , time_of_day order by 1 asc ;



# 6.Identify the customer type that generates the highest revenue.
select customer_type , sum(revenue) as revenue from walmart
group by customer_type order by revenue desc limit 1;



# 7.Which city has the largest tax percent/ VAT (Value Added Tax)?
select city , sum(vat) as revenue from walmart
group by 1 order by 2 desc limit 1;



# 8.Which customer type pays the most VAT?
select customer_type , sum(vat) as vat from walmart 
group by customer_type order by vat desc limit 1;

-------------------------------------------------------------------------------------------


#####  B. Customer Demographics and Behavior


#1.How many unique customer types does the data have?
select count(distinct customer_type) from walmart;



#2.How many unique payment methods does the data have?
select count(distinct payment) as payment_count from walmart;



## 3.Which is the most common customer type?
select customer_type ,count( customer_type)as customer_count from walmart
group by customer_type order by 2 desc LIMIT 1 ; 




# 5.Which customer type buys the most?
SELECT customer_type ,count(invoice_id) as product_count from walmart
group by customer_type order by 2 desc limit 1;



#6.What is the gender of most of the customers?
select gender ,count(gender) as gender_count from walmart
group by gender order by 2 desc limit 1; 



# 7.What is the gender distribution per branch?
select branch, gender, count(gender) as gender_count from walmart
group by branch,gender order by 1,2 ;


 
 #8. What is the top gender distribution per branch?
select branch,gender, rk from(
select branch, gender ,count(gender),
rank() over( partition by branch order by count(gender) desc ) as rk from walmart
group by branch , gender) as sub_query
where rk = 1
 ;





# 9.Which time of the day do customers give most ratings per branch?
select branch, time_of_day , rating_count, rating_rank from (
select branch ,time_of_day , count(rating) as rating_count , rank()over(partition by branch order by count(rating) desc) as rating_rank
from walmart 
group by branch , time_of_day ) as subquery
where rating_rank =1
 ;



# 10.Which day has the best avg ratings?
select day_name , avg(rating) from walmart
group by  1 order by 2 desc limit 1 ;

  



# 11.Which day of the week has the best average ratings per branch? 
select branch,day_name,av_rating,av_rank from
(select branch, day_name, avg(rating) as av_rating,
rank()over(partition by branch order by avg(rating) desc) as av_rank from walmart
group by branch,day_name) as sub_query
where av_rank = 1
 ;



# 13.Does the gender (gender) of customers affect purchase patterns? For example, do male or female customers tend to buy certain product lines more often?
select product_line , gender ,sum(quantity) as total_quantity_sold, count(*) as number_of_purchases , 
Round((count(*)/(select count(*) from walmart )*100),2) as percantage_of_total_quantity
from walmart 
group by 1,2 order by product_line
;




#14.How do payment methods (e.g., credit card, cash) vary by customer type, city, or product line?
select customer_type , City, product_line , payment, count(payment) as count ,
round(( count(payment)/(select count(payment) from walmart )*100),2) as payment_count_percentages  from walmart 
group by customer_type , City, product_line ,4 order by 1,2,3,4 desc;

-------------------------------------------------------------------------------------------------------------

########C. Product Line and Quantity Analysis


# 1.How many city product lines are there in the dataset?
select count(distinct city) from walmart;



# 2.What is the most common payment method?
select payment , count(payment) from walmart
group by payment order by 2 desc limit 1;



# 3.What is the most selling product line?
select product_line , count(product_line) from walmart
group by product_line order by 2 desc limit 1 ; 



# 4.What is the total revenue by month?
select month_name, count(month_name) from walmart 
group by month_name order by 2 ;



# 6.Which product line generated the highest revenue?
 select product_line, sum(revenue) from walmart 
 group by 1 order by 2 desc limit 1;
 
 
 
# 7.Which city has the highest revenue?
 select city, sum(revenue) from walmart 
 group by 1 order by 2 desc limit 1;



# 8.Which product line incurred the highest VAT?
 select product_line, sum(vat) from walmart 
 group by 1 order by 2 desc limit 1;
 
 
 
# 9.Retrieve each product line and add a column product_category, indicating 'Good' or 'Bad,' based on whether its Rating are above the average.
select avg(rating) from walmart ;
alter table walmart 
add column product_category varchar(20);

select rating ,( case
        when rating < (select avg(rating) from walmart) then "Bad"
        else "Good"
        end

) from walmart ;

---- add values
update walmart 
set product_category = ( case
        when rating < 6.97270 then "Bad"
        else "Good"
        end );
        
 select product_line , sum(revenue)  , product_category from walmart
 group by 1,3 order by 2 desc limit 1;
 
 

# 10.Which branch sold more products than average product sold?
select branch , sum(quantity) as quantity_count from walmart 
where quantity > ( select avg(quantity) from walmart )
group by branch order by 2 desc limit 1;



 # 11.What is the most common product line by gender?
 select gender , product_line , most_common_product , rk  from 
 ( select gender , product_line , count(product_line) as most_common_product, rank() over (partition by gender  order by count(product_line) desc) as rk
 from walmart group by gender, product_line )as sq
 where rk = 1
 ;
 

 
 
# 12.What is the average rating of each product line?
select product_line , avg(rating) as avg_rating from walmart 
group by product_line ;




# 13.Which product_line has the highest number of units sold (Quantity)?
select product_line ,sum(quantity) from walmart
group by  product_line order by 2 desc limit 1  ;
 
---------------------------------------------------------------------------------------------------


###D. Time-Based Analysis
# 1.Which Month has the highest sales?
select month_name ,sum(revenue) from walmart
group by month_name order by 2 desc limit 1; 




# 2.What are the busiest days of the week for each branch? (Aggregate sales by day).
select branch , day_name, per_day_sales,rk from 
(select branch , day_name , sum(revenue) as per_day_sales,
rank() over(partition by branch order by sum(revenue) desc) as rk
from walmart 
group by 1,2) sub_query 
where rk=1
;



# 3.How do sales vary across different times of the day (time_of_day)? For example, are there more sales in the morning, afternoon, or evening?
select time_of_day , sum(revenue) from walmart 
group by 1 order by 2 desc ;


--------------------------------------------------------------------------------------------------------

##### E. Branch and City-Level Comparisons


# 1.Which Branch has the highest average customer rating (rating)?
select branch , avg(rating) from walmart 
group by 1 order by 2 desc limit 1;



# 2.How do product preferences differ across cities? For example, are certain product lines more popular in one city than another?
select city , product_line , sales_quantity , rk from 
(select city, product_line, sum(quantity) as sales_quantity ,
rank() over(partition by city order by sum(quantity) desc ) as rk
from walmart 
group by 1,2) sub_query 
where rk=1
 ;


--------------------------------------------------------------------------------

### F. Payment Method Analysis 

# 1 Which payment method is the most popular?
select payment , count(rating) from walmart 
group by 1 order by 2 desc limit 1;



# 2.Does the choice of payment method differ by gender ?
 select gender, payment , count(*) from walmart
 group by 1,2 order by 2,3 desc ;


---------------------------------------------------------------------------

# G. Rating and Satisfaction

# 1. What is the average of rating values across all products?
select product_line , avg(rating) from walmart 
group by product_line;



# 2.Which product lines have the highest and lowest average rating?
 select product_line , max(rating) as max_rating , min(rating) as min_rating from walmart
 group by product_line  order by 2 desc, 1 asc ;

















