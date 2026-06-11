with source as (

    select * from {{ source('tpch', 'orders') }}

),

renamed as (

    select
        orderkey as order_id,
        custkey as customer_id,
        orderstatus as order_status_code,
        totalprice as total_price,
        orderdate as order_date
    from source

)

select * from renamed