# Retail Sales & Financial Performance Analytics

An end-to-end data analytics project analyzing retail sales, profitability, customer behavior, product performance, regional trends, and discount impact using Excel, SQL, Python, and Power BI.

## Project Overview

This project analyzes the Superstore retail dataset to understand:

- What is driving sales and profitability?
- Which categories, products, and regions perform best?
- Where is the business losing money?
- How do discounts affect profitability?
- What customer and order patterns can be identified?
- What actionable insights can support better business decisions?

The project follows an end-to-end analytics workflow:

Raw Data → Data Cleaning → Exploratory Analysis → SQL Analysis → Business Insights → Power BI Dashboard

## Business Problem

Retail businesses generate large volumes of sales and customer transaction data, but raw data alone does not clearly show where revenue is being generated, where profitability is declining, or which business areas require attention.

This project uses retail transaction data to identify performance patterns and convert them into actionable business insights.

## Objectives

- Analyze overall sales and profitability.
- Identify high-performing and loss-making products.
- Compare category, sub-category, segment, and regional performance.
- Analyze customer and order behavior.
- Understand the relationship between discounts and profitability.
- Identify sales and profit trends over time.
- Develop an interactive Power BI dashboard for decision support.

## Dataset Overview

The project uses the Superstore retail dataset containing 9,994 transaction records and 21 attributes covering orders, customers, products, sales, discounts, and profit.

### Key Data Fields

- Order & Shipping Details
- Customer Information
- Product & Category Information
- Geographic Information
- Sales & Quantity
- Discount
- Profit

### Analysis Period

January 2014 – December 2017

The dataset was used as the single source for Excel, SQL, Python, and Power BI analysis to maintain consistency across the complete analytics workflow.

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Microsoft Excel | Data cleaning, KPI analysis, pivot tables, and financial analysis |
| SQL (MySQL) | Data validation, business queries, aggregations, ranking, and trend analysis |
| Python | Data cleaning, exploratory data analysis (EDA), statistical analysis, and visualization |
| Power BI | Interactive dashboard, DAX measures, KPI tracking, and business reporting |
| GitHub | Project version control and portfolio documentation |

### Technical Skills Demonstrated

- Data Cleaning & Validation
- Exploratory Data Analysis (EDA)
- KPI & Financial Analysis
- SQL Querying
- DAX & Data Modeling
- Data Visualization
- Business Intelligence
- Business Problem Solving
- Insight Generation

## Key Performance Indicators (KPIs)

| KPI | Result |
|---|---:|
| Total Sales | $2.30M |
| Total Profit | $286.40K |
| Profit Margin | 12.47% |
| Total Orders | 5,009 |
| Total Customers | 793 |
| Total Quantity | 37,873 |
| Average Order Value | $458.61 |
| Average Discount | 15.62% |
| Average Units per Order | 7.56 |
| Profit per Order | $57.18 |

These KPIs provide a high-level view of overall business performance and serve as the foundation for deeper product, customer, regional, and profitability analysis.

## Analysis Performed

The project follows a structured end-to-end analytical workflow.

### Excel Analysis

- Data validation and cleaning
- KPI calculation
- Category and sub-category analysis
- Regional and segment analysis
- Profitability analysis
- Discount analysis
- Pivot-based business analysis

### SQL Analysis

- Data quality and duplicate checks
- Overall sales and profit analysis
- Category, region, segment, and sub-category analysis
- Monthly and yearly performance analysis
- Discount vs profitability analysis
- Top and loss-making product analysis
- Customer ranking and customer value analysis
- Year-over-Year (YoY) growth analysis
- Ranking using RANK() and PARTITION BY
- Trend analysis using LAG() and CTEs

### Python Analysis

- Data loading and inspection
- Data quality assessment
- Exploratory Data Analysis (EDA)
- Sales and profit analysis
- Customer and product analysis
- Time-series analysis
- Discount and profitability analysis
- Correlation analysis
- Data visualization

### Power BI Analysis

- Data modeling
- Date table and relationships
- DAX measures
- KPI dashboard
- Sales and profit trend analysis
- Category, region, and sub-category analysis
- Interactive slicers
- Business insights and recommendations

## Key Business Insights

The analysis identified several important business patterns:

- Technology is the strongest contributor to overall sales and profit.
- Furniture generates approximately $742K in sales, but its profit margin is only 2.49%, indicating a profitability concern despite strong revenue.
- Tables are a major loss-making sub-category, generating approximately $17.73K in losses.
- West Region leads in sales and has a 14.94% profit margin.
- Home Office has the highest segment-level profit margin at approximately 14.03%.
- Higher discount levels are associated with lower profitability, highlighting the need for better discount management.
- Product-level analysis helps identify items generating strong revenue but relatively weak or negative profit.

These findings demonstrate that high sales do not necessarily translate into high profitability and that profitability should be evaluated alongside revenue when making business decisions.

## Business Recommendations

Based on the analysis, the following areas should be considered for management review:

1. Review discount strategy  
   Evaluate high-discount transactions and establish discount levels that protect profitability.

2. Improve Furniture profitability  
   Investigate pricing, discounting, and product-level performance within Furniture, particularly low-margin sub-categories.

3. Address loss-making products  
   Review pricing, costs, discounts, and demand for products generating negative profit.

4. Focus on profitable growth  
   Identify high-margin products, segments, and regions that can support sustainable revenue growth.

5. Monitor revenue and profitability together  
   Track both sales growth and profit margin rather than using revenue alone as the primary performance indicator.

6. Strengthen customer analysis  
   Monitor repeat customers, customer value, and order behavior to identify opportunities for retention and growth.

## Project Structure

```text
Retail_Sales_Analytics/
│
├── README.md
│
├── Dataset/
│   └── Superstore.csv
│
├── Excel/
│   └── Retail_Sales_Financial_Analytics.xlsx
│
├── SQL/
│   └── retail_analytics_sql.sql
│
├── Python/
│   └── Retail_Sales_Analysis.ipynb
│
└── PowerBI/
    └── Retail_Sales_Analysis Power BI.pbix


