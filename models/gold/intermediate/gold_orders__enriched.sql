-- ==========================
-- Unificar información de orders, addresses y promos
-- ==========================

with orders as (
    select
        *
    from {{ref('slv_sql_server_dbo_orders.sql')}}
),
addresses as (
    select
        *
    from {{ref('slv_sql_server_dbo_addresses.sql')}}
),
promos as (
    select
        *
    from {{ref('slv_sql_server_dbo_promos.sql')}}
)
enriched as (

)