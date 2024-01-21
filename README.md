# GOOGLE DATA ANALYTICS CAPSTONE PROJECT: CYCLISTIC CASE STUDY
Course: [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)

## INRODUCTION
The Google Data Analytics Capstone project, focused on the Cyclistic Case Study, involves leveraging data analytics techniques to gain insights and make informed decisions. This comprehensive study likely explores various aspects of Cyclistic's operations, utilizing Google's data analytics tools to draw meaningful conclusions and recommendations for the organization.
In this case study, I will perform many real-world tasks of a junior data analyst at a fictional company, Cyclistic. To answer the key business questions, I will follow the steps of the data analysis process: Ask, Prepare, Process, Analyze, Share, and Act.

### QUICK LINKS
Data Source: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)

### SQL QUERY:
[Cyclistic Bike SQL query](https://github.com/Kaystevee/Cyclistic-Bike-share-Analysis/blob/main/Cyclistic-Bike-share-Analysis%20SQL%20Query.sql)

### DATA VISUALIZATION
![Cyclistic Bike Dashboard](https://github.com/Kaystevee/Cyclistic-Bike-share-Analysis/assets/111535799/1c05210d-1440-4ef9-b815-b3ff724bea22)

## BACKGROUND
### CYCLISTIC
A bike-share initiative boasting an extensive fleet of over 5,800 bicycles and 600 docking stations, Cyclistic distinguishes itself by offering a diverse range of options, including reclining bikes, hand tricycles, and cargo bikes. This inclusive approach accommodates individuals with disabilities and those who prefer alternatives to the standard two-wheeled bike. While the majority of users opt for traditional bikes, approximately 8% utilize the available assistive options. Cyclistic attracts a user base that predominantly enjoys biking for leisure, with approximately 30% utilizing the service for daily commuting.

Historically, Cyclistic focused on building broad awareness and targeting diverse consumer segments in its marketing strategy. The company achieved this through flexible pricing plans, including single-ride passes, full-day passes, and annual memberships. Casual riders, who opt for single-ride or full-day passes, constitute one segment, while annual members form another.

Analysis by Cyclistic’s finance team reveals that annual members contribute significantly more to profitability compared to casual riders. Despite the effectiveness of the current pricing model in attracting a diverse customer base, Moreno, the director of marketing, emphasizes the importance of maximizing annual memberships for future growth. Instead of targeting entirely new customers, Moreno sees an opportunity to convert existing casual riders into annual members. Given that casual riders are already familiar with Cyclistic, having chosen the program for their mobility needs, Moreno sets a strategic goal: to design marketing initiatives specifically aimed at converting casual riders into annual members.

To achieve this goal, the marketing analyst team aims to delve into the differences between annual members and casual riders, understand the motivations behind casual riders opting for a membership, and explore how digital media can enhance their marketing strategies. Moreno and her team intend to leverage historical bike trip data from Cyclistic to identify trends and insights that will inform the development of effective conversion strategies.

### SCENARIO
I am assuming to be a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve our recommendations, so they must be backed up with compelling data insights and professional data visualizations.

## ASK
### BUSINESS TASK
Devise marketing strategies to convert casual riders to members.
### ANALYSIS QUESTION
Three questions will guide the future marketing program:  
1. How do annual members and casual riders use Cyclistic bikes differently?  
2. Why would casual riders buy Cyclistic annual memberships?  
3. How can Cyclistic use digital media to influence casual riders to become members?  

Moreno has assigned me the first question to answer: How do annual members and casual riders use Cyclistic bikes differently?
## PREPARE
### DATA SOURCE
I will use Cyclistic’s historical trip data to analyze and identify trends from Jan 2022 to Dec 2022 which can be downloaded from [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). The data has been made available by Motivate International Inc. under this [license](https://www.divvybikes.com/data-license-agreement).  
  
This is public data that can be used to explore how different customer types are using Cyclistic bikes. But note that data-privacy issues prohibit from using riders’ personally identifiable information. This means that we won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.
### DATA ORGANIZATION
There are 12 files with the naming convention of YYYYMM-divvy-tripdata and each file includes information for one month, such as the ride id, bike type, start time, end time, start station, end station, start location, end location, and whether the rider is a member or not. The corresponding column names are ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng and member_casual.

## Process PROCESS
SQL(SSMS) is used to combine the various datasets into one dataset and clean it.    
Reason:  
A worksheet can only have 1,048,576 rows in Microsoft Excel because of its inability to manage large amounts of data. Because the Cyclistic dataset has more than 4.2 million rows, it is essential to use a platform like SQL that supports huge volumes of data.

## ANALYZE AND SHARE
### SQL Query: [Data Analysis](https://github.com/Kaystevee/Cyclistic-Bike-share-Analysis/blob/main/Cyclistic-Bike-share-Analysis%20SQL%20Query.sql)
### Data Visualization:[Cyclistic Bike Dashboard](https://github.com/Kaystevee/Cyclistic-Bike-share-Analysis/assets/111535799/1c05210d-1440-4ef9-b815-b3ff724bea22)

The data is stored appropriately and is now prepared for analysis. I queried multiple relevant tables for the analysis and visualized them in Power BI.  
The analysis question is: How do annual members and casual riders use Cyclistic bikes differently?  

First of all, member and casual riders are compared by the type of bikes they are using.

## SUMMARY:
  
|Casual|Member|
|------|------|
|Prefer using bikes throughout the day, more frequently over the weekends in summer and spring for leisure activities.|Prefer riding bikes on weekdays during commute hours (8 am / 5 pm) in summer and spring.|
|Travel 2 times longer but less frequently than members.|Travel more frequently but with shorter rides (approximately half of the casual riders' trip duration).|
|Start and end their journeys near parks, museums, along the coast, and other recreational sites.|Start and end their trips close to universities, and residential and commercial areas.|  
  
## ACT
After identifying the differences between casual and member riders, marketing strategies to target casual riders can be developed to persuade them to become members.  
Recommendations:  
1. Marketing campaigns might be conducted in spring and summer at tourist/recreational locations popular among casual riders.
2. Casual riders are most active on weekends and during the summer and spring, thus they may be offered seasonal or weekend-only memberships.
3. Casual riders use their bikes for longer durations than members. Offering discounts for longer rides may incentivize casual riders and entice members to ride for longer periods.



