with source as (

    select * from {{ source('tpch', 'customer') }}

),

renamed as (

    select
        "CUSTKEY" as customer_id,
        "NAME" as customer_name,
        "NATIONKEY" as nation_id
    from source

)

select * from renamed