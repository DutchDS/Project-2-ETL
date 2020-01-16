-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/qEHxLS
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE IF EXISTS "wines";
DROP TABLE IF EXISTS "countries";
DROP TABLE IF EXISTS "provinces";
DROP TABLE IF EXISTS "wineries";
DROP TABLE IF EXISTS "wine_types";
DROP TABLE IF EXISTS "regions";

CREATE TABLE "countries" (
    "country_id" SERIAL   NOT NULL,
    "country_abbr" VARCHAR(2)   NOT NULL,
    "latitude" FLOAT   NOT NULL,
    "longitude" FLOAT   NOT NULL,
    "country_name" VARCHAR(60)   NOT NULL,
    "temperature" VARCHAR(10),
    CONSTRAINT "pk_countries" PRIMARY KEY (
        "country_id"
     )
);

CREATE TABLE "provinces" (
    "province_id" SERIAL   NOT NULL,
    "province_name" VARCHAR(60)   NOT NULL,
    "avg_f" VARCHAR(10),
    "avg_c" VARCHAR(10),
    CONSTRAINT "pk_provinces" PRIMARY KEY (
        "province_id"
     )
);

CREATE TABLE "regions" (
    "region_id" SERIAL   NOT NULL,
    "region_name" VARCHAR(60)   NOT NULL,
    CONSTRAINT "pk_regions" PRIMARY KEY (
        "region_id"
     )
);

CREATE TABLE "wine_types" (
    "wine_type_id" SERIAL   NOT NULL,
    "wine_type" VARCHAR(60)   NOT NULL,
    CONSTRAINT "pk_wine_types" PRIMARY KEY (
        "wine_type_id"
     )
);

CREATE TABLE "wineries" (
    "winery_id" serial   NOT NULL,
    "winery_name" VARCHAR(60)   NOT NULL,
    CONSTRAINT "pk_wineries" PRIMARY KEY (
        "winery_id"
     )
);

CREATE TABLE "wines" (
    "wine_id" SERIAL   NOT NULL,
    "wine_name" VARCHAR(180)   NOT NULL,
    "country_id" INT   NOT NULL,
    "province_id" INT   NOT NULL,
    "region_id" INT,
    "winery_id" INT   NOT NULL,
    "wine_type_id" INT   NOT NULL,
    "rating" FLOAT   NOT NULL,
    "price" FLOAT   NOT NULL,
    CONSTRAINT "pk_wines" PRIMARY KEY (
        "wine_id"
     )
);

ALTER TABLE "wines" ADD CONSTRAINT "fk_wines_country_id" FOREIGN KEY("country_id")
REFERENCES "countries" ("country_id");

ALTER TABLE "wines" ADD CONSTRAINT "fk_wines_province_id" FOREIGN KEY("province_id")
REFERENCES "provinces" ("province_id");

ALTER TABLE "wines" ADD CONSTRAINT "fk_wines_region_id" FOREIGN KEY("region_id")
REFERENCES "regions" ("region_id");

ALTER TABLE "wines" ADD CONSTRAINT "fk_wines_winery_id" FOREIGN KEY("winery_id")
REFERENCES "wineries" ("winery_id");

ALTER TABLE "wines" ADD CONSTRAINT "fk_wines_wine_type_id" FOREIGN KEY("wine_type_id")
REFERENCES "wine_types" ("wine_type_id");

