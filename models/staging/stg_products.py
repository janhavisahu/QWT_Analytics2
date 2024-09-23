def model(dbt, session):
    dbt.config(materialized='table')
    my_products = dbt.source("raw", "products")

    return my_products