DROP TABLE IF EXISTS inventory;

CREATE TABLE inventory (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    description TEXT NOT NULL,
    quantity INTEGER NOT NULL,
    unit TEXT NOT NULL,
    unit_price REAL NOT NULL
);
