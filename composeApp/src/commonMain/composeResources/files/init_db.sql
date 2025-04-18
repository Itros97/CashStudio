-- Tabla de usuarios
CREATE TABLE IF NOT EXISTS User (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

-- Tabla de items (cada ítem pertenece directamente a un usuario)
CREATE TABLE IF NOT EXISTS Item (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    description TEXT,
    category_id INTEGER,
    current_stock INTEGER NOT NULL DEFAULT 1,
    unitary_price REAL NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(id) ON DELETE CASCADE
);

-- Tabla de eventos
CREATE TABLE IF NOT EXISTS Event (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT,
    start_timestamp BIGINT,
    end_timestamp BIGINT,
    type TEXT,
);

-- Tabla intermedia: qué ítems están disponibles en qué evento
CREATE TABLE IF NOT EXISTS Event_item (
    event_id INTEGER NOT NULL,
    item_id INTEGER NOT NULL,
    current_stock INTEGER NOT NULL DEFAULT 1,
    unitary_price REAL NOT NULL,
    PRIMARY KEY (evento_id, item_id),
    FOREIGN KEY (evento_id) REFERENCES eventos(id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE
);

-- Tabla de ventas: registro detallado de cada venta
CREATE TABLE IF NOT EXISTS Sell (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    event_id INTEGER NOT NULL,
    item_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    unitary_price REAL NOT NULL,
    sale_timestamp LONG DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (evento_id) REFERENCES eventos(id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE
);
