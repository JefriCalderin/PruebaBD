# TechCare Solutions - Database Project

## Project Description
Relational database designed for TechCare Solutions Riwi S.A.S., a company specialized in preventive and corrective maintenance services for technological equipment. This project transforms an unnormalized Excel file into a normalized relational database that guarantees data integrity and facilitates business report generation.

## Technologies Used
- PostgreSQL 17
- Docker & Docker Compose

## Database Engine
PostgreSQL 17 running in a Docker container.

## Database Name
bd_Jefri_Calderin_Cortissoz

## Normalization Process

### Initial State
The original data was a single Excel sheet (Dataset_TechCare) with 11 columns and 20 records containing information about clients, cities, branches, technicians, equipment, and services.

### Problems Found
1. **Duplicate clients**: Same client registered with different names (e.g., "Acme Ltd" vs "ACME LTDA", "Innova SAS" vs "Innova S.A.S.")
2. **Inconsistent cities**: Same city written differently (e.g., "Bogotá" vs "Bogota", "Cúcuta" vs "Cucuta", "B/manga" vs "Bucaramanga")
3. **Inconsistent branches**: Same branch with different names (e.g., "North Office" vs "Office North", "Main" vs "Main Office")
4. **Duplicate technicians**: Same technician with abbreviated names (e.g., "Juan Perez" vs "J. Perez" vs "J Perez")
5. **Inconsistent equipment**: Same equipment described differently (e.g., "Dell Latitude 5420" vs "Latitude 5420" vs "Dell 5420")
6. **Repeated categories**: Same category with singular/plural variations (e.g., "Laptop" vs "Laptops", "Desktop" vs "Desktops")
7. **Inconsistent service types**: Same service described differently (e.g., "Preventive" vs "Preventive Maintenance", "Corrective" vs "Repair")
8. **Redundant fields**: Client and city data repeated across multiple records

### Transformations

#### First Normal Form (1FN)
- The original table already had atomic values in each column
- No repeating groups were present
- Each record represented a single work order

#### Second Normal Form (2FN)
- Identified partial dependencies and separated them into entities
- Created independent tables for: city, client, branch, technician, equipment category, equipment, and service type
- Each table has its own primary key

#### Third Normal Form (3FN)
- Removed transitive dependencies
- City depends only on branch, not on client
- Equipment category depends only on equipment, not on work order
- Branch depends on client and city separately

### Final Normalized Tables
| Table | Description |
|-------|-------------|
| riwi_city | Cities where branches are located |
| riwi_client | Client companies |
| riwi_branch | Client branches (offices/sedes) |
| riwi_technician | Technical staff |
| riwi_equipment_category | Equipment categories |
| riwi_equipment | Technological equipment |
| riwi_service_type | Types of services offered |
| riwi_work_order | Service orders (main transaction table) |


## Database Creation Instructions

### 1. Start PostgreSQL with Docker Compose
```bash
docker compose up -d
```

### 2. Connect to the database
```bash
psql -h localhost -p 5482 -U jefrical -d bd_simunew
```
Password: cortissoz2026

### 3. Execute the scripts in order
```bash
psql -h localhost -p 5482 -U jefrical -d bd_simunew -f 1-ddl.sql
psql -h localhost -p 5482 -U jefrical -d bd_simunew -f 2-cargar datos.sql
psql -h localhost -p 5482 -U jefrical -d bd_simunew -f 3-DML.sql
psql -h localhost -p 5482 -U jefrical -d bd_simunew -f 4-DQL.sql
psql -h localhost -p 5482 -U jefrical -d bd_simunew -f 5-PuntosExtras.sql
```

## Data Loading Instructions
Data is loaded via SQL INSERT statements in `2-cargar datos.sql`. The script inserts normalized records into all 8 tables, resolving all inconsistencies found in the original Excel file.

## SQL Queries

### Query 1: Orders by technician
Counts how many orders each technician has attended. Helps distribute workload.

### Query 2: Services by city
Shows the number of services performed in each city. Helps regional planning.

### Query 3: Services by type
Counts total services grouped by service type. Identifies most requested services.

### Query 4: Equipment with most maintenance
Lists equipment with the highest service frequency. Helps identify recurring issues.

### Query 5: Clients with most orders
Shows clients with the highest service demand. Supports loyalty strategies.

### Query 6: Orders by branch
Counts orders per branch. Helps plan resources and staffing.

## Bonus Features
- **vw_technician_workload**: View showing each technician's total orders, hours, and revenue
- **vw_monthly_service_summary**: View with monthly service metrics
- **fn_get_technicians(INT)**: Function that returns a specific technician (if ID provided) or all technicians (if NULL)

## Developer Information
- Full Name: Jefri Calderin
- Clan: Cortissoz
