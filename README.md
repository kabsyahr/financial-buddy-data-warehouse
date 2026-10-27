# Financial Buddy (FINBU): Data Warehouse & Financial Analytics

Data warehouse and financial analytics project developed as an academic group project at **Universitas Airlangga**.

The project focuses on transforming operational financial data into a structured analytical data warehouse using **MySQL, Pentaho Data Integration, dimensional modeling, ETL, and analytical reporting**.

## Project Overview

Financial Buddy (FINBU) is a financial management system designed to support student financial tracking and analysis.

The data warehouse component was developed to organize operational financial data into analytical structures that support reporting across multiple perspectives, including:

- users
- transaction categories
- top-up activity
- time
- transaction history
- financial status
- financial records

The overall workflow combines an operational database, ETL transformations, dimensional modeling, and analytical visualization.

## Data Warehouse Workflow

```text
Operational Financial Database
        ↓
Pentaho Data Integration
        ↓
Data Extraction & Transformation
        ↓
Dimension Tables
        ↓
Fact Tables
        ↓
Financial Data Warehouse
        ↓
Analytical Reporting
```

## Dimensional Model

The warehouse was designed using a dimensional approach with dimension and fact tables.

### Dimension Tables

- `dim_users`
- `dim_kategori`
- `dim_topup`
- `dim_waktu`

### Fact Tables

- `fact_riwayat`
- `fact_status`
- `fact_pencatatan`

Surrogate keys are generated during the ETL process to support relationships between dimension and fact tables.

## ETL Process

The ETL pipeline was developed using **Pentaho Data Integration**.

The transformations include operations such as:

- extracting data from the operational MySQL database
- combining data through stream lookups
- generating surrogate keys
- selecting and restructuring relevant fields
- loading transformed records into dimension and fact tables
- building a dedicated time dimension

The public ETL files are available in the [`etl/`](etl/) directory.

## ETL Transformations

```text
etl/
├── dim_users.ktr
├── dim_kategori.ktr
├── dim_topup.ktr
├── dim_waktu.ktr
├── fact_riwayat.ktr
├── fact_status.ktr
└── fact_pencatatan.ktr
```

### Dimension Transformations

`dim_users.ktr` integrates user, faculty, and study-program information into the user dimension.

`dim_kategori.ktr` combines transaction-category information to create the category dimension.

`dim_topup.ktr` processes top-up and balance information into the top-up dimension.

`dim_waktu.ktr` generates the time dimension used for period-based financial analysis.

### Fact Transformations

`fact_riwayat.ktr` structures transaction-history data for analytical use.

`fact_status.ktr` prepares financial-status information across time periods.

`fact_pencatatan.ktr` structures financial transaction records and connects them with relevant warehouse dimensions.

## Analytical Reporting

The warehouse supports several forms of financial analysis, including:

- daily income and expenses
- monthly financial trends
- annual financial summaries
- daily financial activity within a selected month
- income and expenses by transaction category

These analytical views are intended to make financial patterns easier to monitor and interpret.

## Database Schema

A portfolio-safe version of the source database schema is provided in:

```text
sql/source_schema_public.sql
```

The public schema contains only the structure needed to demonstrate the project architecture.

User records, email addresses, student identification numbers, password hashes, credentials, and other account-level data are excluded.

## Tools & Technologies

- MySQL
- MariaDB
- SQL
- Pentaho Data Integration
- ETL
- Data Warehouse
- Dimensional Modeling
- Star Schema
- OLAP
- Financial Analytics

## Repository Structure

```text
financial-buddy-data-warehouse/
├── README.md
├── PUBLIC_NOTES.md
├── etl/
│   ├── dim_users.ktr
│   ├── dim_kategori.ktr
│   ├── dim_topup.ktr
│   ├── dim_waktu.ktr
│   ├── fact_riwayat.ktr
│   ├── fact_status.ktr
│   └── fact_pencatatan.ktr
├── sql/
│   └── source_schema_public.sql
└── images/
    ├── star_schema.png
    └── analytical_dashboard.png
```

## Public Repository Notes

This repository contains a cleaned portfolio version of the original academic project.

Sensitive or unnecessary operational data has been excluded from the public version, including:

- personal user information
- student identification numbers
- email addresses
- password hashes
- database credentials
- raw database dumps

The public files are intended to demonstrate the project's **data architecture, ETL workflow, dimensional modeling, and analytical design**.
