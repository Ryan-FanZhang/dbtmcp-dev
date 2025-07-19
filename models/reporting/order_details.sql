with orders_source as (
    select * from {{ ref('stg_orders') }}
),

customers_source as (
    select * from {{ ref('stg_customer') }}
)

select
    o.order_key,
    o.customer_key,
    c.name as customer_name,
    o.order_status,
    o.total_price,
    o.order_date,
    o.order_priority,
    o.clerk,
    o.ship_priority,
    o.comment as order_comment,
    c.address,
    c.nation_key,
    c.phone,
    c.account_balance,
    c.marketing_segment,
    c.comment as customer_comment

from orders_source o
join customers_source c
  on o.customer_key = c.customer_key