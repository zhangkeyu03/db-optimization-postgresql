
-- Вставьте проект анализа
INSERT INTO analiz (analiz_name)
SELECT 'Analiz_' || i FROM generate_series(1, 100) AS i;

-- Вставьте информацию о сотруднике
INSERT INTO employee (full_name)
SELECT 'Employee_' || i FROM generate_series(1, 50) AS i;

-- Введите 50 000 заказов
INSERT INTO works (date_created, patient_name, is_deleted)
SELECT 
    NOW() - (random() * INTERVAL '365 days'),
    'Patient_' || floor(random() * 9000 + 1000)::int,
    CASE WHEN random() > 0.05 THEN FALSE ELSE TRUE END
FROM generate_series(1, 50000);

-- Вставьте 150 000 позиций
INSERT INTO workitem (work_id, analiz_id, employee_id)
SELECT 
    ((g - 1) / 3 + 1) AS work_id,
    FLOOR(random() * 100 + 1)::int,
    FLOOR(random() * 50 + 1)::int
FROM generate_series(1, 150000) AS g;
