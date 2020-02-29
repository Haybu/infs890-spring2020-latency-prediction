-- 1
-- containers cpu usage of all involved services
select 'service_cpu_usage' as name, date_trunc('seconds',  time::timestamp) as ztime
,left(labels ->> 'pod', strpos(labels ->> 'pod', '-') - 1) service, value
from metrics 
where name = 'container_cpu_usage_seconds_total'
and labels ->> 'namespace' = 'default'
and (labels ->> 'pod' like 'checkoutservice%'
	or labels ->> 'pod' like 'cartservice%'	
	or labels ->> 'pod' like 'emailservice%'
	or labels ->> 'pod' like 'currencyservice%'	
	or labels ->> 'pod' like 'paymentservice%'	
	or labels ->> 'pod' like 'productcatalogservice%'	
	or labels ->> 'pod' like 'shippingservice%'	
)
and time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp 
--group by name, ztime
--fetch first 10 rows only
;

-- 2
-- containers memory usage of all involved services
select 'service_memory_usage' as name, date_trunc('seconds',  time::timestamp) as ztime
,left(labels ->> 'pod', strpos(labels ->> 'pod', '-') - 1) service, value
from metrics 
where name = 'container_memory_usage_bytes'
and labels ->> 'namespace' = 'default'
and (labels ->> 'pod' like 'checkoutservice%'
	or labels ->> 'pod' like 'cartservice%'	
	or labels ->> 'pod' like 'emailservice%'
	or labels ->> 'pod' like 'currencyservice%'	
	or labels ->> 'pod' like 'paymentservice%'	
	or labels ->> 'pod' like 'productcatalogservice%'	
	or labels ->> 'pod' like 'shippingservice%'	
)
and time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp 
--group by name, ztime
--fetch first 10 rows only
;

-- 3
-- containers service cpu sat of all involved services
select 'service_cpu_sat' as name, date_trunc('seconds',  time::timestamp) as ztime
,left(labels ->> 'pod', strpos(labels ->> 'pod', '-') - 1) service, value
from metrics 
where name = 'container_cpu_cfs_throttled_seconds_total'
and labels ->> 'namespace' = 'default'
and (labels ->> 'pod' like 'checkoutservice%'
	or labels ->> 'pod' like 'cartservice%'	
	or labels ->> 'pod' like 'emailservice%'
	or labels ->> 'pod' like 'currencyservice%'	
	or labels ->> 'pod' like 'paymentservice%'	
	or labels ->> 'pod' like 'productcatalogservice%'	
	or labels ->> 'pod' like 'shippingservice%'	
)
and time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp 
;

-- 4
-- containers service network usage of all involved services
select 'service_net_usage' as name, date_trunc('seconds',  time::timestamp) as ztime
,left(labels ->> 'pod', strpos(labels ->> 'pod', '-') - 1) service, value
from metrics 
where name = 'container_network_receive_bytes_total'
and labels ->> 'namespace' = 'default'
and (labels ->> 'pod' like 'checkoutservice%'
	or labels ->> 'pod' like 'cartservice%'	
	or labels ->> 'pod' like 'emailservice%'
	or labels ->> 'pod' like 'currencyservice%'	
	or labels ->> 'pod' like 'paymentservice%'	
	or labels ->> 'pod' like 'productcatalogservice%'	
	or labels ->> 'pod' like 'shippingservice%'	
)
and time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp 
;

-- 5
-- containers services disk usage of all involved services
select 'service_disk_usage' as name, date_trunc('seconds',  time::timestamp) as ztime
,left(labels ->> 'pod', strpos(labels ->> 'pod', '-') - 1) service, value
from metrics 
where name = 'container_fs_usage_bytes'
and labels ->> 'namespace' = 'default'
and (labels ->> 'pod' like 'checkoutservice%'
	or labels ->> 'pod' like 'cartservice%'	
	or labels ->> 'pod' like 'emailservice%'
	or labels ->> 'pod' like 'currencyservice%'	
	or labels ->> 'pod' like 'paymentservice%'	
	or labels ->> 'pod' like 'productcatalogservice%'	
	or labels ->> 'pod' like 'shippingservice%'	
)
and time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp 
;




--...................... above is good .....
-- experiments
select time, name, value, labels from metrics 
where name = 'container_cpu_cfs_throttled_seconds_total'
and labels ->> 'namespace' = 'default'
and labels ->> 'pod' like 'checkoutservice%'
fetch first 3 rows only;



select name, date_trunc('seconds',  time::timestamp) as ztime
   , round(cast(sum(value) as numeric),5) as value from metrics 
where name = 'container_cpu_usage_seconds_total'
and labels ->> 'namespace' in ('default')
and (labels ->> 'pod' like 'checkoutservice%'
	or labels ->> 'pod' like 'cartservice%'	
	or labels ->> 'pod' like 'emailservice%'
	or labels ->> 'pod' like 'currencyservice%'	
	or labels ->> 'pod' like 'paymentservice%'	
	or labels ->> 'pod' like 'productcatalogservice%'	
	or labels ->> 'pod' like 'shippingservice%'	
)
and time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp
group by name , ztime  
--fetch first 10 rows only
;



---------------------------------------------------------------------------
select 'svc_req_rate' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'service:X_requests_total:sum_rate') as xmetrics
where name = 'service:X_requests_total:sum_rate' 
and labels ->> 'destination_service' in ('checkoutservice.default.svc.cluster.local')
and (time between '2020-02-27 10:41:00'::timestamp and '2020-02-27 21:46:00'::timestamp
  or time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp
 -- or time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 07:27:10'::timestamp
 -- or time between '2020-02-28 07:27:10'::timestamp and '2020-02-28 20:44:00'::timestamp
  )
order by time
;

select 'svc_cpu_use' as variable, time, sum(round(cast(COALESCE(value,'NaN') as numeric) ,2)) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'service:X_cpu_usage_total_seconds:sum_rate') as xmetrics
where name = 'service:X_cpu_usage_total_seconds:sum_rate' 
and labels ->> 'label_app' in ('checkoutservice','cartservice','emailservice','currencyservice'
	,'paymentservice','productcatalogservice','shippingservice')
and (time between '2020-02-27 10:41:00'::timestamp and '2020-02-27 21:46:00'::timestamp
  or time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp
  )
group by variable, time
order by time
;

select 'svc_cpu_sat' as variable, time, sum(round(cast(COALESCE(value,'NaN') as numeric) ,2)) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'service:X_cpu_saturation_total_seconds:sum_rate') as xmetrics
where name = 'service:X_cpu_saturation_total_seconds:sum_rate' 
and labels ->> 'label_app' in ('checkoutservice','cartservice','emailservice','currencyservice'
	,'paymentservice','productcatalogservice','shippingservice')
and (time between '2020-02-27 10:41:00'::timestamp and '2020-02-27 21:46:00'::timestamp
  or time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp
  )
group by variable, time
order by time
;

select 'svc_net_use' as variable, time, sum(round(cast(COALESCE(value,'NaN') as numeric) ,2)) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'service:X_network_usage_bytes_total:sum_rate') as xmetrics
where name = 'service:X_network_usage_bytes_total:sum_rate' 
and labels ->> 'label_app' in ('checkoutservice','cartservice','emailservice','currencyservice'
	,'paymentservice','productcatalogservice','shippingservice')
and (time between '2020-02-27 10:41:00'::timestamp and '2020-02-27 21:46:00'::timestamp
  or time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp
  )
group by variable, time
order by time
;

select 'svc_disk_use' as variable, time, sum(round(cast(COALESCE(value,'NaN') as numeric) ,2)) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'service:X_disk_usage_total_byte:sum_rate') as xmetrics
where name = 'service:X_disk_usage_total_byte:sum_rate' 
and labels ->> 'label_app' in ('checkoutservice','cartservice','emailservice','currencyservice'
	,'paymentservice','productcatalogservice','shippingservice')
and (time between '2020-02-27 10:41:00'::timestamp and '2020-02-27 21:46:00'::timestamp
  or time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp
  )
group by variable, time
order by time
;

select 'system_cpu_use' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'system:X_cpu_usage_total_seconds:sum_rate') as xmetrics
where name = 'system:X_cpu_usage_total_seconds:sum_rate' 
and (time between '2020-02-27 10:41:00'::timestamp and '2020-02-27 21:46:00'::timestamp
  or time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp
  )
order by time
;

select 'system_cpu_sat' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'system:X_cpu_saturation_total_seconds:sum') as xmetrics
where name = 'system:X_cpu_saturation_total_seconds:sum' 
and (time between '2020-02-27 10:41:00'::timestamp and '2020-02-27 21:46:00'::timestamp
  or time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp
  )
order by time
;

select 'system_net_use' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'system:X_network_usage_bytes_total:sum_rate') as xmetrics
where name = 'system:X_network_usage_bytes_total:sum_rate' 
and (time between '2020-02-27 10:41:00'::timestamp and '2020-02-27 21:46:00'::timestamp
  or time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp
  )
order by time
;

select 'system_net_sat' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'system:X_network_saturation_bytes_total:sum_rate') as xmetrics
where name = 'system:X_network_saturation_bytes_total:sum_rate' 
and (time between '2020-02-27 10:41:00'::timestamp and '2020-02-27 21:46:00'::timestamp
  or time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp
  )
order by time
;

select 'system_disk_sat' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'system:X_disk_usage_bytes_total:sum_relative') as xmetrics
where name = 'system:X_disk_usage_bytes_total:sum_relative' 
and (time between '2020-02-27 10:41:00'::timestamp and '2020-02-27 21:46:00'::timestamp
  or time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp
  )
order by time
;

select 'system_disk_io' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'system:X_disk_io_total_seconds:sum_rate') as xmetrics
where name = 'system:X_disk_io_total_seconds:sum_rate' 
and (time between '2020-02-27 10:41:00'::timestamp and '2020-02-27 21:46:00'::timestamp
  or time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp
  )
order by time
;

select 'svc_ltcy' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'service:X_95th_latency_seconds:sum_rate') as xmetrics
where name = 'service:X_95th_latency_seconds:sum_rate' 
and labels ->> 'destination_service_name' in ('checkoutservice')
and (time between '2020-02-27 10:41:00'::timestamp and '2020-02-27 21:46:00'::timestamp
  or time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp
  )
order by time
;

select 'svc_ltcy_200' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'service:X_95th_latency_success_seconds:sum_rate') as xmetrics
where name = 'service:X_95th_latency_success_seconds:sum_rate' 
and labels ->> 'destination_service_name' in ('checkoutservice')
and (time between '2020-02-27 10:41:00'::timestamp and '2020-02-27 21:46:00'::timestamp
  or time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp
  )
order by time
;

select 'svc_req_size' as variable, time, sum(round(cast(COALESCE(value,'NaN') as numeric) ,2)) as val
from (select distinct time, value, name, labels from metrics 
		where name = 'service:X_request_size_bytes:sum_rate') as xmetrics
where name = 'service:X_request_size_bytes:sum_rate' 
and labels ->> 'destination_service' in ('checkoutservice.default.svc.cluster.local','cartservice.default.svc.cluster.local'
    ,'emailservice.default.svc.cluster.local','currencyservice.default.svc.cluster.local','paymentservice.default.svc.cluster.local'
    ,'productcatalogservice.default.svc.cluster.local','shippingservice.default.svc.cluster.local')
and (time between '2020-02-27 10:41:00'::timestamp and '2020-02-27 21:46:00'::timestamp
  or time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp
  )
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
and (time between '2020-02-27 10:41:00'::timestamp and '2020-02-27 21:46:00'::timestamp
  or time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp
  )
group by variable, time
order by time
;

select 'svc_pods' as variable, time, sum(round(cast(COALESCE(value,'NaN') as numeric) ,2)) / 2 as val
from (select distinct time, value, name, labels from metrics 
		where name = 'service:X_container_count:sum') as xmetrics
where name = 'service:X_container_count:sum' 
and labels ->> 'label_app' in ('checkoutservice','cartservice','emailservice','currencyservice'
	,'paymentservice','productcatalogservice','shippingservice')
and (time between '2020-02-27 10:41:00'::timestamp and '2020-02-27 21:46:00'::timestamp
  or time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp
  )
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
and (time between '2020-02-27 10:41:00'::timestamp and '2020-02-27 21:46:00'::timestamp
  or time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp
  )
group by variable, time
order by time
;


--select time, count(labels_id) from metrics_values 
--where labels_id in (select id from metrics_labels where metric_name = 'service:X_cpu_usage_total_seconds:sum_rate')
--group by time
--having count(labels_id) > 1;

