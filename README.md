# Walmart-sales-analysis-sql-dashboard-project
***

## About
We are conducting an analysis of Walmart's sales data to identify top-performing branches and products, assess sales trends across different product categories, and gain insights into customer behavior. The main goal is to enhance and optimize sales strategies.

The dataset for this project is derived from the Walmart Sales Forecasting Competition on Kaggle.

## Purposes of the Project
The main goal of this project is to gain understanding from Walmart's sales data, exploring the various factors that influence sales across different branches.Finally, Visualizing them using power bi and find out important insights.

## About Data
This project's data was obtained from the Kaggle Walmart Sales Forecasting Competition and it encompasses sales transactions from three Walmart branches situated in Mandalay, Yangon, and Naypyitaw, respectively.
The data contains 14 columns and 1000 rows:
| Column            | Description                                   | Data Type        |
|-------------------|-----------------------------------------------|------------------|
| invoice_id        | Invoice of the sales made                     | VARCHAR(100)      |
| branch            | Branch at which sales were made               | VARCHAR(100)       |
| city              | The location of the branch                    | VARCHAR(100)      |
| customer_type     | The type of the customer                       | VARCHAR(100)      |
| gender            | Gender of the customer making purchase        | VARCHAR(100)      |
| product_line      | Product line of the product sold               | VARCHAR(100)     |
| unit_price        | The price of each product                     | DECIMAL(10, 2)   |
| quantity          | The amount of the product sold                 | INT              |
| VAT               | The amount of tax on the purchase             | FLOAT(6, 4)      |
| total             | The total cost of the purchase                | DECIMAL(12, 4)   |
| date              | The date on which the purchase was made       | DATETIME         |
| time              | The time at which the purchase was made       | TIME             |
| payment           | The total amount paid                         | DECIMAL(10, 2)   |
| rating            | Rating                                        | FLOAT(2, 1)      |




***


### *** 2.	Feature Adding ***

This will help use generate some new columns from existing ones.
- Add a new column named time_of_day to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day most sales are made.
- Add a new column named day_name that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each branch is busiest.
- Add a new column named month_name that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.


 ***
 
 ## ***Exploratory Data Analysis (EDA)***

Conducting exploratory data analysis is essential to address the project's listed questions and objectives.

### A. Sales and Revenue Analysis

1. What is the total sales revenue (total) generated per branch? 

2. Which city has the highest sales revenue?

 3 Which product line is the most expensive?

4. What is the total tax collected (Tax) across different branches or cities?

5. Number of sales made in each time of the day per weekday

6. Identify the customer type that generates the highest revenue.

7. Which city has the largest tax percent/ VAT (Value Added Tax)?

8. Which customer type pays the most VAT?

***

### B. Customer Demographics and Behavior

1. How many unique customer types does the data have?

2. How many unique payment methods does the data have?

3. Which is the most common customer type?

5. Which customer type buys the most?

6. What is the gender of most of the customers?

7. What is the gender distribution per branch?

8. What is the gender distribution per branch?

9. Which time of the day do customers give most ratings per branch?

10. Which day has the best avg ratings?

11. Which day of the week has the best average ratings per branch?

12. How do customer_types (e.g., new vs. returning) impact sales? Do returning customers spend more than new customers?

13. Does the gender (gender) of customers affect purchase patterns? For example, do male or female customers tend to buy certain product lines more often?

14. How do payment methods (e.g., credit card, cash) vary by customer type, city, or product line?
***

### C. Product Line and Quantity Analysis

1. How many distinct product lines are there in the dataset?

2. What is the most common payment method?

3. What is the most selling product line?

4. What is the total revenue by month?

5. Which month recorded the highest Cost of Goods Sold (COGS)?

6. Which product line generated the highest revenue?

7. Which city has the highest revenue?

8. Which product line incurred the highest VAT?

9. Retrieve each product line and add a column product_category, indicating 'Good' or 'Bad,' based on whether its sales are above the average.

10. Which branch sold more products than average product sold?

11. What is the most common product line by gender?

12. What is the average rating of each product line?

13. Which product_line generates the highest total revenue? Which one has the highest number of units sold (Quantity)?



***

### D. Time-Based Analysis

1. Which Month has the highest sales?

2. What are the busiest days of the week for each branch? (Aggregate sales by day).

3. How do sales vary across different times of the day (time_of_day)? For example, are there more sales in the morning, afternoon, or evening?

***

### E. Branch and City-Level Comparisons

1. Which Branch has the highest average customer rating (rating)?

2. How do product preferences differ across branches or cities? For example, are certain product lines more popular in one city than another?


***

### F. Payment Method Analysis

1. What is the distribution of payment methods used? Which payment method is the most popular?

2. Does the choice of payment method differ by gender or customer_type?

3. Are there differences in total sales based on payment methods?

*** 

### G. Rating and Satisfaction

1. What is the distribution of rating values across all products?

2. Which product lines have the highest and lowest average rating?



---------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------


***

## Walmart Sales Insights Analysis By Power BI

Dashboard Link : https://app.powerbi.com/groups/me/reports/d2bbe380-e01b-448a-baad-0b8426e77764/ReportSection?experience=power-bi

### Overview
This dashboard gives an intarective visualizaton with important insights.
By this a decision maker could take his business decision.

### objective 
The primary goals of this project is to help decision maker to take his
decision based on business evulations patterns which can easily make from
dashboard presentation. 

### Dashboard Insights

- Key Performance Indicators (KPIs): 
  Total Revenue, Total Quantity,Total vat, Total rating
- Sum of revenue by city
- Sum of revenue by Product_line
- Sum of revenue by payment 
- Sum of revenue by customer_type and gender
- Sum of revenue by day
- Sum of revenue by day and customer_type( comparison between customer_type)
- Filter options for deep drives.
- Male and female separate view.

### Findings

- Total Revenue, Total Quantity,Total vat, Total rating (Based on gender)
- Most buying product by male is 'Heath and beauty' following by 'Electronic accessories' , 'Sports and travel', 'Fashion accessories', 'Home and lifestyle'
  'Food and beverages'. Most buying product by Female is 'Food and beverages' following by 'Fashion accessories','Home and lifestyle','Sports and travel',
   'Electronic accessories', 'Heath and beauty'
- Top payment gateway is cash(34.74%) following by Ewallet(34.06) and Credit card(31.2%)
- Sum of revenue for Normal customer (Female = 80K and Male= 79K) and Sum of revenue for Member customer (Female = 88K and Male = 76k )
- Comparison of revenue beetwen Cutomer_type (Normal and Member) regarding day


## Conclusion
  


