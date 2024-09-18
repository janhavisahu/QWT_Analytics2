select ORDERID,
	LINENO ,
	SHIPPERID ,
	CUSTOMERID ,
	PRODUCTID,
	EMPLOYEEID ,
	to_date(SHIPMENTDATE) as SHIPMENTDATE

    from {{ source("raw","shipments")}}