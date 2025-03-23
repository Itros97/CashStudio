-- Tabla de usuarios
CREATE TABLE IF NOT EXISTS User (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

-- Tabla de items (cada ítem pertenece directamente a un usuario)
CREATE TABLE IF NOT EXISTS Item (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    usuario_id INTEGER NOT NULL,
    nombre TEXT NOT NULL,
    descripcion TEXT,
    categoria TEXT,
    cantidad INTEGER NOT NULL DEFAULT 1,
    precio_unitario REAL NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

-- Tabla de eventos
CREATE TABLE IF NOT EXISTS Event (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT NOT NULL,
    descripcion TEXT,
    inicio BIGINT 
    tipo TEXT,
);

-- Tabla intermedia: qué ítems están disponibles en qué evento
CREATE TABLE IF NOT EXISTS Event_item (
    evento_id INTEGER NOT NULL,
    item_id INTEGER NOT NULL,
    cantidad_disponible INTEGER NOT NULL DEFAULT 1,
    precio_unitario REAL NOT NULL,
    PRIMARY KEY (evento_id, item_id),
    FOREIGN KEY (evento_id) REFERENCES eventos(id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE
);

-- Tabla de ventas: registro detallado de cada venta
CREATE TABLE IF NOT EXISTS Sell (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    usuario_id INTEGER NOT NULL,
    evento_id INTEGER NOT NULL,
    item_id INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    precio_unitario REAL NOT NULL,
    fecha TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (evento_id) REFERENCES eventos(id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES items(id) ON DELETE CASCADE
);
