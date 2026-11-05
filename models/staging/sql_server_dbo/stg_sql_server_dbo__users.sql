-- Modelos de Staging

with source as (
    select * from {{ source('sql_server_dbo', 'users') }}
),

renamed as (
    select
          user_id
        , first_name
        , last_name
        , email
        , phone_number      
        , address_id
        , created_at                                as created_at_utc
        , updated_at                                as updated_at_utc
        , coalesce(_fivetran_deleted, false)       as is_deleted
        , _fivetran_synced                          as date_load
    from source
)

select * from renamed