-- **** containers

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

-- **** istio services
-- 6 request total
select 'service_req_total' as name, date_trunc('seconds',  time::timestamp) as ztime
,left(labels ->> 'destination_service', strpos(labels ->> 'destination_service', '.') - 1) service, value
from metrics 
where name = 'istio_requests_total'
and labels ->> 'destination_service_namespace' = 'default'
and (  labels ->> 'destination_service' like 'checkoutservice%'
--	or labels ->> 'destination_service' like 'cartservice%'	
--	or labels ->> 'destination_service' like 'emailservice%'
--	or labels ->> 'destination_service' like 'currencyservice%'	
--	or labels ->> 'destination_service' like 'paymentservice%'	
--	or labels ->> 'destination_service' like 'productcatalogservice%'	
--	or labels ->> 'destination_service' like 'shippingservice%'	
)
and time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp 
;

-- 7-a latency: consider latency for all requests (successful and failed)
select 'service_ltcy' as name, date_trunc('seconds',  time::timestamp) as ztime
,left(labels ->> 'destination_service', strpos(labels ->> 'destination_service', '.') - 1) service, value
from metrics 
where name = 'istio_request_duration_seconds_bucket'
and labels ->> 'destination_service_namespace' = 'default'
--and labels ->> 'response_code' = '200'
and (  labels ->> 'destination_service' like 'checkoutservice%'
--	or labels ->> 'destination_service' like 'cartservice%'	
--	or labels ->> 'destination_service' like 'emailservice%'
--	or labels ->> 'destination_service' like 'currencyservice%'	
--	or labels ->> 'destination_service' like 'paymentservice%'	
--	or labels ->> 'destination_service' like 'productcatalogservice%'	
--	or labels ->> 'destination_service' like 'shippingservice%'	
)
and time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp 
;

-- 7-b latency: consider latency for all requests (successful and failed)
select 'service_ltcy' as name, date_trunc('seconds',  time::timestamp) as ztime
,left(labels ->> 'destination_service', strpos(labels ->> 'destination_service', '.') - 1) service, value
from metrics 
where name = 'istio_request_duration_seconds_bucket'
and labels ->> 'destination_service_namespace' = 'default'
--and labels ->> 'response_code' = '200'
and (  labels ->> 'destination_service' like 'checkoutservice%'
--	or labels ->> 'destination_service' like 'cartservice%'	
--	or labels ->> 'destination_service' like 'emailservice%'
--	or labels ->> 'destination_service' like 'currencyservice%'	
--	or labels ->> 'destination_service' like 'paymentservice%'	
--	or labels ->> 'destination_service' like 'productcatalogservice%'	
--	or labels ->> 'destination_service' like 'shippingservice%'	
)
and time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp 
;

-- 8  services error
select 'service_errors' as name, date_trunc('seconds',  time::timestamp) as ztime
,left(labels ->> 'destination_service', strpos(labels ->> 'destination_service', '.') - 1) service, value
from metrics 
where name = 'istio_request_duration_seconds_count'
and labels ->> 'destination_service_namespace' = 'default'
and labels ->> 'response_code' != '200'
and (  labels ->> 'destination_service' like 'checkoutservice%'
	or labels ->> 'destination_service' like 'cartservice%'	
	or labels ->> 'destination_service' like 'emailservice%'
	or labels ->> 'destination_service' like 'currencyservice%'	
	or labels ->> 'destination_service' like 'paymentservice%'	
	or labels ->> 'destination_service' like 'productcatalogservice%'	
	or labels ->> 'destination_service' like 'shippingservice%'	
)
and time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp 
;

-- 9 request size
iselect 'service_request_size' as name, date_trunc('seconds',  time::timestamp) as ztime
,left(labels ->> 'destination_service', strpos(labels ->> 'destination_service', '.') - 1) service, value
from metrics 
where name = 'istio_request_bytes_sum'
and labels ->> 'destination_workload_namespace' = 'default'
and (  labels ->> 'destination_service' like 'checkoutservice%'
	or labels ->> 'destination_service' like 'cartservice%'	
	or labels ->> 'destination_service' like 'emailservice%'
	or labels ->> 'destination_service' like 'currencyservice%'	
	or labels ->> 'destination_service' like 'paymentservice%'	
	or labels ->> 'destination_service' like 'productcatalogservice%'	
	or labels ->> 'destination_service' like 'shippingservice%'	
)
and time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp
;

-- 10 response size
select 'service_response_size' as name, date_trunc('seconds',  time::timestamp) as ztime
,left(labels ->> 'destination_service', strpos(labels ->> 'destination_service', '.') - 1) service, value
from metrics 
where name = 'istio_response_bytes_sum'
and labels ->> 'destination_workload_namespace' = 'default'
and (  labels ->> 'destination_service' like 'checkoutservice%'
	or labels ->> 'destination_service' like 'cartservice%'	
	or labels ->> 'destination_service' like 'emailservice%'
	or labels ->> 'destination_service' like 'currencyservice%'	
	or labels ->> 'destination_service' like 'paymentservice%'	
	or labels ->> 'destination_service' like 'productcatalogservice%'	
	or labels ->> 'destination_service' like 'shippingservice%'	
)
and time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp 
;

-- 11 container count
-- sum by (label_app) (sum by (pod, name_space) (kube_pod_container_status_running{namespace="default"}) * on (pod) 
       -- group_left(label_app) kube_pod_labels)   
select 'containers_count' as name, date_trunc('seconds',  time::timestamp) as ztime
,left(labels ->> 'pod', strpos(labels ->> 'pod', '-') - 1) service, value
from metrics 
where name = 'kube_pod_container_status_running'
and labels ->> 'namespace' = 'default'
and (  labels ->> 'pod' like 'checkoutservice%'
	or labels ->> 'pod' like 'cartservice%'	
	or labels ->> 'pod' like 'emailservice%'
	or labels ->> 'pod' like 'currencyservice%'	
	or labels ->> 'pod' like 'paymentservice%'	
	or labels ->> 'pod' like 'productcatalogservice%'	
	or labels ->> 'pod' like 'shippingservice%'	
)
and time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp 
;

---- System

-- 12 system cpu usage
-- label_replace(sum(rate(node_cpu_seconds_total{mode!="idle",mode!="iowait",mode!~"^(?:guest.*)$"}[1m])) 
--  by (node), "metric", "nodes_cpu_utilization_seconds" , "app", "(.*)")
select 'system_cpu_usage' as name, date_trunc('seconds',  time::timestamp) as ztime
, left(labels ->> 'instance', strpos(labels ->> 'instance', ':') - 1) as node, value 
from metrics 
where name = 'node_cpu_seconds_total'
and labels ->> 'mode' != 'idle' and labels ->> 'mode' != 'iowait' and labels ->> 'mode' not like 'guest.%'
and time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp 
;


--*** 13 system cpu sat  (needs special processing: devide sum of part1 by cound of part2)
-- label_replace(sum(node_load1) by (node) / count(node_cpu_seconds_total{mode="system"}) 
-- by (node) * 100 , "metric", "nodes_cpu_saturation_seconds" , "app", "(.*)")
select 'system_cpu_sat_part1' as name, date_trunc('seconds',  time::timestamp) as ztime
, left(labels ->> 'instance', strpos(labels ->> 'instance', ':') - 1) as node, value 
from metrics 
where name = 'node_load1' 
;

select 'system_cpu_sat_part2' as name, date_trunc('seconds',  time::timestamp) as ztime
, left(labels ->> 'instance', strpos(labels ->> 'instance', ':') - 1) as node, value
from metrics 
where name = 'node_cpu_seconds_total' 
and labels ->> 'mode' = 'system'
;

--**** 14 system network usage (needs special processing: add sum of part1 to sum of part2)
-- label_replace(sum(rate(node_network_receive_bytes_total[1m])) by (node) + sum(rate(node_network_transmit_bytes_total[1m])) 
-- by (node), "metric", "nodes_network_utilization_seconds" , "app", "(.*)")   
select 'system_network_usage_part1' as name, date_trunc('seconds',  time::timestamp) as ztime
, left(labels ->> 'instance', strpos(labels ->> 'instance', ':') - 1) as node, value 
from metrics 
where name = 'node_network_receive_bytes_total' 
;

select 'system_network_usage_part2' as name, date_trunc('seconds',  time::timestamp) as ztime
, left(labels ->> 'instance', strpos(labels ->> 'instance', ':') - 1) as node, value 
from metrics 
where name = 'node_network_transmit_bytes_total' 
fetch first 100 rows only
;

-- 15 system disk usage
-- label_replace(sum(node_filesystem_files_free{mountpoint="/"}) by (release) / sum(node_filesystem_files{mountpoint="/"}) by (release), "metric", "nodes_network_utilization_seconds" , "app", "(.*)")



-- 16 system network sat (x)
-- label_replace(sum(rate(node_network_receive_drop_total[1m])) by (node) + sum(rate(node_network_transmit_drop_total[1m])) 
--   by (node), "metric", "nodes_network_saturation_seconds" , "app", "(.*)")

-- 17 system disk io  (x)
-- label_replace(sum(rate(node_disk_io_time_weighted_seconds_total[1m])) 
--    by (release) , "metric", "nodes_disk_io_time" , "app", "(.*)")



--...................... above is good .....
-- experiments

select labels from metrics fetch first 3 rows only;

select labels ->> 'destination_service' from metrics 
where name = 'istio_requests_total'
and labels ->> 'destination_service_namespace' = 'default'
and labels ->> 'destination_service' like 'checkoutservice%'
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


-- DO NOT USE BELOW QUERIES
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
and time between '2020-02-27 22:49:50'::timestamp and '2020-02-28 20:44:00'::timestamp
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

