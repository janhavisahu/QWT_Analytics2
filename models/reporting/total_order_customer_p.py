import snowflake.snowpark.functions as f


def model(dbt, session):
    dbt.config(materialized = "table", schema='reporting')
    cust_df = dbt.ref("dim_customers")
    order_df = dbt.ref("fact_orders")

    cust_order_df = (order_df.group_by('customerid').agg(f.min(f.col('orderdate')).alias('first_orderdaye'),
                        f.max(f.col('orderdate')).alias('last_orderdate'),
                        f.count(f.col('orderid')).alias('total_orders')))

    final_df = (cust_df.join(cust_order_df, cust_df.customerid==cust_order_df.customerid,'left')
    .select(
        cust_df.companyname.alias('companyname'),
        cust_df.contactname.alias('customername'),
        cust_order_df.first_orderdaye.alias('first_orderdates'),
        cust_order_df.last_orderdate.alias('last_orderdates'),
        cust_order_df.total_orders.alias('total_orders')

    )
    )


    return final_df