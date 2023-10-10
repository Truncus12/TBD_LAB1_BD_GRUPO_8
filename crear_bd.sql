CREATE OR REPLACE TABLE Voluntario (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    correo VARCHAR(257) NOT NULL
    contrasena VARCHAR(257) NOT NULL,
);

CREATE OR REPLACE TABLE Habilidad{
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
};

CREATE OR REPLACE TABLE Institucion{
    id SERIAL PRIMARY KEY,
    descripcion TEXT
};

CREATE OR REPLACE TABLE Emergencia{
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    id_institucion BIGINT NOT NULL REFERENCES Institucion(id)
};

CREATE OR REPLACE TABLE Tarea (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    cant_vol_req INT,
    cant_vol_ins INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    estado_actual CHAR,
    id_emergencia BIGINT NOT NULL REFERENCES Emergencia(id)
);

CREATE OR REPLACE TABLE Estado_Tarea{
    id SERIAL PRIMARY KEY,
    descripcion TEXT,
    id_tarea BIGINT NOT NULL REFERENCES Tarea(id)
};

CREATE OR REPLACE TABLE Ranking{
    id SERIAL PRIMARY KEY,
    puntaje INT,
    flag_invitado BOOLEAN,
    flag_participa BOOLEAN,
    id_tarea BIGINT NOT NULL REFERENCES Tarea(id),
    id_voluntario BIGINT NOT NULL REFERENCES Voluntario(id)
};

CREATE OR REPLACE TABLE Vol_Habilidad{
    id_habilidad BIGINT NOT NULL REFERENCES Habilidad(id),
    id_voluntario BIGINT NOT NULL REFERENCES Voluntario(id)
};

CREATE OR REPLACE TABLE Eme_Habilidad{
    id_emergencia BIGINT NOT NULL REFERENCES Emergencia(id),
    id_habilidad BIGINT NOT NULL REFERENCES Habilidad(id)
};

CREATE OR REPLACE TABLE Tarea_Habilidad{
    id_emergencia BIGINT NOT NULL REFERENCES Emergencia(id),
    id_habilidad BIGINT NOT NULL REFERENCES Habilidad(id),
    id_tarea BIGINT NOT NULL REFERENCES Tarea(id)
};