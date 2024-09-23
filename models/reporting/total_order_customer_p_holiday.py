import snowflake.snowpark.functions as F
import holidays
 
def is_holiday(date_col):
 
    holidays_df = holidays.France()
 
    is_holiday = (date_col in holidays_df)
 
    return is_holiday
 
 
def model(dbt,session):
 
    dbt.config(materialized = "table", schema = "reporting", packages = ["holidays"])
 
    cusotmers_df = dbt.ref('dim_customers')
 
    orders_df = dbt.ref('fact_orders')
 
    customer_orders_df = (
        orders_df.group_by('customerid')
        .agg(F.min(F.col('orderdate')).alias('first_orderdate'),
         F.max(F.col('orderdate')).alias('recent_order_date'),
         F.count(F.col('orderid')).alias('total_orders')
    )
    )
 
    final_df = (
               
                cusotmers_df.join(customer_orders_df, cusotmers_df.customerid == customer_orders_df.customerid, 'left')
                .select(
                    cusotmers_df.companyname.alias('companyname'),
                    cusotmers_df.contactname.alias('contactname'),
                    customer_orders_df.first_orderdate.alias('first_order_date'),
                    customer_orders_df.recent_order_date.alias('most_recent_order_date'),
                    customer_orders_df.total_orders.alias('total_orders')
               
                )
               
                )
   
    final_df = final_df.filter(F.col("first_order_date").isNotNull())
 
    final_df = final_df.to_pandas()
 
    final_df["is_firstorder_date_holiday"] = final_df["FIRST_ORDER_DATE"].apply(is_holiday)
 
    return final_df
 