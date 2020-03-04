\copy (select 'node_cpu_seconds_total' as name, date_trunc('seconds',  time::timestamp) as ztime, left(labels ->> 'instance', strpos(labels ->> 'instance', ':') - 1) as node, value from metrics where name = 'node_cpu_seconds_total' and labels ->> 'mode' = 'system') TO '/Users/hmohamed/github/data-research-spring2020/raw-data-linode-run3/14_node_cpu_seconds_total.csv' CSV HEADER