
-- VISTA 1
CREATE OR REPLACE VIEW vw_technician_workload AS
SELECT
    t.technician_id,
    t.technician_first_name || ' ' || t.technician_last_name AS technician_name,
    COUNT(wo.order_id) AS total_orders,
    SUM(wo.hours) AS total_hours,
    SUM(wo.cost) AS total_revenue
FROM riwi_technician t
LEFT JOIN riwi_work_order wo ON t.technician_id = wo.technician_id
GROUP BY t.technician_id, t.technician_first_name, t.technician_last_name;


-- VISTA 2
CREATE OR REPLACE VIEW vw_monthly_service_summary AS
SELECT
    EXTRACT(YEAR FROM wo.service_date) AS anio,
    EXTRACT(MONTH FROM wo.service_date) AS mes,
    COUNT(wo.order_id) AS total_orders,
    SUM(wo.hours) AS total_hours,
    SUM(wo.cost) AS total_cost,
    COUNT(DISTINCT wo.client_id) AS active_clients,
    COUNT(DISTINCT wo.technician_id) AS active_technicians
FROM riwi_work_order wo
GROUP BY EXTRACT(YEAR FROM wo.service_date), EXTRACT(MONTH FROM wo.service_date);


-- FUNCION: Consultar tecnicos 

CREATE OR REPLACE FUNCTION fn_get_technicians(p_technician_id INT DEFAULT NULL)
RETURNS TABLE (
    technician_id INT,
    first_name VARCHAR,
    last_name VARCHAR,
    total_orders BIGINT
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT
        t.technician_id,
        t.technician_first_name,
        t.technician_last_name,
        COUNT(wo.order_id) AS total_orders
    FROM riwi_technician t
    LEFT JOIN riwi_work_order wo ON t.technician_id = wo.technician_id
    
    WHERE p_technician_id IS NULL OR t.technician_id = p_technician_id
    GROUP BY t.technician_id, t.technician_first_name, t.technician_last_name;
END;
$$;
