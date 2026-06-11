with source as (

    select * from {{ ref('nation_codes') }}

),

renamed as (

    select
        nation_id,
        nation_name
    from source

)

select * from renamed