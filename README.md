# group-8-analysis
## A final group project for the UNC Chapel Hill Data Analytics and Visualization Boot Camp 

Python/Pandas/SQLAlchemy, Jupyter Notebook, SQL, Postgres/pgAdmin4, [QuickDBD](https://www.quickdatabasediagrams.com), Tableau Public

[Data sourced from a database of U.S. temperature outliers from 1943-2013 collected from NOAA](https://data.world/carlvlewis/u-s-weather-outliers-1964)

[Resource referenced for execution of the c.execute function](https://mungingdata.com/sqlite/create-database-load-csv-python/)

A collaboration between Stefan Williams, Eric Cregger, and Lucy Harris utilizing GitHub, Slack, and Zoom for communication and cooperation. 

## Segment 1: Sketch It Out

#### The purpose of this first segment/project deliverable is to sketch out our overall question by determining what question we wish to ask our dataset. From there, we will use the various skills in data analytics and visualization we have honed over this course to create a prototype. 

#### The topic chosen for our project is based on a dataset of temperature/weather anomalies aggregated from reported records across the United States. 

#### This topic was chosen because of the variety of the dataset (over 3 million records from 1964-2013, lots of different time periods and stations to filter/choose from, can focus on strong/weak anomalies, hot/cold anomalies) as well as the neutrality of weather (relatable to everyone, not very specific of a topic in practice). This allows for a variety of analyses/visualizations to be performed on the data depending on what we’re looking for.

#### The dataset is sourced from Carl V. Lewis on the data.world website, the data is sourced from the National Oceanic and Atmospheric Administration, and the source dataset analysis was performed with Enigma.io calculations.
> "Each entry represents a report from a weather station with high or low temperatures that were historical outliers within that month, averaged over time."

#### This prototype will include a draft of a machine learning model to train/employ using Pandas and Jupyter Notebook. This will be connected to a database created within Postgres that holds the tables with the cleaned/organized data we will end up performing our analysis on. A dashboard created within Tableau will serve as a collection of visualizations that explores the question we have asked our data in a presentable and readable format. 

#### There are many questions that can be asked about this data that go beyond machine learning. Which stations reported the most temperature outliers? Which years within a specific decade have the most amount of temperature outliers? Are there more hot or cold outliers? What are the highest/lowest degrees from mean? Where are the most outliers located (within a certain time span)? Are there more weak or strong outliers? Which specific outlier is the most common?


![Originaldata](https://i.gyazo.com/f8c86887f8fb4e7d4504196c7d69712e.png)
#### When reading the original data, the relevant columns for the weather anomalies lie in how "degrees_from_mean", "max_temp", and "min_temp" relate to the "type" column. The "type" column falls under four categories of description for the outlier: "Weak Hot", "Weak Cold", "Strong Hot", and "Strong Cold". How do these factors contribute to a weather anomaly being described as one of these types and can a machine learning model accurately group and predict a classification? There doesn't seem to be a definite filter or range on how the type is labeled, which is what we wish to explore. 

![schema](https://i.gyazo.com/c81c6d25afe7da9f192b3e1b5e86487e.png)
#### A provisional database was created using Postgres to hold two tables separating our data, "stations" and "weather". This will likely be the same database used to connect to the machine learning model to the data. The stations table holds each station's name, unique ID, as well as longitude and latitude. The weather table holds serial IDs (basically an index), the same station ID key, date, degrees of the anomaly away from the mean temperature, maximum temperature, minimum temperature, and the "type" of anomaly as described before.

![erd](https://github.com/swilli73/group-8-analysis/blob/database/Database_Draft.png?raw=true)
#### An ERD of the drafted database was created to show relationships between the two tables. As of right now, they only share the key of the "id" column. The ID of each station is not unique to the data, and often repeats, but is strictly unique to each station and is therefore used to identify a weather outlier's location and station recorded from.


![3d](https://i.gyazo.com/a35c6a8d76471a36b1352ae6f2b9bdd1.png) ![legend](https://i.gyazo.com/f9574838888a1717d08bbc69076f05b7.png)


#### The provisional machine learning model will utilize an unsupervised model format using a clustering algorithm. The database created previously is to be connected to Jupyter Notebook using SQLAlchemy through an SQLite file, then converted into a DataFrame and explored from there. For the purpose of creating a provisional model, data was read in through a CSV file and a 3d plot was created to see the relationships between the "max_temp", "min_temp", "degrees_from_mean" columns to the initial 4 classifications of temperature anomalies.

#### The goal is to test whether our model can classify weather anomalies as either "Weak Hot", "Weak Cold", "Strong Hot", or "Strong Cold" as they are classified in the original dataset. After exploring and preprocessessing the data, the model should be able to visualize the trends and relationships of these classifications and what may contribute to them being labeled as such. 

## Segment 2: Build and Assemble

#### Now that we have a base idea for where our project is going, the next step is to implement our plans. We have decided to trim down the original database containing over 3,000,000 entries across the U.S. into just stations reporting from North Carolina, which brings the rows down to about 90,000. This keeps the data relevant to us (as NC residents), brings up a point of focus for our project, as well as drastically reduces the file size of the data which allows for quicker processing and sharing.

#### An ETL process was performed on the data to load in the original dataset, process it to only include NC stations, create a SQLite database utilizing this new data, and export it. The "data" folder in this branch contains the exported files. This allows for the data to be shared beyond a Postgres database.

![etl1](https://i.gyazo.com/e65db4b5946d3f5199fcb7ee51285e61.png)

> Using GeoPandas, confirmation was first done to verify that all of the records were within the U.S. and its territories.

![etl2](https://i.gyazo.com/a9c58154bfd18a2a263afda253d256aa.png)

> The data was then limited to NC by cutting down the initial USA shapefile.

![etl3](https://i.gyazo.com/5bef40aa34f75ecf29aa99ea09e01e79.png)

> After performing a join of the station data with the NWS shapefile to pull in states for each station, a plot was created to visualize the NC stations on its map.

![etl4](https://i.gyazo.com/8dc125371dfa9ccb972603f42514044e.png)

> A new DataFrame now holds only NC stations. 

#### Now that the data has been trimmed down, the next step is to create the SQLite database and perform exports. 

![etl5](https://i.gyazo.com/3bb3b18f0fd846e33cc7360e62d57bb4.png)

> Analysis.db is the file that will be used to connect the data to the machine learning model. Using SQLAlchemy (through SQLite3), the tables of the database were created.

![etl6](https://i.gyazo.com/4bb34e49e3a09fe3dc36d11cc705f154.png)
![etl7](https://i.gyazo.com/225b7fa8f642ee1420d12ddce9af8a4e.png)
> A "data" table was then created as a join of the data processed in the previous steps to be used for the machine learning model. Analysis.db is now able to be easily loaded into a new DataFrame.


<hr>

MACHINE LEARNING TBA
✓ Description of preliminary feature 
engineering and preliminary feature 
selection, including their decision-making 
process 
✓ Description of how data was split into 
training and testing sets 
✓ Explanation of model choice, including 
limitations and benefits

<hr>





