{% snapshot snapshot_distribution_centers %}

{{
	config(
		target_schema='snapshots',
		unique_key = 'id',
		strategy = 'check',
		check_cols = ['name', 'latitude', 'longitude']
		)

}}

select *
from {{ source('thelook_ecommerce', 'distribution_centers') }}

{% endsnapshot %}