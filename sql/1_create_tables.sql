
CREATE TABLE IF NOT EXISTS works (
    id SERIAL PRIMARY KEY,
    date_created TIMESTAMP NOT NULL,
    patient_name TEXT,
    is_deleted BOOLEAN DEFAULT FALSE
);
CREATE TABLE IF NOT EXISTS analiz (
    id SERIAL PRIMARY KEY,
    analiz_name TEXT
);
CREATE TABLE IF NOT EXISTS employee (
    id SERIAL PRIMARY KEY,
    full_name TEXT
);
CREATE TABLE IF NOT EXISTS workitem (
    id SERIAL PRIMARY KEY,
    work_id INTEGER REFERENCES works(id),
    analiz_id INTEGER REFERENCES analiz(id),
    employee_id INTEGER REFERENCES employee(id)
);
