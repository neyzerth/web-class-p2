/*******************************************************

    Se uso de base la base de datos 'bienesraices2'
    usado en clase, estas fueron las modificaciones

********************************************************/
USE bienesraices2;

-- Tabla para la relacion Vendedor - Propiedad
CREATE TABLE sales(
    seller_id INT(11) NOT NULL,
    property_id INT(11) NOT NULL,
    sale_date DATE NOT NULL,
    PRIMARY KEY (seller_id, property_id),
    Foreign Key (seller_id) REFERENCES sellers(id),
    Foreign Key (property_id) REFERENCES propierties(id)
);

-- Agregar un campo para verificar si la propiedad
-- ya fue comprada o no
ALTER TABLE propierties
ADD COLUMN sold BOOLEAN DEFAULT FALSE;

-- vista que solamente muestra las propiedades que no han sido vendidas
CREATE VIEW vw_available_properties AS
SELECT id, title, price, image, description, rooms, wc
FROM propierties WHERE NOT sold;

-- Trigger que actualiza las propiedades que ya fueron vendidas
DELIMITER $$
CREATE TRIGGER sold_property
AFTER INSERT ON sales
FOR EACH ROW
BEGIN
    UPDATE propierties
    SET sold = TRUE
    WHERE id = NEW.property_id;
END $$
DELIMITER ;