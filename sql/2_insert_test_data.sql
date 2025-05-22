
-- 插入分析项目
INSERT INTO analiz (analiz_name)
SELECT 'Analiz_' || i FROM generate_series(1, 100) AS i;

-- 插入员工信息
INSERT INTO employee (full_name)
SELECT 'Employee_' || i FROM generate_series(1, 50) AS i;

-- 插入 50,000 条订单
INSERT INTO works (date_created, patient_name, is_deleted)
SELECT 
    NOW() - (random() * INTERVAL '365 days'),
    'Patient_' || floor(random() * 9000 + 1000)::int,
    CASE WHEN random() > 0.05 THEN FALSE ELSE TRUE END
FROM generate_series(1, 50000);

-- 插入 150,000 条订单项
INSERT INTO workitem (work_id, analiz_id, employee_id)
SELECT 
    ((g - 1) / 3 + 1) AS work_id,
    FLOOR(random() * 100 + 1)::int,
    FLOOR(random() * 50 + 1)::int
FROM generate_series(1, 150000) AS g;
