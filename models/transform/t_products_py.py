# def prodavailable(x, y):
#     return x - y


# def model(dbt, session):
#     dbt.config(materialized="incremental", schema="transform")
#     df = dbt.ref("stg_orders_py")

#     df = temp_df.withColumn
#             ("productavailability",iff(prodavailable(temp_df["unitsinstock"], temp_df["unitsonorder"]) > 0,lit("yes"),lit(no"),),)
