with ofc as (
    select OFFICE as officeid,
	OFFICEADDRESS as address,
	OFFICEPOSTALCODE as postalcode,
	OFFICECITY city,
	OFFICESTATEPROVINCE stateprovinse,
	OFFICEPHONE phone,
	OFFICEFAX fax,
	OFFICECOUNTRY country

    from {{ source("raw",'office')}}
)

select * from ofc