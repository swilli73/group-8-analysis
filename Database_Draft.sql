-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "stations" (
    "id" varchar   NOT NULL,
    "station_name" varchar   NOT NULL,
    "longitude" numeric(3,4)   NOT NULL,
    "latitude" numeric(3,4)   NOT NULL,
    CONSTRAINT "pk_stations" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "weather" (
    "serialid" int   NOT NULL,
    "id" varchar   NOT NULL,
    "date_str" date   NOT NULL,
    "degrees_from_mean" numeric(2,2)   NOT NULL,
    "max_temp" numeric(3,1)   NOT NULL,
    "min_temp" numeric(3,1)   NOT NULL,
    "type" varchar(100)   NOT NULL,
    CONSTRAINT "pk_weather" PRIMARY KEY (
        "serialid","id"
     )
);

ALTER TABLE "weather" ADD CONSTRAINT "fk_weather_id" FOREIGN KEY("id")
REFERENCES "stations" ("id");

