{{ config(
    materialized = 'view'
) }}

with orders as (
    select * from {{ ref("stg_orders")}}
),

payments as (
    select * from {{ ref("stg_payments")}}
),

fact_orders as(
    select order_id,
           payment_id,
           amount
    from orders
    left join payments on orders.order_id = payments.orderid
)

select * from fact_orders