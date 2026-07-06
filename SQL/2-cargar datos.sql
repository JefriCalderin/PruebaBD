
-- riwi_city
 
INSERT INTO riwi_city (city_name) VALUES
('Bogotá'),
('Medellín'),
('Cali'),
('Barranquilla'),
('Cartagena'),
('Pereira'),
('Bucaramanga'),
('Cúcuta'),
('Manizales'),
('Santa Marta');

 
-- riwi_client
 
INSERT INTO riwi_client (client_name) VALUES
('Acme Ltd'),
('Innova SAS'),
('NovaTech'),
('BioHealth'),
('SoftCorp'),
('Vision SA'),
('RetailOne'),
('EduCenter'),
('HealthPlus'),
('MegaFoods');

 
-- riwi_branch
 
INSERT INTO riwi_branch (branch_name, client_id, city_id) VALUES
('North Office',   1,  1),   -- Acme Ltd - Bogotá
('HeadQuarters',   2,  2),   -- Innova SAS - Medellín
('West',           3,  3),   -- NovaTech - Cali
('Main',           4,  4),   -- BioHealth - Barranquilla
('Coast',          5,  5),   -- SoftCorp - Cartagena
('Coffee',         6,  6),   -- Vision SA - Pereira
('East',           7,  7),   -- RetailOne - Bucaramanga
('NorthEast',      8,  8),   -- EduCenter - Cúcuta
('Central',        9,  9),   -- HealthPlus - Manizales
('Caribbean',      10, 10);  -- MegaFoods - Santa Marta

 
-- riwi_technician
 
INSERT INTO riwi_technician (technician_first_name, technician_last_name) VALUES
('Juan',   'Perez'),
('Maria',  'Gomez'),
('Carlos', 'Ruiz'),
('Laura',  'Diaz'),
('Andres', 'Mora');

 
-- riwi_equipment_category
 
INSERT INTO riwi_equipment_category (category_name) VALUES
('Laptop'),
('Desktop'),
('Networking'),
('Printer');

 
-- riwi_equipment
 
INSERT INTO riwi_equipment (equipment_name, category_id) VALUES
('Dell Latitude 5420', 1),  -- Laptop
('HP ProDesk',         2),  -- Desktop
('Cisco Switch 2960',  3),  -- Networking
('Canon Printer',      4),  -- Printer
('Lenovo ThinkPad',    1);  -- Laptop

 
-- riwi_service_type
 
INSERT INTO riwi_service_type (service_type_name) VALUES
('Preventive'),
('Corrective'),
('Installation'),
('Repair');

 
-- riwi_work_order
 
INSERT INTO riwi_work_order (order_code, client_id, branch_id, technician_id, equipment_id, service_type_id, service_date, hours, cost) VALUES
('WO1001', 1,  1,  1,  1,  1, '2026-05-01', 2,  120),
('WO1002', 1,  1,  1,  1,  1, '2026-05-02', 3,  180),
('WO1003', 2,  2,  2,  2,  2, '2026-05-03', 4,  250),
('WO1004', 2,  2,  2,  2,  3, '2026-05-04', 2,  150),
('WO1005', 3,  3,  3,  3,  3, '2026-05-05', 5,  500),
('WO1006', 3,  3,  3,  3,  3, '2026-05-06', 4,  450),
('WO1007', 4,  4,  4,  4,  2, '2026-05-07', 2,  130),
('WO1008', 4,  4,  4,  4,  2, '2026-05-08', 3,  200),
('WO1009', 5,  5,  5,  5,  1, '2026-05-09', 2,  140),
('WO1010', 5,  5,  5,  5,  1, '2026-05-10', 3,  190),
('WO1011', 6,  6,  1,  2,  3, '2026-05-11', 6,  550),
('WO1012', 6,  6,  1,  2,  3, '2026-05-12', 5,  520),
('WO1013', 7,  7,  2,  1,  2, '2026-05-13', 2,  160),
('WO1014', 7,  7,  2,  1,  2, '2026-05-14', 3,  210),
('WO1015', 8,  8,  3,  3,  1, '2026-05-15', 2,  125),
('WO1016', 8,  8,  3,  3,  1, '2026-05-16', 2,  135),
('WO1017', 9,  9,  4,  4,  3, '2026-05-17', 4,  400),
('WO1018', 9,  9,  4,  4,  3, '2026-05-18', 5,  430),
('WO1019', 10, 10, 5,  5,  2, '2026-05-19', 3,  220),
('WO1020', 10, 10, 5,  5,  2, '2026-05-20', 4,  260);
