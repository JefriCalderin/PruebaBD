-- 1. riwi_city

CREATE TABLE riwi_city (
    city_id SERIAL PRIMARY KEY,
    city_name VARCHAR(100) NOT NULL UNIQUE
);


-- 2. riwi_client

CREATE TABLE riwi_client (
    client_id SERIAL PRIMARY KEY,
    client_name VARCHAR(150) NOT NULL UNIQUE
);


-- 3. riwi_branch

CREATE TABLE riwi_branch (
    branch_id SERIAL PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL,
    client_id INT NOT NULL,
    city_id INT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES riwi_client(client_id),
    FOREIGN KEY (city_id) REFERENCES riwi_city(city_id),
    UNIQUE (branch_name, client_id)
);


-- 4. riwi_technician

CREATE TABLE riwi_technician (
    technician_id SERIAL PRIMARY KEY,
    technician_first_name VARCHAR(100) NOT NULL,
    technician_last_name VARCHAR(100) NOT NULL,
    UNIQUE (technician_first_name, technician_last_name)
);


-- 5. riwi_equipment_category

CREATE TABLE riwi_equipment_category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);


-- 6. riwi_equipment

CREATE TABLE riwi_equipment (
    equipment_id SERIAL PRIMARY KEY,
    equipment_name VARCHAR(200) NOT NULL UNIQUE,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES riwi_equipment_category(category_id)
);


-- 7. riwi_service_type

CREATE TABLE riwi_service_type (
    service_type_id SERIAL PRIMARY KEY,
    service_type_name VARCHAR(100) NOT NULL UNIQUE
);


-- 8. riwi_work_order

CREATE TABLE riwi_work_order (
    order_id SERIAL PRIMARY KEY,
    order_code VARCHAR(20) NOT NULL UNIQUE,
    client_id INT NOT NULL,
    branch_id INT NOT NULL,
    technician_id INT NOT NULL,
    equipment_id INT NOT NULL,
    service_type_id INT NOT NULL,
    service_date DATE NOT NULL,
    hours DECIMAL(5,2) NOT NULL CHECK (hours > 0),
    cost DECIMAL(10,2) NOT NULL CHECK (cost >= 0),
    FOREIGN KEY (client_id) REFERENCES riwi_client(client_id),
    FOREIGN KEY (branch_id) REFERENCES riwi_branch(branch_id),
    FOREIGN KEY (technician_id) REFERENCES riwi_technician(technician_id),
    FOREIGN KEY (equipment_id) REFERENCES riwi_equipment(equipment_id),
    FOREIGN KEY (service_type_id) REFERENCES riwi_service_type(service_type_id)
);
