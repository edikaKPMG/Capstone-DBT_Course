{{ config(materialized='table') }}

with orders as (

    select * from {{ ref('stg_tpch__orders') }}

),

customer_value as (

    select
        customer_id,
        sum(total_price) as lifetime_value
    from orders
    group by customer_id

),

joined as (

    select
        c.customer_id,
        c.customer_name,
        cv.lifetime_value,

        case
            when cv.lifetime_value >= 500000 then 'Gold'
            when cv.lifetime_value >= 100000 then 'Silver'
            else 'Bronze'
        end as customer_tier

    from {{ ref('stg_tpch__customers') }} c
    left join customer_value cv
        on c.customer_id = cv.customer_id

)

select * from joined