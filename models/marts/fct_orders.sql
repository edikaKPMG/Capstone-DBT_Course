{{ config(
    materialized='incremental',
    unique_key='order_id'
) }}

with source as (

    select * from {{ ref('int_orders_enriched') }}

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key(['order_id']) }} as order_sk,
        *
    from source

)

select * from final