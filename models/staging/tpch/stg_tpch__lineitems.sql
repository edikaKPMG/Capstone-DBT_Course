with source as (

    select * from {{ source('tpch', 'lineitem') }}

),

renamed as (

    select
        "ORDERKEY" as order_id,
        "PARTKEY" as part_id,
        "QUANTITY" as quantity,
        "EXTENDEDPRICE" as extended_price,
        "DISCOUNT" as discount,
        "TAX" as tax,

        -- calculations
        "EXTENDEDPRICE" * (1 - "DISCOUNT") as net_price,
        "EXTENDEDPRICE" * (1 - "DISCOUNT") * (1 + "TAX") as gross_price

    from source

)

select * from renamed