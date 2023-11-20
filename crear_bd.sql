CREATE EXTENSION postgis;
CREATE TABLE IF NOT EXISTS Institucion (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Coordinador (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    correo VARCHAR(257) NOT NULL,
    contrasena VARCHAR(257) NOT NULL,
    institucion_asociada BIGINT NOT NULL REFERENCES Institucion(id)
);

CREATE TABLE IF NOT EXISTS Voluntario (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    correo VARCHAR(257) NOT NULL,
    contrasena VARCHAR(257) NOT NULL,
	geom GEOMETRY(Point, 4326)
);

CREATE TABLE IF NOT EXISTS Habilidad (
    id SERIAL PRIMARY KEY,
    descripcion VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Emergencia (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE DEFAULT(NULL),
    coordinador_asociado BIGINT NOT NULL REFERENCES Coordinador(id),
	geom GEOMETRY(Point, 4326)
);

CREATE TABLE IF NOT EXISTS Estado_Tarea (
    id INT PRIMARY KEY,
    descripcion TEXT
);

CREATE TABLE IF NOT EXISTS Tarea (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    cant_vol_requeridos INT,
    cant_vol_inscritos INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    estado_actual VARCHAR(50),
    id_emergencia BIGINT NOT NULL REFERENCES Emergencia(id),
	geom GEOMETRY(Point, 4326)
);

CREATE TABLE IF NOT EXISTS Tarea_X_Voluntario (
    id_tarea BIGINT NOT NULL REFERENCES Tarea(id),
    id_voluntario BIGINT NOT NULL REFERENCES Voluntario(id),
    estado INT NOT NULL DEFAULT(1) REFERENCES Estado_Tarea(id),
    PRIMARY KEY(id_tarea, id_voluntario)
);

CREATE TABLE IF NOT EXISTS Ranking (
    id SERIAL PRIMARY KEY,
    puntaje INT,
    flag_invitado BOOLEAN,
    flag_participa BOOLEAN,
    id_tarea BIGINT NOT NULL REFERENCES Tarea(id),
    id_voluntario BIGINT NOT NULL REFERENCES Voluntario(id)
);

CREATE TABLE IF NOT EXISTS Vol_Habilidad (
    id_habilidad BIGINT NOT NULL REFERENCES Habilidad(id),
    id_voluntario BIGINT NOT NULL REFERENCES Voluntario(id)
);

CREATE TABLE IF NOT EXISTS Eme_Habilidad (
    id_emergencia BIGINT NOT NULL REFERENCES Emergencia(id),
    id_habilidad BIGINT NOT NULL REFERENCES Habilidad(id)
);

CREATE TABLE IF NOT EXISTS Tarea_Habilidad (
    id_emergencia BIGINT NOT NULL REFERENCES Emergencia(id),
    id_habilidad BIGINT NOT NULL REFERENCES Habilidad(id),
    id_tarea BIGINT NOT NULL REFERENCES Tarea(id)
);