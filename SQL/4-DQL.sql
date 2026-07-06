-- consulta 1

select
    t.technician_first_name || ' ' || t.technician_last_name as nombre_tecnico,
    count(wo.order_id) as total_ordenes
from riwi_technician t
left join riwi_work_order wo on t.technician_id = wo.technician_id
group by t.technician_id, t.technician_first_name, t.technician_last_name
order by total_ordenes desc;

-- consulta 2

select
    ci.city_name,
    count(wo.order_id) as total_servicios
from riwi_city ci
join riwi_branch b on ci.city_id = b.city_id
join riwi_work_order wo on b.branch_id = wo.branch_id
group by ci.city_id, ci.city_name
order by total_servicios desc;

  
-- consulta 3

select
    st.service_type_name,
    count(wo.order_id) as total_servicios
from riwi_service_type st
left join riwi_work_order wo on st.service_type_id = wo.service_type_id
group by st.service_type_id, st.service_type_name
order by total_servicios desc;

  
-- consulta 4

select
    e.equipment_name,
    ec.category_name,
    count(wo.order_id) as total_mantenimientos
from riwi_equipment e
join riwi_equipment_category ec on e.category_id = ec.category_id
join riwi_work_order wo on e.equipment_id = wo.equipment_id
group by e.equipment_id, e.equipment_name, ec.category_name
order by total_mantenimientos desc;

-- consulta 5
  
select
    c.client_name,
    count(wo.order_id) as total_ordenes
from riwi_client c
join riwi_work_order wo on c.client_id = wo.client_id
group by c.client_id, c.client_name
order by total_ordenes desc;

  
-- consulta 6
select
    b.branch_name,
    c.client_name,
    ci.city_name,
    count(wo.order_id) as total_ordenes
from riwi_branch b
join riwi_client c on b.client_id = c.client_id
join riwi_city ci on b.city_id = ci.city_id
join riwi_work_order wo on b.branch_id = wo.branch_id
group by b.branch_id, b.branch_name, c.client_name, ci.city_name
order by total_ordenes desc;
