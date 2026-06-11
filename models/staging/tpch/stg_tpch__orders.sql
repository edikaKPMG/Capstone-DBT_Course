with source as (

    select * from {{ source('tpch', 'orders') }}

),

renamed as (

    select
        source."O_ORDERKEY" as order_id,
        source."O_CUSTKEY" as customer_id,
        source."O_ORDERSTATUS" as order_status_code,
        source."O_TOTALPRICE" as total_price,
        source."O_ORDERDATE" as order_date,
        source."O_ORDERPRIORITY" as order_priority,
        source."O_CLERK" as clerk
    from source

)

select * from renamed