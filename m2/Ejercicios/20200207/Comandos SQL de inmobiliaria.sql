ALTER TABLE empleados
ADD CONSTRAINT empleados_fecha_naci_CHK
CHECK (current_date >= fecha_naci_emp);