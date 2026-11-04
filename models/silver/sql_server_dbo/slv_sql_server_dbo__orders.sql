-- =============================================================================
-- Capa Silver: elimina borrados lógicos y deduplica por clave de negocio,
-- quedándose con la versión más reciente según date_load.
-- =============================================================================

with orders as (
    select * from {{ ref('stg_sql_server_dbo__orders') }}
),

cleaned as (
    select
         * exclude(is_deleted)
    from orders
    where not is_deleted
    qualify row_number() over (partition by address_id order by date_load desc) = 1
)

select * from cleaned
