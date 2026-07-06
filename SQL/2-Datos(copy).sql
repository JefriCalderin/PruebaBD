

-- 1. riwi_city 
\copy riwi_city (city_name) FROM 'riwi_city.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

-- 2. riwi_client 
\copy riwi_client (client_name) FROM 'riwi_client.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

-- 3. riwi_technician (
\copy riwi_technician (technician_first_name, technician_last_name) FROM 'riwi_technician.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

-- 4. riwi_equipment_category 
\copy riwi_equipment_category (category_name) FROM 'riwi_equipment_category.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

-- 5. riwi_service_type 
\copy riwi_service_type (service_type_name) FROM 'riwi_service_type.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

-- 6. riwi_branch 
\copy riwi_branch (branch_name, client_id, city_id) FROM 'riwi_branch.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

-- 7. riwi_equipment 
\copy riwi_equipment (equipment_name, category_id) FROM 'riwi_equipment.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

-- 8. riwi_work_order 
\copy riwi_work_order (order_code, client_id, branch_id, technician_id, equipment_id, service_type_id, service_date, hours, cost) FROM 'riwi_work_order.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

 
-- Verificación rápida de conteos cargados
 
SELECT 'riwi_city' AS tabla, COUNT(*) AS registros FROM riwi_city
UNION ALL
SELECT 'riwi_client', COUNT(*) FROM riwi_client
UNION ALL
SELECT 'riwi_technician', COUNT(*) FROM riwi_technician
UNION ALL
SELECT 'riwi_equipment_category', COUNT(*) FROM riwi_equipment_category
UNION ALL
SELECT 'riwi_service_type', COUNT(*) FROM riwi_service_type
UNION ALL
SELECT 'riwi_branch', COUNT(*) FROM riwi_branch
UNION ALL
SELECT 'riwi_equipment', COUNT(*) FROM riwi_equipment
UNION ALL
SELECT 'riwi_work_order', COUNT(*) FROM riwi_work_order;
