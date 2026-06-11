select *
from {{ ref('fct_orders') }}
where total_price < 0