with payments as (

    select
            id as payment_id,
            orderid,
            paymentmethod,
            status,
            {{ cents_to_dollars('amount', 4) }} as amount,
            created
    from {{ source ('stripe','payment')}}
)

select * from payments