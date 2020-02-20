
select 'svc_req_rate' as variable, time, sum(round(cast(COALESCE(value,'NaN') as numeric) ,2)) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'service:X_requests_total:sum_rate') as xmetrics
where name = 'service:X_requests_total:sum_rate' 
and labels ->> 'destination_service' in ('checkoutservice.default.svc.cluster.local')
--and time between '2020-02-17 08:36:00'::timestamp and '2020-02-17 23:36:00'::timestamp
and (time between '2020-02-17 08:36:21'::timestamp and '2020-02-17 12:22:17'::timestamp 
	or time between '2020-02-17 13:54:00'::timestamp and '2020-02-17 15:36:50'::timestamp
	or time between '2020-02-17 15:40:00'::timestamp and '2020-02-17 19:09:17'::timestamp
	or time between '2020-02-17 19:17:10'::timestamp and '2020-02-17 23:36:00'::timestamp)
group by variable, time
order by time
;

select 'svc_cpu_use' as variable, time, sum(round(cast(COALESCE(value,'NaN') as numeric) ,2)) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'service:X_cpu_usage_total_seconds:sum_rate') as xmetrics
where name = 'service:X_cpu_usage_total_seconds:sum_rate' 
and labels ->> 'label_app' in ('checkoutservice','cartservice','emailservice','currencyservice'
	,'paymentservice','productcatalogservice','shippingservice')
and (time between '2020-02-17 08:36:21'::timestamp and '2020-02-17 12:22:17'::timestamp 
	or time between '2020-02-17 13:54:00'::timestamp and '2020-02-17 15:36:50'::timestamp
	or time between '2020-02-17 15:40:00'::timestamp and '2020-02-17 19:09:17'::timestamp
	or time between '2020-02-17 19:17:10'::timestamp and '2020-02-17 23:36:00'::timestamp)
group by variable, time
order by time
;

select 'svc_cpu_sat' as variable, time, sum(round(cast(COALESCE(value,'NaN') as numeric) ,2)) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'service:X_cpu_saturation_total_seconds:sum_rate') as xmetrics
where name = 'service:X_cpu_saturation_total_seconds:sum_rate' 
and labels ->> 'label_app' in ('checkoutservice','cartservice','emailservice','currencyservice'
	,'paymentservice','productcatalogservice','shippingservice')
and (time between '2020-02-17 08:36:21'::timestamp and '2020-02-17 12:22:17'::timestamp 
	or time between '2020-02-17 13:54:00'::timestamp and '2020-02-17 15:36:50'::timestamp
	or time between '2020-02-17 15:40:00'::timestamp and '2020-02-17 19:09:17'::timestamp
	or time between '2020-02-17 19:17:10'::timestamp and '2020-02-17 23:36:00'::timestamp)
group by variable, time
order by time
;

select 'svc_net_use' as variable, time, sum(round(cast(COALESCE(value,'NaN') as numeric) ,2)) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'service:X_network_usage_bytes_total:sum_rate') as xmetrics
where name = 'service:X_network_usage_bytes_total:sum_rate' 
and labels ->> 'label_app' in ('checkoutservice','cartservice','emailservice','currencyservice'
	,'paymentservice','productcatalogservice','shippingservice')
and (time between '2020-02-17 08:36:21'::timestamp and '2020-02-17 12:22:17'::timestamp 
	or time between '2020-02-17 13:54:00'::timestamp and '2020-02-17 15:36:50'::timestamp
	or time between '2020-02-17 15:40:00'::timestamp and '2020-02-17 19:09:17'::timestamp
	or time between '2020-02-17 19:17:10'::timestamp and '2020-02-17 23:36:00'::timestamp)
group by variable, time
order by time
;

select 'svc_disk_use' as variable, time, sum(round(cast(COALESCE(value,'NaN') as numeric) ,2)) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'service:X_disk_usage_total_byte:sum_rate') as xmetrics
where name = 'service:X_disk_usage_total_byte:sum_rate' 
and labels ->> 'label_app' in ('checkoutservice','cartservice','emailservice','currencyservice'
	,'paymentservice','productcatalogservice','shippingservice')
and (time between '2020-02-17 08:36:21'::timestamp and '2020-02-17 12:22:17'::timestamp 
	or time between '2020-02-17 13:54:00'::timestamp and '2020-02-17 15:36:50'::timestamp
	or time between '2020-02-17 15:40:00'::timestamp and '2020-02-17 19:09:17'::timestamp
	or time between '2020-02-17 19:17:10'::timestamp and '2020-02-17 23:36:00'::timestamp)
group by variable, time
order by time
;

select 'system_cpu_use' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'system:X_cpu_usage_total_seconds:sum_rate') as xmetrics
where name = 'system:X_cpu_usage_total_seconds:sum_rate' 
and (time between '2020-02-17 08:36:21'::timestamp and '2020-02-17 12:22:17'::timestamp 
	or time between '2020-02-17 13:54:00'::timestamp and '2020-02-17 15:36:50'::timestamp
	or time between '2020-02-17 15:40:00'::timestamp and '2020-02-17 19:09:17'::timestamp
	or time between '2020-02-17 19:17:10'::timestamp and '2020-02-17 23:36:00'::timestamp)
order by time
;

select 'system_cpu_sat' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'system:X_cpu_saturation_total_seconds:sum') as xmetrics
where name = 'system:X_cpu_saturation_total_seconds:sum' 
and (time between '2020-02-17 08:36:21'::timestamp and '2020-02-17 12:22:17'::timestamp 
	or time between '2020-02-17 13:54:00'::timestamp and '2020-02-17 15:36:50'::timestamp
	or time between '2020-02-17 15:40:00'::timestamp and '2020-02-17 19:09:17'::timestamp
	or time between '2020-02-17 19:17:10'::timestamp and '2020-02-17 23:36:00'::timestamp)
order by time
;

select 'system_net_use' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'system:X_network_usage_bytes_total:sum_rate') as xmetrics
where name = 'system:X_network_usage_bytes_total:sum_rate' 
and (time between '2020-02-17 08:36:21'::timestamp and '2020-02-17 12:22:17'::timestamp 
	or time between '2020-02-17 13:54:00'::timestamp and '2020-02-17 15:36:50'::timestamp
	or time between '2020-02-17 15:40:00'::timestamp and '2020-02-17 19:09:17'::timestamp
	or time between '2020-02-17 19:17:10'::timestamp and '2020-02-17 23:36:00'::timestamp)
order by time
;

select 'system_net_sat' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'system:X_network_saturation_bytes_total:sum_rate') as xmetrics
where name = 'system:X_network_saturation_bytes_total:sum_rate' 
and (time between '2020-02-17 08:36:21'::timestamp and '2020-02-17 12:22:17'::timestamp 
	or time between '2020-02-17 13:54:00'::timestamp and '2020-02-17 15:36:50'::timestamp
	or time between '2020-02-17 15:40:00'::timestamp and '2020-02-17 19:09:17'::timestamp
	or time between '2020-02-17 19:17:10'::timestamp and '2020-02-17 23:36:00'::timestamp)
order by time
;

select 'system_disk_sat' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'system:X_disk_usage_bytes_total:sum_relative') as xmetrics
where name = 'system:X_disk_usage_bytes_total:sum_relative' 
and (time between '2020-02-17 08:36:21'::timestamp and '2020-02-17 12:22:17'::timestamp 
	or time between '2020-02-17 13:54:00'::timestamp and '2020-02-17 15:36:50'::timestamp
	or time between '2020-02-17 15:40:00'::timestamp and '2020-02-17 19:09:17'::timestamp
	or time between '2020-02-17 19:17:10'::timestamp and '2020-02-17 23:36:00'::timestamp)
order by time
;

select 'system_disk_io' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'system:X_disk_io_total_seconds:sum_rate') as xmetrics
where name = 'system:X_disk_io_total_seconds:sum_rate' 
and (time between '2020-02-17 08:36:21'::timestamp and '2020-02-17 12:22:17'::timestamp 
	or time between '2020-02-17 13:54:00'::timestamp and '2020-02-17 15:36:50'::timestamp
	or time between '2020-02-17 15:40:00'::timestamp and '2020-02-17 19:09:17'::timestamp
	or time between '2020-02-17 19:17:10'::timestamp and '2020-02-17 23:36:00'::timestamp)
order by time
;

select 'svc_ltcy' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'service:X_95th_latency_seconds:sum_rate') as xmetrics
where name = 'service:X_95th_latency_seconds:sum_rate' 
and labels ->> 'destination_service_name' in ('checkoutservice')
and (time between '2020-02-17 08:36:21'::timestamp and '2020-02-17 12:22:17'::timestamp 
	or time between '2020-02-17 13:54:00'::timestamp and '2020-02-17 15:36:50'::timestamp
	or time between '2020-02-17 15:40:00'::timestamp and '2020-02-17 19:09:17'::timestamp
	or time between '2020-02-17 19:17:10'::timestamp and '2020-02-17 23:36:00'::timestamp)
order by time
;

select 'svc_ltcy_200' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'service:X_95th_latency_success_seconds:sum_rate') as xmetrics
where name = 'service:X_95th_latency_success_seconds:sum_rate' 
and labels ->> 'destination_service_name' in ('checkoutservice')
and (time between '2020-02-17 08:36:21'::timestamp and '2020-02-17 12:22:17'::timestamp 
	or time between '2020-02-17 13:54:00'::timestamp and '2020-02-17 15:36:50'::timestamp
	or time between '2020-02-17 15:40:00'::timestamp and '2020-02-17 19:09:17'::timestamp
	or time between '2020-02-17 19:17:10'::timestamp and '2020-02-17 23:36:00'::timestamp)
order by time
;

select 'svc_req_size' as variable, time, sum(round(cast(COALESCE(value,'NaN') as numeric) ,2)) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'service:X_request_size_bytes:sum_rate') as xmetrics
where name = 'service:X_request_size_bytes:sum_rate' 
and labels ->> 'destination_service' in ('checkoutservice.default.svc.cluster.local','cartservice.default.svc.cluster.local'
    ,'emailservice.default.svc.cluster.local','currencyservice.default.svc.cluster.local','paymentservice.default.svc.cluster.local'
    ,'productcatalogservice.default.svc.cluster.local','shippingservice.default.svc.cluster.local')
and (time between '2020-02-17 08:36:21'::timestamp and '2020-02-17 12:22:17'::timestamp 
	or time between '2020-02-17 13:54:00'::timestamp and '2020-02-17 15:36:50'::timestamp
	or time between '2020-02-17 15:40:00'::timestamp and '2020-02-17 19:09:17'::timestamp
	or time between '2020-02-17 19:17:10'::timestamp and '2020-02-17 23:36:00'::timestamp)
group by variable, time
order by time
;

select 'svc_resp_size' as variable, time, sum(round(cast(COALESCE(value,'NaN') as numeric) ,2)) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'service:X_response_size_bytes:sum_rate') as xmetrics
where name = 'service:X_response_size_bytes:sum_rate' 
and labels ->> 'destination_service' in ('checkoutservice.default.svc.cluster.local','cartservice.default.svc.cluster.local'
    ,'emailservice.default.svc.cluster.local','currencyservice.default.svc.cluster.local','paymentservice.default.svc.cluster.local'
    ,'productcatalogservice.default.svc.cluster.local','shippingservice.default.svc.cluster.local')
and (time between '2020-02-17 08:36:21'::timestamp and '2020-02-17 12:22:17'::timestamp 
	or time between '2020-02-17 13:54:00'::timestamp and '2020-02-17 15:36:50'::timestamp
	or time between '2020-02-17 15:40:00'::timestamp and '2020-02-17 19:09:17'::timestamp
	or time between '2020-02-17 19:17:10'::timestamp and '2020-02-17 23:36:00'::timestamp)
group by variable, time
order by time
;

select 'svc_pods' as variable, time, sum(round(cast(COALESCE(value,'NaN') as numeric) ,2)) / 2 as val
from (select distinct time, value, name, labels from metrics 
		where name = 'service:X_container_count:sum') as xmetrics
where name = 'service:X_container_count:sum' 
and labels ->> 'label_app' in ('checkoutservice','cartservice','emailservice','currencyservice'
	,'paymentservice','productcatalogservice','shippingservice')
and (time between '2020-02-17 08:36:21'::timestamp and '2020-02-17 12:22:17'::timestamp 
	or time between '2020-02-17 13:54:00'::timestamp and '2020-02-17 15:36:50'::timestamp
	or time between '2020-02-17 15:40:00'::timestamp and '2020-02-17 19:09:17'::timestamp
	or time between '2020-02-17 19:17:10'::timestamp and '2020-02-17 23:36:00'::timestamp)
group by variable, time
order by time
;

select 'svc_err' as variable, time, sum(round(cast(COALESCE(value,'NaN') as numeric) ,2)) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'service:X_requests_error_total:sum_rate') as xmetrics
where name = 'service:X_requests_error_total:sum_rate' 
and labels ->> 'destination_service' in ('checkoutservice.default.svc.cluster.local','cartservice.default.svc.cluster.local'
    ,'emailservice.default.svc.cluster.local','currencyservice.default.svc.cluster.local','paymentservice.default.svc.cluster.local'
    ,'productcatalogservice.default.svc.cluster.local','shippingservice.default.svc.cluster.local')
and (time between '2020-02-17 08:36:21'::timestamp and '2020-02-17 12:22:17'::timestamp 
	or time between '2020-02-17 13:54:00'::timestamp and '2020-02-17 15:36:50'::timestamp
	or time between '2020-02-17 15:40:00'::timestamp and '2020-02-17 19:09:17'::timestamp
	or time between '2020-02-17 19:17:10'::timestamp and '2020-02-17 23:36:00'::timestamp)
group by variable, time
order by time
;














