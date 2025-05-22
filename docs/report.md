
# SQL Optimization Project — F_WORKS_LIST (PostgreSQL)

本项目为数据库优化课程作业，目标是优化订单列表查询函数 `f_works_list`，在 PostgreSQL 环境中实现高性能查询。

## 📁 项目结构
- `sql/1_create_tables.sql`：建表语句
- `sql/2_insert_test_data.sql`：使用 generate_series 批量插入数据
- `sql/3_create_indexes.sql`：索引语句
- `sql/4_function_or_view.sql`：订单列表视图定义
- `sql/5_queries.sql`：测试查询与 EXPLAIN
- `docs/report.md`：优化分析报告

---

## 📄 优化分析报告摘要

### 实验目标
优化函数 `f_works_list` 查询 3000 条订单及其明细项，使执行时间小于 1–2 秒。

### 数据规模
- `works`: 50,000 条订单
- `workitem`: 150,000 条明细
- `analiz`: 100 个分析项目
- `employee`: 50 名员工

### 初始查询性能
- 查询耗时：**106ms**
- 使用 Hash Join + Top-N Heapsort
- 无索引，全表扫描

### 优化措施
- 添加索引：
  ```sql
  CREATE INDEX idx_works_date_created ON works(date_created);
  CREATE INDEX idx_workitem_workid ON workitem(work_id);
  CREATE INDEX idx_workitem_analizid ON workitem(analiz_id);
  CREATE INDEX idx_workitem_employeeid ON workitem(employee_id);
  ```

### 优化后性能
- 查询耗时：**8.6ms**
- PostgreSQL 使用 Nested Loop + Memoize + Index Scan
- 提升比例：>12x

### 使用 LLM 辅助（prompt）
```
Optimize a PostgreSQL view selecting top 3000 orders with join to workitem, analiz, and employee.
Avoid subqueries, use proper indexes, and ensure <1s runtime for 150,000 records.
```

---

## 📌 总结
本项目以 PostgreSQL 环境为基础，在不修改表结构的前提下完成了函数优化任务，达到了远优于要求的执行时间表现（8ms vs 2秒）。
