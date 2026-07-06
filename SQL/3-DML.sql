  
BEGIN;

-- Insertar city 
INSERT INTO riwi_city (city_name)
SELECT 'Ibagué'
WHERE NOT EXISTS (SELECT 1 FROM riwi_city WHERE city_name = 'Ibagué');

-- Insertar client
INSERT INTO riwi_client (client_name)
VALUES ('NewTech Solutions');

-- Insertar branch
INSERT INTO riwi_branch (branch_name, client_id, city_id)
SELECT 'Central Hub', c.client_id, ci.city_id
FROM riwi_client c, riwi_city ci
WHERE c.client_name = 'NewTech Solutions'
  AND ci.city_name = 'Ibagué';

-- Insertar work order
INSERT INTO riwi_work_order (order_code, client_id, branch_id, technician_id, equipment_id, service_type_id, service_date, hours, cost)
SELECT 'WO1021', c.client_id, b.branch_id, 1, 1, 1, '2026-06-01', 3, 200
FROM riwi_client c
JOIN riwi_branch b ON c.client_id = b.client_id
WHERE c.client_name = 'NewTech Solutions';

COMMIT;

  
-- 2. UPDATE
  
UPDATE riwi_technician
SET technician_first_name = 'John',
    technician_last_name = 'Parker'
WHERE technician_first_name = 'Juan'
  AND technician_last_name = 'Perez';

  
-- 3. DELETE
  
DELETE FROM riwi_equipment
WHERE equipment_name = 'Lenovo ThinkPad'
  AND equipment_id NOT IN (
      SELECT DISTINCT equipment_id FROM riwi_work_order
  );
