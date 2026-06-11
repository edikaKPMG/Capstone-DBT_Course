with source as (

    select * from {{ source('tpch', 'customer') }}

),

renamed as (

    select
        source."C_CUSTKEY" as customer_id,
        source."C_NAME" as customer_name,
        source."C_NATIONKEY" as nation_id
    from source

)

select * from renamed
