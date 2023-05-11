# group-8-analysis
## A final group project for the UNC Chapel Hill Data Analytics and Visualization Boot Camp 
Python/Pandas, Jupyter Notebook, SQL, Postgres/pgAdmin4, ![QuickDBD](https://www.quickdatabasediagrams.com), Tableau Public

![Data sourced from a database of U.S. temperature outliers from 1943-2013 collected from NOAA](https://data.world/carlvlewis/u-s-weather-outliers-1964)

Stefan Williams, Eric Cregger, and Lucy Harris

## Segment 1: Sketch It Out
#### The purpose of this first segment/project deliverable is to sketch out our overall question by determining what question we wish to ask our dataset. From there, we will use the various skills in data analytics and visualization we have honed over this course to create a prototype. 

#### This prototype will include a draft of a machine learning model to train/employ using Pandas and Jupyter Notebook. This will be connected to a database created within Postgres that holds the tables with the cleaned/organized data we will end up performing our analysis on. A dashboard created within Tableau will serve as a collection of visualizations that explores the question we have asked our data in a presentable and readable format. 

![Originaldata](https://i.gyazo.com/f8c86887f8fb4e7d4504196c7d69712e.png)
#### When reading the original data, the relevant columns for the weather anomalies lie in how "degrees_from_mean", "max_temp", and "min_temp" relate to the "type" column. The "type" column falls under four categories of description for the outlier: "Weak Hot", "Weak Cold", "Strong Hot", and "Strong Cold". How do these factors contribute to a weather anomaly being described as one of these types and can a machine learning model accurately group and predict a classification? 
