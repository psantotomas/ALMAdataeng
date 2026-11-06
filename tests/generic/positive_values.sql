{% test positive_values(model, column_name) %}

with positive as (
    select
        {{ column_name }}

    from {{ model }}

    where
        {{column_name}} <= 0
)
select
    *
from positive

{% endtest %}