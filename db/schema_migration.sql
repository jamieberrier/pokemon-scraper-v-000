-- Write your sql commands to create your db schema here.
-- It should create a table in a new table in the db/ directory.
-- ALTER TABLE pokemon ADD COLUMN hp INTEGER DEFAULT 60;
CREATE TABLE pokemon (
  id INTEGER PRIMARY KEY,
    name TEXT,
    type TEXT
);
