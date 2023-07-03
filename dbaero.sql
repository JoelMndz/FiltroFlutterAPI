CREATE DATABASE aero;

USE aero;

CREATE TABLE AEROLINEA (
  idaerolinea INT PRIMARY KEY,
  ruc VARCHAR(20),
  nombre VARCHAR(50)
);

CREATE TABLE PAIS (
  idpais INT PRIMARY KEY,
  nombre VARCHAR(50)
);

CREATE TABLE AEROPUERTO (
  idaeropuerto INT PRIMARY KEY,
  nombre VARCHAR(50),
  idpais INT,
  FOREIGN KEY (idpais) REFERENCES PAIS(idpais)
);

CREATE TABLE AVION (
  idavion INT PRIMARY KEY,
  idaerolinea INT,
  fabricante VARCHAR(50),
  tipo VARCHAR(50),
  capacidad INT,
  FOREIGN KEY (idaerolinea) REFERENCES AEROLINEA(idaerolinea)
);

CREATE TABLE ASIENTO (
  idasiento INT PRIMARY KEY,
  letra CHAR(1),
  fila INT
);

CREATE TABLE TARIFA (
  idtarifa INT PRIMARY KEY,
  clase VARCHAR(50),
  precio DECIMAL(10, 2),
  impuesto DECIMAL(10, 2)
);

CREATE TABLE RESERVA (
  idreserva INT PRIMARY KEY,
  costo DECIMAL(10, 2),
  fecha DATE,
  observacion VARCHAR(100)
);

CREATE TABLE VUELO (
  idasiento INT,
  idaeropuerto INT,
  idreserva INT,
  idavion INT,
  idtarifa INT,
  FOREIGN KEY (idasiento) REFERENCES ASIENTO(idasiento),
  FOREIGN KEY (idaeropuerto) REFERENCES AEROPUERTO(idaeropuerto),
  FOREIGN KEY (idreserva) REFERENCES RESERVA(idreserva),
  FOREIGN KEY (idavion) REFERENCES AVION(idavion),
  FOREIGN KEY (idtarifa) REFERENCES TARIFA(idtarifa)
);

CREATE TABLE PASAJERO (
  idpasajero INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(50),
  apaterno VARCHAR(50),
  amaterno VARCHAR(50),
  tipo_documento VARCHAR(20),
  num_documento VARCHAR(20),
  fecha_nacimiento DATE,
  idpais INT,
  telefono VARCHAR(20),
  email VARCHAR(100),
  clave VARCHAR(50),
  FOREIGN KEY (idpais) REFERENCES PAIS(idpais)
);

CREATE TABLE PAGO (
  idpago INT PRIMARY KEY,
  idreserva INT,
  fecha DATE,
  idpasajero INT,
  monto DECIMAL(10, 2),
  tipo_comprobante VARCHAR(50),
  num_comprobante VARCHAR(50),
  impuesto DECIMAL(10, 2),
  FOREIGN KEY (idreserva) REFERENCES RESERVA(idreserva),
  FOREIGN KEY (idpasajero) REFERENCES PASAJERO(idpasajero)
);


INSERT INTO AEROLINEA (idaerolinea, nombre, ruc) VALUES (1, 'LATAM Airlines', '123456789');
INSERT INTO AEROLINEA (idaerolinea, nombre, ruc) VALUES (2, 'Avianca', '987654321');
INSERT INTO AEROLINEA (idaerolinea, nombre, ruc) VALUES (3, 'GOL Linhas Aéreas', '456789123');
INSERT INTO AEROLINEA (idaerolinea, nombre, ruc) VALUES (4, 'Aerolíneas Argentinas', '321654987');
INSERT INTO AEROLINEA (idaerolinea, nombre, ruc) VALUES (5, 'TAM Airlines', '789123456');
INSERT INTO AEROLINEA (idaerolinea, nombre, ruc) VALUES (6, 'Aeroméxico', '654987321');

-- Declarar variables
DECLARE @fila INT;
DECLARE @letra CHAR(1);
DECLARE @idasiento INT;
-- Inicializar variables
SET @fila = 1;
SET @idasiento = 1;
-- Bucle para generar los asientos
WHILE @fila <= 25
BEGIN
  SET @letra = 'A';
  WHILE @letra <= 'F'
  BEGIN
    INSERT INTO Asiento (idasiento, letra, fila)
    VALUES (@idasiento, @letra, @fila);
    SET @letra = CHAR(ASCII(@letra) + 1);
    SET @idasiento = @idasiento + 1;
  END
  SET @fila = @fila + 1;
END

INSERT INTO Tarifa (idtarifa, clase, precio, impuesto) VALUES
(1, 'Económica', 100.00, 10.00),
(2, 'Premium', 250.00, 20.00),
(3, 'Business', 500.00, 40.00),
(4, 'Primera Clase', 1000.00, 80.00);

INSERT INTO Reserva (idreserva, costo, fecha, observacion) VALUES
(1, 245.50, '2023-06-01', 'Reserva de vuelo a Miami'),
(2, 320.00, '2023-06-02', 'Reserva de vuelo a Londres'),
(3, 185.75, '2023-06-03', 'Reserva de vuelo a Cancún'),
(4, 410.25, '2023-06-04', 'Reserva de vuelo a Nueva York'),
(5, 275.00, '2023-06-05', 'Reserva de vuelo a París'),
(6, 198.50, '2023-06-06', 'Reserva de vuelo a Barcelona'),
(7, 305.00, '2023-06-07', 'Reserva de vuelo a Roma'),
(8, 175.75, '2023-06-08', 'Reserva de vuelo a Bangkok'),
(9, 390.25, '2023-06-09', 'Reserva de vuelo a Tokio'),
(10, 280.00, '2023-06-10', 'Reserva de vuelo a Buenos Aires'),
(11, 225.50, '2023-06-11', 'Reserva de vuelo a Ámsterdam'),
(12, 345.00, '2023-06-12', 'Reserva de vuelo a Sydney'),
(13, 165.75, '2023-06-13', 'Reserva de vuelo a Dubai'),
(14, 275.25, '2023-06-14', 'Reserva de vuelo a Ciudad de México'),
(15, 310.00, '2023-06-15', 'Reserva de vuelo a Berlín'),
(16, 195.50, '2023-06-16', 'Reserva de vuelo a Estambul'),
(17, 380.00, '2023-06-17', 'Reserva de vuelo a Vancouver'),
(18, 185.75, '2023-06-18', 'Reserva de vuelo a Río de Janeiro'),
(19, 315.25, '2023-06-19', 'Reserva de vuelo a Singapur'),
(20, 260.00, '2023-06-20', 'Reserva de vuelo a Atenas'),
(21, 235.50, '2023-06-21', 'Reserva de vuelo a Santiago'),
(22, 410.00, '2023-06-22', 'Reserva de vuelo a Hanoi');

INSERT INTO Pais (idpais, nombre) VALUES
(1, 'Argentina'),
(2, 'Brasil'),
(3, 'Chile'),
(4, 'Colombia'),
(5, 'Ecuador'),
(6, 'Estados Unidos'),
(7, 'Canadá'),
(8, 'México'),
(9, 'Perú'),
(10, 'Uruguay'),
(11, 'China'),
(12, 'Japón'),
(13, 'India'),
(14, 'Corea del Sur'),
(15, 'Tailandia');

INSERT INTO Avion (idavion, idaerolinea, fabricante, tipo, capacidad) VALUES
(1, 1, 'Boeing', '737', 150),
(2, 1, 'Airbus', 'A320', 180),
(3, 2, 'Embraer', 'E190', 100),
(4, 2, 'Bombardier', 'CRJ900', 90),
(5, 3, 'Boeing', '787', 250),
(6, 3, 'Airbus', 'A350', 300),
(7, 4, 'Embraer', 'E175', 80),
(8, 4, 'Bombardier', 'CRJ700', 70),
(9, 5, 'Boeing', '777', 350),
(10, 5, 'Airbus', 'A330', 300),
(11, 6, 'Boeing', '747', 400),
(12, 6, 'Airbus', 'A380', 500),
(13, 1, 'Boeing', '767', 250),
(14, 1, 'Airbus', 'A340', 350),
(15, 2, 'Embraer', 'E195', 110),
(16, 2, 'Bombardier', 'CRJ1000', 100),
(17, 3, 'Boeing', '757', 200),
(18, 3, 'Airbus', 'A321', 220),
(19, 4, 'Embraer', 'E190', 100),
(20, 4, 'Bombardier', 'CRJ900', 90),
(21, 5, 'Boeing', '787', 250),
(22, 5, 'Airbus', 'A350', 300),
(23, 6, 'Boeing', '747', 400),
(24, 6, 'Airbus', 'A380', 500),
(25, 1, 'Boeing', '767', 250),
(26, 1, 'Airbus', 'A340', 350),
(27, 2, 'Embraer', 'E195', 110),
(28, 2, 'Bombardier', 'CRJ1000', 100),
(29, 3, 'Boeing', '757', 200),
(30, 3, 'Airbus', 'A321', 220);

INSERT INTO AEROPUERTO (idaeropuerto, nombre, idpais) VALUES
(1, 'Aeropuerto Internacional de Buenos Aires', 1),
(2, 'Aeropuerto Internacional de Río de Janeiro', 2),
(3, 'Aeropuerto Internacional de Santiago', 3),
(4, 'Aeropuerto Internacional El Dorado', 4),
(5, 'Aeropuerto Internacional Mariscal Sucre', 5),
(6, 'Aeropuerto Internacional de Los Ángeles', 6),
(7, 'Aeropuerto Internacional de Toronto', 7),
(8, 'Aeropuerto Internacional de la Ciudad de México', 8),
(9, 'Aeropuerto Internacional Jorge Chávez', 9),
(10, 'Aeropuerto Internacional de Montevideo', 10),
(11, 'Aeropuerto Internacional de Pekín', 11),
(12, 'Aeropuerto Internacional de Tokio', 12),
(13, 'Aeropuerto Internacional Indira Gandhi', 13),
(14, 'Aeropuerto Internacional de Incheon', 14),
(15, 'Aeropuerto Internacional de Bangkok', 15);

INSERT INTO PASAJERO (nombre, apaterno, amaterno, tipo_documento, num_documento, fecha_nacimiento, idpais, telefono, email, clave)
VALUES
('Sofía', 'García', 'López', 'Pasaporte', 'AB123456', '1990-01-15', 1, '11111111', 'sofia@example.com', 'mypassword123'),
('Lucas', 'Rodríguez', 'Fernández', 'DNI', '65432109', '1988-06-30', 2, '22222222', 'lucas@example.com', 'password456'),
('Martina', 'Gómez', 'Martínez', 'Cédula', '98765432', '1992-12-12', 3, '33333333', 'martina@example.com', 'securepass789'),
('Benjamín', 'López', 'Gutiérrez', 'Pasaporte', 'CD456789', '1989-07-25', 4, '44444444', 'benjamin@example.com', 'mypassword123'),
('Valentina', 'Sánchez', 'Hernández', 'DNI', '54321098', '1994-02-08', 5, '55555555', 'valentina@example.com', 'password456'),
('Mateo', 'Hernández', 'López', 'Cédula', '87654321', '1991-09-23', 6, '66666666', 'mateo@example.com', 'securepass789'),
('Isabella', 'Gómez', 'Martínez', 'Pasaporte', 'EF123456', '1987-04-07', 7, '77777777', 'isabella@example.com', 'mypassword123'),
('Lucía', 'Rodríguez', 'López', 'DNI', '10987654', '1993-11-22', 8, '88888888', 'lucia@example.com', 'password456'),
('Santiago', 'Martínez', 'Gutiérrez', 'Cédula', '43210987', '1989-06-05', 9, '99999999', 'santiago@example.com', 'securepass789'),
('Emma', 'Sánchez', 'Hernández', 'Pasaporte', 'GH456789', '1995-01-20', 10, '11111111', 'emma@example.com', 'mypassword123'),
('Sebastián', 'López', 'Gómez', 'DNI', '54321098', '1991-08-04', 11, '22222222', 'sebastian@example.com', 'password456'),
('Valeria', 'Martínez', 'López', 'Cédula', '56789012', '1997-03-21', 12, '33333333', 'valeria@example.com', 'securepass789'),
('Nicolás', 'Sánchez', 'Gutiérrez', 'Pasaporte', 'IJ345678', '1995-10-06', 13, '44444444', 'nicolas@example.com', 'mypassword123'),
('Joaquín', 'Hernández', 'López', 'DNI', '23456789', '1993-05-22', 14, '55555555', 'joaquin@example.com', 'password456'),
('Isabella', 'Gómez', 'Martínez', 'Cédula', '09876543', '1991-12-09', 15, '66666666', 'isabella@example.com', 'securepass789'),
('Emilia', 'Rodríguez', 'Fernández', 'Pasaporte', 'KL456789', '1999-07-26', 1, '77777777', 'emilia@example.com', 'mypassword123'),
('Daniel', 'García', 'López', 'DNI', '65432109', '1997-02-12', 2, '88888888', 'daniel@example.com', 'password456'),
('Valentina', 'Sánchez', 'Martínez', 'Cédula', '98765432', '1994-09-28', 3, '99999999', 'valentina@example.com', 'securepass789'),
('Benjamín', 'López', 'Hernández', 'Pasaporte', 'MN123456', '1988-04-14', 4, '11111111', 'benjamin@example.com', 'mypassword123'),
('Sofía', 'Gómez', 'Gutiérrez', 'DNI', '54321098', '1993-11-29', 5, '22222222', 'sofia@example.com', 'password456'),
('Lucas', 'Rodríguez', 'López', 'Cédula', '87654321', '1990-06-15', 6, '33333333', 'lucas@example.com', 'securepass789'),
('Martina', 'Hernández', 'Martínez', 'Pasaporte', 'OP456789', '1987-11-30', 7, '44444444', 'martina@example.com', 'mypassword123'),
('Benjamín', 'Sánchez', 'Gutiérrez', 'DNI', '10987654', '1995-06-16', 8, '55555555', 'benjamin@example.com', 'password456'),
('Valeria', 'López', 'Hernández', 'Cédula', '43210987', '1992-01-31', 9, '66666666', 'valeria@example.com', 'securepass789'),
('Santiago', 'Martínez', 'Gómez', 'Pasaporte', 'QR123456', '1989-09-17', 10, '77777777', 'santiago@example.com', 'mypassword123'),
('Emma', 'Sánchez', 'López', 'DNI', '54321098', '1995-04-04', 11, '88888888', 'emma@example.com', 'password456'),
('Sebastián', 'Gómez', 'Martínez', 'Cédula', '56789012', '1991-11-21', 12, '99999999', 'sebastian@example.com', 'securepass789'),
('Valentina', 'López', 'Gutiérrez', 'Pasaporte', 'ST345678', '1997-08-08', 13, '11111111', 'valentina@example.com', 'mypassword123'),
('Nicolás', 'Rodríguez', 'Hernández', 'DNI', '23456789', '1993-03-26', 14, '22222222', 'nicolas@example.com', 'password456'),
('Florencia', 'Gómez', 'López', 'Cédula', '56789012', '1999-10-13', 15, '33333333', 'florencia@example.com', 'securepass789'),
('Isabella', 'Sánchez', 'Martínez', 'Pasaporte', 'UV456789', '1998-05-30', 1, '44444444', 'isabella@example.com', 'mypassword123'),
('Joaquín', 'López', 'Hernández', 'DNI', '65432109', '1996-12-15', 2, '55555555', 'joaquin@example.com', 'password456'),
('Emilia', 'Rodríguez', 'Gutiérrez', 'Cédula', '98765432', '1993-07-31', 3, '66666666', 'emilia@example.com', 'securepass789'),
('Daniel', 'Hernández', 'Martínez', 'Pasaporte', 'WX123456', '1991-02-16', 4, '77777777', 'daniel@example.com', 'mypassword123'),
('Valentina', 'Sánchez', 'López', 'DNI', '54321098', '1997-09-03', 5, '88888888', 'valentina@example.com', 'password456'),
('Benjamín', 'Gómez', 'Gutiérrez', 'Cédula', '87654321', '1995-04-20', 6, '99999999', 'benjamin@example.com', 'securepass789'),
('Sofía', 'Rodríguez', 'Martínez', 'Pasaporte', 'YZ456789', '1992-11-05', 7, '11111111', 'sofia@example.com', 'mypassword123'),
('Lucas', 'López', 'Hernández', 'DNI', '10987654', '1990-06-21', 8, '22222222', 'lucas@example.com', 'password456'),
('Martina', 'Gómez', 'López', 'Cédula', '43210987', '1988-01-06', 9, '33333333', 'martina@example.com', 'securepass789'),
('Benjamín', 'Sánchez', 'Gutiérrez', 'Pasaporte', 'AB123456', '1986-08-23', 10, '44444444', 'benjamin@example.com', 'mypassword123'),
('Valeria', 'Hernández', 'Martínez', 'DNI', '54321098', '1994-03-10', 11, '55555555', 'valeria@example.com', 'password456'),
('Santiago', 'López', 'López', 'Cédula', '56789012', '1992-10-27', 12, '66666666', 'santiago@example.com', 'securepass789'),
('Emma', 'Martínez', 'Gutiérrez', 'Pasaporte', 'CD456789', '1990-05-12', 13, '77777777', 'emma@example.com', 'mypassword123'),
('Sebastián', 'Sánchez', 'Hernández', 'DNI', '65432109', '1988-12-29', 14, '88888888', 'sebastian@example.com', 'password456'),
('Valentina', 'Gómez', 'Martínez', 'Cédula', '98765432', '1987-07-14', 15, '99999999', 'valentina@example.com', 'securepass789');

INSERT INTO PAGO (idpago, idreserva, fecha, idpasajero, monto, tipo_comprobante, num_comprobante, impuesto) VALUES
(1, 1, '2023-06-01', 1, 150.00, 'Factura', 'FAC001', 20.00),
(2, 2, '2023-06-02', 2, 200.00, 'Boleta', 'BOL002', 25.00),
(3, 3, '2023-06-03', 3, 180.00, 'Factura', 'FAC003', 18.00),
(4, 4, '2023-06-04', 4, 250.00, 'Boleta', 'BOL004', 30.00),
(5, 5, '2023-06-05', 5, 190.00, 'Factura', 'FAC005', 19.00),
(6, 6, '2023-06-06', 6, 220.00, 'Boleta', 'BOL006', 26.00),
(7, 7, '2023-06-07', 7, 170.00, 'Factura', 'FAC007', 17.00),
(8, 8, '2023-06-08', 8, 240.00, 'Boleta', 'BOL008', 29.00),
(9, 9, '2023-06-09', 9, 200.00, 'Factura', 'FAC009', 20.00),
(10, 10, '2023-06-10', 10, 180.00, 'Boleta', 'BOL010', 18.00),
(11, 11, '2023-06-11', 11, 230.00, 'Factura', 'FAC011', 28.00),
(12, 12, '2023-06-12', 12, 160.00, 'Boleta', 'BOL012', 16.00),
(13, 13, '2023-06-13', 13, 210.00, 'Factura', 'FAC013', 21.00),
(14, 14, '2023-06-14', 14, 190.00, 'Boleta', 'BOL014', 19.00),
(15, 15, '2023-06-15', 15, 260.00, 'Factura', 'FAC015', 32.00),
(16, 16, '2023-06-16', 16, 170.00, 'Boleta', 'BOL016', 17.00),
(17, 17, '2023-06-17', 17, 240.00, 'Factura', 'FAC017', 29.00),
(18, 18, '2023-06-18', 18, 220.00, 'Boleta', 'BOL018', 26.00),
(19, 19, '2023-06-19', 19, 180.00, 'Factura', 'FAC019', 18.00),
(20, 20, '2023-06-20', 20, 200.00, 'Boleta', 'BOL020', 20.00),
(21, 21, '2023-06-21', 21, 250.00, 'Factura', 'FAC021', 30.00),
(22, 22, '2023-06-22', 22, 190.00, 'Boleta', 'BOL022', 19.00);

INSERT INTO VUELO (idasiento, idaeropuerto, idreserva, idavion, idtarifa) VALUES
(1, 1, 1, 1, 1),
(2, 2, 2, 2, 2),
(3, 3, 3, 3, 3),
(4, 4, 4, 4, 4),
(5, 5, 5, 5, 1),
(6, 6, 6, 6, 2),
(7, 7, 7, 7, 3),
(8, 8, 8, 8, 4),
(9, 9, 9, 9, 1),
(10, 10, 10, 10, 2),
(11, 11, 11, 11, 3),
(12, 12, 12, 12, 4),
(13, 13, 13, 13, 1),
(14, 14, 14, 14, 2),
(15, 15, 15, 15, 3),
(16, 1, 16, 16, 4),
(17, 2, 17, 17, 1),
(18, 3, 18, 18, 2),
(19, 4, 19, 19, 3),
(20, 5, 20, 20, 4),
(21, 6, 21, 21, 1),
(22, 7, 22, 22, 2),
(23, 8, 1, 23, 3),
(24, 9, 2, 24, 4),
(25, 10, 3, 25, 1),
(26, 11, 4, 26, 2),
(27, 12, 5, 27, 3),
(28, 13, 6, 28, 4),
(29, 14, 7, 29, 1),
(30, 15, 8, 30, 2),
(31, 1, 9, 1, 3),
(32, 2, 10, 2, 4),
(33, 3, 11, 3, 1),
(34, 4, 12, 4, 2),
(35, 5, 13, 5, 3),
(36, 6, 14, 6, 4),
(37, 7, 15, 7, 1),
(38, 8, 16, 8, 2),
(39, 9, 17, 9, 3),
(40, 10, 18, 10, 4),
(41, 11, 19, 11, 1),
(42, 12, 20, 12, 2),
(43, 13, 21, 13, 3),
(44, 14, 22, 14, 4),
(45, 15, 1, 15, 1),
(46, 1, 2, 16, 2),
(47, 2, 3, 17, 3),
(48, 3, 4, 18, 4),
(49, 4, 5, 19, 1),
(50, 5, 6, 20, 2),
(51, 6, 7, 21, 3),
(52, 7, 8, 22, 4),
(53, 8, 9, 23, 1),
(54, 9, 10, 24, 2),
(55, 10, 11, 25, 3),
(56, 11, 12, 26, 4),
(57, 12, 13, 27, 1),
(58, 13, 14, 28, 2),
(59, 14, 15, 29, 3),
(60, 15, 16, 30, 4),
(61, 1, 17, 1, 1),
(62, 2, 18, 2, 2),
(63, 3, 19, 3, 3),
(64, 4, 20, 4, 4),
(65, 5, 21, 5, 1),
(66, 6, 22, 6, 2),
(67, 7, 1, 7, 3),
(68, 8, 2, 8, 4),
(69, 9, 3, 9, 1),
(70, 10, 4, 10, 2),
(71, 11, 5, 11, 3),
(72, 12, 6, 12, 4),
(73, 13, 7, 13, 1),
(74, 14, 8, 14, 2),
(75, 15, 9, 15, 3),
(76, 1, 10, 16, 4),
(77, 2, 11, 17, 1),
(78, 3, 12, 18, 2),
(79, 4, 13, 19, 3),
(80, 5, 14, 20, 4),
(81, 6, 15, 21, 1),
(82, 7, 16, 22, 2),
(83, 8, 17, 23, 3),
(84, 9, 18, 24, 4),
(85, 10, 19, 25, 1),
(86, 11, 20, 26, 2),
(87, 12, 21, 27, 3),
(88, 13, 22, 28, 4),
(89, 14, 1, 29, 1),
(90, 15, 2, 30, 2),
(91, 1, 3, 1, 3),
(92, 2, 4, 2, 4),
(93, 3, 5, 3, 1),
(94, 4, 6, 4, 2),
(95, 5, 7, 5, 3),
(96, 6, 8, 6, 4),
(97, 7, 9, 7, 1),
(98, 8, 10, 8, 2),
(99, 9, 11, 9, 3),
(100, 10, 12, 10, 4),
(101, 11, 13, 11, 1),
(102, 12, 14, 12, 2),
(103, 13, 15, 13, 3),
(104, 14, 16, 14, 4),
(105, 15, 17, 15, 1),
(106, 1, 18, 16, 2),
(107, 2, 19, 17, 3),
(108, 3, 20, 18, 4),
(109, 4, 21, 19, 1),
(110, 5, 22, 20, 2),
(111, 6, 1, 21, 3),
(112, 7, 2, 22, 4),
(113, 8, 3, 23, 1),
(114, 9, 4, 24, 2),
(115, 10, 5, 25, 3),
(116, 11, 6, 26, 4),
(117, 12, 7, 27, 1),
(118, 13, 8, 28, 2),
(119, 14, 9, 29, 3),
(120, 15, 10, 30, 4),
(121, 1, 11, 1, 1),
(122, 2, 12, 2, 2),
(123, 3, 13, 3, 3),
(124, 4, 14, 4, 4),
(125, 5, 15, 5, 1),
(126, 6, 16, 6, 2),
(127, 7, 17, 7, 3),
(128, 8, 18, 8, 4),
(129, 9, 19, 9, 1),
(130, 10, 20, 10, 2),
(131, 11, 21, 11, 3),
(132, 12, 22, 12, 4),
(133, 13, 1, 13, 1),
(134, 14, 2, 14, 2),
(135, 15, 3, 15, 3),
(136, 1, 4, 16, 4),
(137, 2, 5, 17, 1),
(138, 3, 6, 18, 2),
(139, 4, 7, 19, 3),
(140, 5, 8, 20, 4),
(141, 6, 9, 21, 1),
(142, 7, 10, 22, 2),
(143, 8, 11, 23, 3),
(144, 9, 12, 24, 4),
(145, 10, 13, 25, 1),
(146, 11, 14, 26, 2),
(147, 12, 15, 27, 3),
(148, 13, 16, 28, 4),
(149, 14, 17, 29, 1),
(150, 15, 18, 30, 2),
(34, 4, 12, 4, 2),
(98, 8, 10, 8, 2),
(82, 7, 16, 22, 2),
(8, 8, 8, 8, 4),
(66, 6, 22, 6, 2),
(61, 1, 17, 1, 1),
(70, 10, 4, 10, 2),
(60, 15, 16, 30, 4),
(20, 5, 20, 20, 4),
(112, 7, 2, 22, 4),
(44, 14, 22, 14, 4),
(95, 5, 7, 5, 3),
(110, 5, 6, 20, 2),
(85, 10, 19, 25, 1),
(63, 3, 19, 3, 3),
(72, 12, 6, 12, 4),
(55, 10, 11, 25, 3),
(58, 13, 14, 28, 2),
(40, 10, 18, 10, 4),
(102, 12, 14, 12, 2),
(114, 9, 4, 24, 2),
(43, 13, 21, 13, 3),
(29, 14, 7, 29, 1),
(133, 13, 1, 13, 1),
(79, 4, 13, 19, 1),
(123, 3, 13, 3, 3),
(46, 1, 2, 16, 2),
(91, 1, 3, 1, 3),
(53, 8, 9, 23, 1),
(71, 11, 5, 11, 3),
(81, 6, 15, 21, 1),
(100, 10, 12, 10, 4),
(26, 11, 4, 26, 2),
(35, 5, 13, 5, 3),
(65, 5, 21, 5, 1),
(137, 2, 5, 17, 1),
(11, 11, 11, 11, 3),
(50, 5, 6, 20, 2),
(130, 10, 20, 10, 2),
(9, 9, 9, 9, 1),
(112, 7, 2, 22, 4),
(48, 3, 4, 18, 4),
(39, 9, 17, 9, 3),
(42, 12, 20, 12, 2),
(135, 15, 3, 15, 3),
(96, 6, 8, 6, 4),
(45, 7, 15, 5, 3),
(12, 5, 20, 8, 4),
(52, 11, 12, 26, 4),
(28, 13, 6, 28, 4),
(107, 2, 19, 17, 3),
(84, 9, 18, 24, 4),
(48, 3, 4, 18, 4),
(21, 6, 21, 21, 3),
(3, 3, 3, 3, 3),
(138, 3, 6, 18, 2),
(51, 6, 7, 21, 3),
(130, 10, 20, 10, 2),
(120, 15, 10, 30, 4),
(144, 9, 12, 24, 4),
(106, 1, 18, 16, 2),
(57, 12, 13, 27, 1),
(86, 11, 20, 26, 2),
(94, 4, 6, 4, 2),
(128, 8, 18, 8, 4),
(22, 7, 22, 22, 2),
(65, 5, 21, 5, 1),
(144, 13, 22, 28, 4),
(82, 7, 16, 22, 2),
(72, 12, 6, 12, 4),
(111, 6, 7, 11, 3),
(23, 8, 1, 23, 3),
(9, 9, 9, 9, 1),
(44, 14, 22, 14, 4),
(4, 4, 4, 4, 4),
(79, 4, 13, 19, 3),
(114, 9, 4, 24, 2),
(15, 15, 15, 15, 3),
(59, 14, 15, 29, 3),
(54, 9, 10, 24, 2),
(125, 5, 15, 5, 1),
(35, 5, 13, 5, 3),
(109, 4, 21, 19, 1),
(119, 14, 9, 29, 3),
(36, 6, 14, 6, 4),
(49, 4, 5, 19, 1),
(83, 8, 17, 23, 3),
(19, 4, 19, 19, 3),
(30, 15, 8, 30, 2),
(16, 1, 16, 16, 4),
(67, 7, 1, 7, 3),
(103, 13, 15, 13, 3),
(143, 8, 11, 23, 3),
(41, 11, 19, 11, 1),
(91, 1, 3, 1, 3),
(131, 11, 21, 11, 3),
(93, 3, 5, 3, 1),
(117, 12, 7, 27, 1),
(78, 3, 12, 18, 2),
(138, 3, 6, 18, 2),
(29, 14, 7, 29, 1),
(63, 3, 19, 3, 3),
(64, 4, 20, 4, 4),
(92, 2, 4, 2, 4),
(100, 10, 12, 10, 4),
(135, 15, 3, 15, 3),
(132, 12, 22, 12, 4),
(24, 9, 2, 24, 4),
(37, 7, 15, 7, 1),
(121, 1, 17, 1, 1),
(61, 1, 17, 1, 1),
(113, 8, 3, 23, 1),
(25, 10, 3, 25, 1),
(77, 2, 17, 17, 1),
(81, 6, 15, 21, 1),
(139, 4, 7, 19, 3),
(55, 10, 11, 25, 3),
(134, 14, 2, 14, 2),
(108, 3, 20, 18, 4),
(38, 8, 16, 8, 2),
(139, 4, 7, 19, 3),
(20, 5, 20, 20, 4),
(46, 1, 2, 16, 2),
(8, 8, 8, 8, 4),
(135, 15, 3, 15, 3),
(131, 11, 21, 11, 3),
(136, 1, 4, 16, 4),
(138, 3, 6, 18, 2),
(82, 7, 16, 22, 2),
(112, 7, 2, 22, 4),
(144, 9, 12, 24, 4),
(78, 3, 12, 18, 2),
(133, 13, 1, 13, 1),
(47, 2, 3, 17, 3),
(68, 8, 2, 8, 4),
(94, 4, 6, 4, 2),
(1, 1, 1, 1, 1),
(126, 6, 16, 6, 2),
(130, 10, 20, 10, 2),
(103, 13, 15, 13, 3),
(116, 11, 6, 26, 4),
(138, 3, 6, 18, 2),
(99, 9, 11, 9, 3),
(55, 10, 11, 25, 3);

INSERT INTO VUELO (idasiento, idaeropuerto, idreserva, idavion, idtarifa) VALUES
(1, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(2, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(3, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(4, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(5, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(6, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(7, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(8, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(9, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(10, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(11, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(12, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(13, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(14, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(15, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(16, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(17, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(18, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(19, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(20, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(21, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(22, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(23, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(24, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(25, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(26, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(27, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(28, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(29, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(30, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(31, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(32, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(33, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(34, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(35, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(36, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(37, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(38, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(39, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(40, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(41, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(42, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(43, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(44, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(45, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(46, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(47, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(48, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(49, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT)),
(50, CAST(RAND() * 15 + 1 AS INT), CAST(RAND() * 22 + 1 AS INT), CAST(RAND() * 30 + 1 AS INT), CAST(RAND() * 4 + 1 AS INT));

delete from vuelo;

select a.fila, a.letra, ae.nombre, re.costo, re.fecha, re.observacion, av.tipo, av.fabricante, t.clase, t.precio, t.impuesto from vuelo v	inner join asiento a on v.idasiento = a.idasiento 
						inner join AEROPUERTO ae on v.idaeropuerto = ae.idaeropuerto
						inner join RESERVA re on v.idreserva = re.idreserva
						inner join AVION av on v.idavion = av.idavion
						inner join TARIFA t on v.idtarifa = t.idtarifa
						where ae.nombre = 'Aeropuerto Internacional de Tokio';




DROP PROCEDURE ObtenerReporteMontosRecaudados;

CREATE PROCEDURE ObtenerReporteMontosRecaudados
  @idAeropuerto INT
AS
BEGIN
  SELECT
    al.nombre AS AEROLINEA,
	ae.nombre AS AEROPUERTO,
    SUM(p.monto) AS 'MONTO RECAUDADO',
    SUM(p.impuesto) AS 'IMPUESTO RECAUDADO',
    SUM(p.monto + p.impuesto) AS 'TOTAL ALCANZADO',
    AVG(p.monto + p.impuesto) AS 'PROMEDIO ALCANZADO'
  FROM
    Pago p
    INNER JOIN RESERVA r ON p.idreserva = r.idreserva
    INNER JOIN VUELO v ON r.idreserva = v.idreserva
    INNER JOIN AVION av ON v.idavion = av.idavion
    INNER JOIN AEROLINEA al ON av.idaerolinea = al.idaerolinea
    INNER JOIN AEROPUERTO ae ON v.idaeropuerto = ae.idaeropuerto
  WHERE
    ae.idaeropuerto = @idAeropuerto
  GROUP BY
    al.nombre,
	ae.nombre;
END

EXEC ObtenerReporteMontosRecaudados @idAeropuerto = 1;

select * from VUELO;