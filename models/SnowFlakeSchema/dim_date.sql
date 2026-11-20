with days as (

select dd::date as date
from generate_series('2012-05-01'::timestamp, '2026-10-31'::timestamp, interval '1 day') as dd

)
select
	to_char(date, 'YYYYMMDD')::int as date_key,
	date as full_date,
	extract(year from date)::int as year,
	extract(quarter from date)::int as quarter,
	to_char(date, '"Q"Q:YYYY') as quarter_name,
	extract(month from date)::int as month,
	to_char(date, 'FMMonth') as month_name,
	to_char(date, 'FMMon') as month_name_short,
	to_char(date, 'YYYY-MM') as year_month,
	extract(day from date) as day_of_month,
	extract(isodow from date) as day_of_week,
	to_char(date, 'FMDay') as day_name,
	extract(week from date) as week_of_year,
	case
		when extract(isodow from date) in (6,7) then true
		else False
	end as is_weekend
from days