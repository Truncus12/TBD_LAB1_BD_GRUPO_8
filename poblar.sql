-- Crea los estados de tarea
INSERT INTO Estado_Tarea (id, descripcion)
VALUES (1, 'Pendiente'), (2, 'Terminada'), (3, 'Cancelada');

-- Crea voluntarios
INSERT INTO Voluntario (id, nombre, correo, contrasena)
VALUES (1,'Juan', 'juan@gmail.com', '1234'),
		(2, 'Andrea', 'andrea2@gmail.com', 'contrasena00'),
		(3, 'Martin', 'martin@gmail.com', '1999'),
		(4, 'Catalina', 'catal1n4@gmail.com', 'anilatac1');

-- Crea institucion
INSERT INTO Institucion (id, descripcion)
VALUES (1,'Equipo de respuestas USACH'),
		(2, 'Equipo de respuesta Metropolitano'),
    	(3, 'Centro comunitario local'),
    	(4, 'Cruz roja');

-- Crea coordinador
INSERT INTO Coordinador (id, nombre, correo, contrasena, institucion_asociada)
VALUES (1,'Pedro', 'pedro@gmail.com', '123', 1),
		(2, 'Maria', 'maria@gmail.com', '456', 2),
      	(3, 'John', 'john@gmail.com', '789', 3),
       	(4, 'Linda', 'linda@gmail.com', '123', 4);

-- Crea las emergencia
INSERT INTO Emergencia (id,nombre,descripcion,fecha_inicio,fecha_fin,coordinador_asociado)
VALUES (1,'Mover arbol', 'Un arbol cayo y bloqueo una calle', '2023-10-23', '2023-10-24', 1),
		(2, 'Inundacion', 'Fuerte lluvias inundaron un vecindario', '2023-10-25', '2023-10-26', 2),
      	(3, 'Comuna sin electricidad', 'No hay electricidad en Estacion Central', '2023-10-27', '2023-10-28', 3),
      	(4, 'Terremoto', 'Un terremoto boto varios semaforos', '2023-10-29', '2023-10-30', 4);

-- Crea la tarea
INSERT INTO Tarea (id, nombre, descripcion, cant_vol_requeridos, cant_vol_inscritos, fecha_inicio, fecha_fin,
					estado_actual,id_emergencia)
VALUES (1,'conducir', 'conducir hasta donde cayo el arbol', 1, 0, '2023-10-23','2023-10-24','pendiente',1),
		(2, 'Rescate', 'Busqueda y rescate de victimas de inundacion', 5, 0, '2023-10-25', '2023-10-26', 'pendiente', 2),
       	(3, 'Crear refugio', 'Montar refugios temporales', 10, 0, '2023-10-27', '2023-10-28', 'pendiente', 3),
       	(4, 'Primeros auxilios', 'Primeros auxilios a personas afectadas por el terremoto', 8, 0, '2023-10-29', '2023-10-30', 'pendiente', 4);


-- Crea tarea x voluntario
INSERT INTO Tarea_X_Voluntario (id_tarea, id_voluntario, estado)
VALUES (1,1,1),
		(2, 2, 1),
       	(2, 3, 2),
       	(3, 4, 1),
       	(4, 2, 1),
       	(4, 3, 3),
       	(4, 4, 1);
