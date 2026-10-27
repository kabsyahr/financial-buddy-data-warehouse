# Public-ready ETL package

This folder contains portfolio-safe copies of the original FINBU Pentaho transformations.

Changes made for public sharing:
- removed stored database passwords;
- replaced the database username with `portfolio_user`;
- removed the unused `password` field from the `dim_users` source query;
- corrected the `fact_pencatatan` Table Output target from `fact_status` to `fact_pencatatan`;
- retained the original transformation structure and field logic otherwise.

The SQL file is a clean schema reconstructed only from fields referenced by the ETL transformations. It intentionally contains no user records, credentials, password hashes, or original database dump data.
