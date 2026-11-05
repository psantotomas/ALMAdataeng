-- ================
-- Test: Devolver pedidos sin línea
-- ================

with orders as (
    select 
        *
    from {{ ref('fct_orders') }}
),

order_item as (
    select 
        *
    from {{ ref('slv_sql_server_dbo__order_items') }}
),

joined as (
    select 
        *
    from orders o 
    left join order_item i 
        on o.order_id = i.order_id
),

no_line as (
    select 
        *
    from joined
    where
        order_item_id is null
)

select * from no_line