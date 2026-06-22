# sql-datawarehouse-project
building a modern datawarehouse using SQL server
# Modern SQL Data Warehouse Project from Scratch 🚀

Welcome to my portfolio project! This repository contains a full, end-to-end data engineering implementation of a modern SQL Data Warehouse. The design follows real-world corporate best practices, utilizing an architectural blueprint built entirely using SQL Server.

---

##  Project Overview
The main goal of this project is to build a single point of truth for business intelligence and data analytics by consolidating raw, chaotic transactional data from multiple source systems. 

This repository showcases skills across multiple data roles:
*   **Data Architect:** Designed a multi-layered data architecture following the separation of concerns principle.
*   **Data Engineer:** Developed ETL pipelines using SQL to extract, clean, transform, and load datasets.
*   **Data Modeler:** Constructed a clean dimensional star/snowflake schema optimized for analytical queries and BI reporting.

---

##  Data Architecture (Medallion Architecture)
The architecture is structured inside a single database separated logically through SQL Schemas to optimize data flow, security, and maintenance:

1.  **Bronze (Staging) Layer:** Houses the raw data exactly as imported from the source CSV files. Access is limited strictly to Data Engineers.
2.  **Silver Layer:** Cleansed, typed, and standardized data. Unwanted duplicates, white spaces, and structural inconsistencies are resolved here.
3.  **Gold Layer (Data Marts):** Final business-ready layer modeled into Facts and Dimensions for analytics.

---

##  Tech Stack & Tools
*   **Database Engine:** Microsoft SQL Server (SQLEXPRESS)
*   **IDE:** SQL Server Management Studio (SSMS 22)
*   **Modelling & Architecture Design:** Draw.io
*   **Project Management:** Notion
*   **Version Control:** Git & GitHub

---

##  Repository Structure
```text
├── sql_scripts/
│   ├── 01_init_db_schemas.sql       # Database and (bronze, silver, gold) schemas initialization
│   ├── 02_bronze_layer_loading.sql  # DDL tables and BULK INSERT script for raw data
│   ├── 03_silver_layer_transform.sql# Data cleansing, casting, and standardizing
│   └── 04_gold_layer_modeling.sql   # Fact and Dimension tables creation
├── tests/
│   └── quality_checks_gold.sql      # Automated SQL data quality gates & integrity tests
├── docs/
│   └── architecture_blueprint.png   # Data flow and lineage diagrams
└── README.md
```
Data Quality Gates
To ensure absolute reliability before the data is consumed by business stakeholders, the Gold Layer undergoes automated data quality checks (tests/quality_checks_gold.sql) which validate:

Primary Key uniqueness and integrity.

Surrogate key generation consistency.

Foreign Key relationship integrity between Facts and Dimensions.
About Me
Name: AMENI BOUGHARIOU 

Role: ICT ENGINEERING student at SUP'COM / interested in Data engineering and Data Analysis.
