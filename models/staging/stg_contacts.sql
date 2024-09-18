select *
from {{ source("raw",'contacts')}}