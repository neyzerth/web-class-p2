--Apartado para la creacion de vistas 
--FALATARIA AGREGARLE ALIAS A LOS CAMPOS QUE LO REQUIERAN
--En los que tienen _ deberia de quitarselo y agregar un espacio hblando del alias?

--Vistas de Usuario
CREATE VIEW user_info AS
SELECT 
    num,
    username,
    password,
    active,
    user_type,
    supervisor
FROM user;

CREATE VIEW user_personal_info AS
SELECT 
    num,
    name,
    first_surname,
    second_surname,
    date_of_birth,
    neighborhood,
    street,
    postal_code,
    phone,
    email
FROM user;

--VISTA DE CAJA
CREATE VIEW box_info AS
SELECT 
    num,
    height,
    width,
    length,
    volume,
    weight
FROM box;

--VISTA ZONA
CREATE VIEW zone_info AS
SELECT 
    code,
    area,
    available_capacity,
    total_capacity
FROM zone;

--VISTA DE SALIDA
CREATE VIEW outbound_info AS
SELECT 
    num,
    date,
    exit_quantity
FROM outbound;

--VISTA ETIQUETA
CREATE VIEW tag_info AS
SELECT 
    num,
    date,
    barcode,
    tag_type,
    destination
FROM tag;


--VISTA EMBALAJE

CREATE VIEW packaging_info AS
SELECT 
    code,
    height,
    width,
    length,
    package_quantity,
    zone,
    outbound,
    tag
FROM packaging;

--VISTA MATERIAL
CREATE VIEW material_info AS
SELECT 
    num,
    material_name,
    description,
    available_quantity,
    unit_of_measure
FROM material;

--VISTA PAQUETE
CREATE VIEW package_info AS
SELECT 
    num,
    product_quantity,
    weight,
    tracking_code,
    packaging,
    box,
    tag
FROM package;

--VISTA PROTOCOLO EMBALAJE
CREATE VIEW packaging_protocol_info AS
SELECT 
    num,
    name,
    file_name
FROM packaging_protocol;


--VISTA DE PRODUCTO
CREATE VIEW product_info AS
SELECT 
    num,
    name,
    description,
    height,
    width,
    length,
    weight,
    package,
    packaging_protocol
FROM product;

--VISTA DE TRAZABILIDAD
CREATE VIEW traceability_info AS
SELECT 
    num,
    product,
    box,
    package,
    packaging,
    state
FROM traceability;

--VISTA DE INCIDENCIA
CREATE VIEW incident_info AS
SELECT 
    num,
    date,
    description,
    user,
    traceability
FROM incident;


