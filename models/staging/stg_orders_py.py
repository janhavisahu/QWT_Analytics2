import snowflake.snowpark.functions as f

def model(dbt, session):
    dbt.config(materialized = "incremental")
    df = dbt.ref("stg_orders")

    if dbt.is_incremental:
        # only new rows compared to max in current table
        max_from_this = f"select max(orderdate) from {dbt.this}"
        df = df.filter(df.updated_at >= session.sql(max_from_this).collect()[0][0])

    return df