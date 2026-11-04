-- Modelos de Staging

with source as (
    select * from {{ source('sql_server_dbo', 'orders') }}
),

renamed as (
    select
          order_id
        , user_id
        , address_id
        , promo_id
        , created_at
        , estimated_delivery_at      
        , delivered_at
        , tracking_id
        , shipping_service
        , shipping_cost
        , order_cost
        , order_total
        , status 
        , coalesce(_fivetran_deleted, false)       as is_deleted
        , _fivetran_synced                          as date_load
    from source
)

select * from renamed