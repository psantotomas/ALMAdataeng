{% set excluded = ['event_id'] %}

select
    {{dbt_utils.star(from = ref('fct_events'), except = excluded)}}
from {ref('fct_events')}