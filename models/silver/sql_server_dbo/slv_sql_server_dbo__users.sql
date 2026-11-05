-- =============================================================================
-- Capa Silver: elimina borrados lógicos y deduplica por clave de negocio,
-- quedándose con la versión más reciente según date_load.
-- =============================================================================

with users as (
    select * from {{ ref('stg_sql_server_dbo__users') }}
),

cleaned as (
    select
         * exclude(is_deleted, email)
        , lower(trim(email))                      as email
    from users
    where not is_deleted
    qualify row_number() over (partition by user_id order by date_load desc) = 1
)

select * from cleaned
