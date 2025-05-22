
CREATE OR REPLACE VIEW f_works_list AS
SELECT
    w.id AS work_id,
    w.date_created,
    w.patient_name,
    wi.id AS workitem_id,
    a.analiz_name,
    e.full_name AS employee
FROM works w
JOIN workitem wi ON wi.work_id = w.id
LEFT JOIN analiz a ON wi.analiz_id = a.id
LEFT JOIN employee e ON wi.employee_id = e.id
WHERE w.is_deleted = FALSE
ORDER BY w.date_created DESC
LIMIT 3000;
