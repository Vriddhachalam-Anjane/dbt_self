{% snapshot orders_snapshot %}

{{
    config(
      target_database='dbt_self',
      target_schema='snapshots',
      unique_key='id',

      strategy='timestamp',
      updated_at='_etl_loaded_at',
    )
}}

select * from {{ source('jaffle_shop', 'raw_orders') }}

{% endsnapshot %}