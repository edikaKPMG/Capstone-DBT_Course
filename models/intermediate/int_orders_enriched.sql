with orders as (

    select * from {{ ref('stg_tpch__orders') }}

),

customers as (

    select * from {{ ref('stg_tpch__customers') }}

),

nations as (

    select * from {{ ref('stg_tpch__nations') }}

),

joined as (

    select
        o.order_id,
        o.customer_id,
        o.order_status_code,   -- ✅ FIX (jetzt enthalten)
        c.customer_name,
        n.nation_name,
        o.total_price,
        o.order_date,

        extract(year from o.order_date) as order_year,
        extract(month from o.order_date) as order_month,
        extract(quarter from o.order_date) as order_quarter

    from orders o
    left join customers c
        on o.customer_id = c.customer_id
    left join nations n
        on c.nation_id = n.nation_id

)

select * from joined