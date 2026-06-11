with source as (

    select * from {{ source('tpch', 'lineitem') }}

),

renamed as (

    select
        source."L_ORDERKEY" as order_id,
        source."L_PARTKEY" as part_id,
        source."L_QUANTITY" as quantity,
        source."L_EXTENDEDPRICE" as extended_price,
        source."L_DISCOUNT" as discount,
        source."L_TAX" as tax,

        source."L_EXTENDEDPRICE" * (1 - source."L_DISCOUNT") as net_price,
        source."L_EXTENDEDPRICE" * (1 - source."L_DISCOUNT") * (1 + source."L_TAX") as gross_price

    from source

)

select * from renamed
