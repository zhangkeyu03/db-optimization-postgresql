
CREATE INDEX idx_works_date_created ON works(date_created);
CREATE INDEX idx_workitem_workid ON workitem(work_id);
CREATE INDEX idx_workitem_analizid ON workitem(analiz_id);
CREATE INDEX idx_workitem_employeeid ON workitem(employee_id);
