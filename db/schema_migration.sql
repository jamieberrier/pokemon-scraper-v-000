-- Write your sql commands to create your db schema here.
-- It should create a table in a new table in the db/ directory.
DB = {:conn => SQLite3::Database.new("db/students.db")}

CREATE TABLE pokemon (
  id INTEGER PRIMARY KEY,
    name TEXT,
    type TEXT
);
