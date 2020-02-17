
select 1 as seq,'cpu' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from metrics
where name = 'service:X_cpu_usage_total_seconds:sum_rate' 
and labels ->> 'label_app' = 'cartservice'
 and time between '2019-05-27 16:46:00'::timestamp and '2019-05-28 10:50:00'::timestamp 
order by time
;

select 2 as seq,'mem' as variable, time, round(cast(COALESCE(value,'NaN') / (1024 * 1024) as numeric) ,2) as val
from metrics
where name = 'service:X_memory_usage_total_bytes:sum_rate'   
and labels ->> 'label_app' = 'cartservice'
 and time between '2019-05-27 16:46:00'::timestamp and '2019-05-28 10:50:00'::timestamp 
order by time
;

select 3 as seq,'fsys' as variable, time, round(cast(COALESCE(value,'NaN') / (1024) as numeric) ,2) as val
from metrics  
where name = 'service:X_fs_usage_total_byte:sum_rate'   
and labels ->> 'label_app' = 'cartservice'
and time between '2019-05-27 16:46:00'::timestamp and '2019-05-28 10:50:00'::timestamp               
order by time
;

select 4 as seq, 'req' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from metrics 
where name = 'service:X_requests_total:sum_rate'   
and labels ->> 'destination_service' = 'cartservice.sock-shop.svc.cluster.local' 
and time between '2019-05-27 16:46:00'::timestamp and '2019-05-28 10:50:00'::timestamp  
order by time
;

select 5 as seq, 'err' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from metrics 
where name = 'service:X_requests_error_total:sum_rate'   
and labels ->> 'destination_service' = 'cartservice.sock-shop.svc.cluster.local'
and time between '2019-05-27 16:46:00'::timestamp and '2019-05-28 10:50:00'::timestamp  
order by time
;

--select * from metrics where name = 'service:X_requests_error_total:sum_rate'  and time between '2019-04-02 18:20:44'::timestamp and '2019-04-03 07:20:44'::timestamp; 

select 6 as seq, 'aval' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from metrics 
where name = 'service:X_95th_availablity_error_total:sum_rate'    
and labels ->> 'destination_service_name' = 'cartservice'
and time between '2019-05-27 16:46:00'::timestamp and '2019-05-28 10:50:00'::timestamp  
order by time
;

select 7 as seq, 'pod' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from metrics 
	where name = 'service:X_pod_unavailable_count:sum_rate'   
	and labels ->> 'deployment' = 'cartservice'
     and time between '2019-05-27 16:46:00'::timestamp and '2019-05-28 10:50:00'::timestamp  
              
order by time
;

select 8 as seq, 'netr' as variable, time, round(cast(COALESCE(value,'NaN') / (1024 * 1024) as numeric) ,2) as val
from metrics 
     where name = 'service:X_network_receive_bytes:sum_rate'   
     and labels ->> 'label_app' = 'cartservice'
     and time between '2019-05-27 16:46:00'::timestamp and '2019-05-28 10:50:00'::timestamp         
order by time
;

select 9 as seq, 'netm' as variable, time, round(cast(COALESCE(value,'NaN') / (1024 * 1024) as numeric) ,2) as val
from metrics  
	where name = 'service:X_network_transmit_bytes:sum_rate'    
	and labels ->> 'label_app' = 'cartservice'
     and time between '2019-05-27 16:46:00'::timestamp and '2019-05-28 10:50:00'::timestamp       
order by time
;

select 10 as seq, 'reqz' as variable, time, round(cast(COALESCE(value,'NaN') / (1024) as numeric) ,2) as val
from metrics  
	where name = 'service:X_request_size_bytes:sum_rate'   
	and labels ->> 'destination_service' = 'cartservice.sock-shop.svc.cluster.local' 
     and time between '2019-05-27 16:46:00'::timestamp and '2019-05-28 10:50:00'::timestamp             
order by time
;

select 11 as seq, 'resz' as variable, time, round(cast(COALESCE(value,'NaN') / (1024) as numeric) ,2) as val
from metrics  
	where name = 'service:X_response_size_bytes:sum_rate'     
	 and labels ->> 'destination_service' = 'cartservice.sock-shop.svc.cluster.local' 
     and time between '2019-05-27 16:46:00'::timestamp and '2019-05-28 10:50:00'::timestamp           
order by time
;

select 12 as seq, 'cntr' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from metrics 
	where name = 'service:X_container_running_count:sum_rate'  
	and labels ->> 'label_app' = 'cartservice' 
     and time between '2019-05-27 16:46:00'::timestamp and '2019-05-28 10:50:00'::timestamp              
order by time
;

select 13 as seq, 'ltcy' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from metrics 
	where name = 'service:X_95th_latency_seconds:sum_rate'    
	 and labels ->> 'destination_service_name' = 'cartservice'
     and time between '2019-05-27 16:46:00'::timestamp and '2019-05-28 10:50:00'::timestamp              
order by time
;

select 14 as seq, 'nsmem' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) / (1024 * 1024 * 1024) ,2) as val
from metrics  
	where name = 'namespace:X_memory_usage_bytes:sum_rate'      
     and time between '2019-05-27 16:46:00'::timestamp and '2019-05-28 10:50:00'::timestamp              
order by time
;

select 15 as seq, 'nscpu' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from metrics 
	where name = 'namespace:X_cpu_usage_seconds:sum_rate'      
     and time between '2019-05-27 16:46:00'::timestamp and '2019-05-28 10:50:00'::timestamp           
order by time
;

select 16 as seq, 'clmem' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2) as val
from metrics 
	where name = 'cluster:X_memory_usage_bytes:sum_pct'      
     and time between '2019-05-27 16:46:00'::timestamp and '2019-05-28 10:50:00'::timestamp            
order by time
;

select 17 as seq, 'clcpu' as variable, time, round(cast(COALESCE(value,'NaN') / 60 as numeric) ,2) as val
from metrics 
	where name = 'cluster:X_cpu_usage_seconds:sum_rate'      
     and time between '2019-05-27 16:46:00'::timestamp and '2019-05-28 10:50:00'::timestamp           
order by time
;

select 18 as seq, 'clfsys' as variable, time, round(cast(COALESCE(value,'NaN') as numeric) ,2)  as val
from metrics 
	where name = 'cluster:X_filesystem_usage_bytes:sum'      
     and time between '2019-05-27 16:46:00'::timestamp and '2019-05-28 10:50:00'::timestamp              
order by time
;

select 19 as seq, 'sysnetr' as variable, time , round(cast(COALESCE(value,'NaN') / (1024 * 1024 * 1024) as numeric) ,2) as val
from metrics  
	where name = 'system:X_network_total_receive_bytes:sum_rate'      
     and time between '2019-05-27 16:46:00'::timestamp and '2019-05-28 10:50:00'::timestamp             
order by time
;

select 20 as seq, 'sysnetm' as variable, time, round(cast(COALESCE(value,'NaN') / (1024 * 1024 * 1024) as numeric) ,2) as val
from metrics  
	where name = 'system:X_network_total_transmit_bytes:sum_rate'      
     and time between '2019-05-27 16:46:00'::timestamp and '2019-05-28 10:50:00'::timestamp          
order by time
;


