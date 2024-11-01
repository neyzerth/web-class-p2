-- Active: 1728065056405@@127.0.0.1@3306@packaging
-----------------------------------
        --STORED PROCEDURE
-----------------------------------

drop Procedure check_zone_capacity

--corregir 
CREATE PROCEDURE sp_check_zone_capacity (
    IN zone_code VARCHAR(5), 
    IN package_quantity INT, 
    OUT result BIT
)
BEGIN
    DECLARE capacity INT;
    
    SELECT available_capacity INTO capacity 
    FROM zone
    WHERE code = zone_code;
    
    IF capacity >= package_quantity THEN
        SET result = TRUE;
    ELSE
        SET result = FALSE;
    END IF;
END;

select * from zone

CALL check_zone_capacity('Z001',55,@Resultado);

select @Resultado as respuesta




--Pudieramos cambiar el nombre a search_report
CREATE PROCEDURE sp_generate_report(
    IN start_date DATE,
    IN end_date DATE
)
BEGIN
    SELECT * FROM report 
    WHERE start_date = start_date
    AND end_date = end_date ;
END;


call sp_generate_report ('2024-09-01','2024-09-30')


--Pudieramos hacer un sp o  triggers que al hacer un moviento en el proceso del embalaje actualice la tabla estado de la trazabilidad
--Creo que seria mejor un trigger por que nos evitamos tener que mandarlo a llamar
--


--usuario general
DELIMITER $$

drop procedure sp_insertUser;
CREATE PROCEDURE sp_insertUser(
    IN p_username VARCHAR(30),
    IN p_password VARCHAR(20),
    IN p_name VARCHAR(50),
    IN p_first_surname VARCHAR(30),
    IN p_second_surname VARCHAR(30),
    IN p_date_of_birth DATE,
    IN p_neighborhood VARCHAR(50),
    IN p_street VARCHAR(50),
    IN p_postal_code INT,
    IN p_phone VARCHAR(15),
    IN p_email VARCHAR(30),
    IN p_user_type VARCHAR(5),
    IN p_supervisor INT
)
BEGIN

    DECLARE type_exists INT;
    SET type_exists = (SELECT COUNT(*) FROM user_type WHERE code = p_user_type);

    IF type_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid user_type code';
    END IF;

    INSERT INTO user (
        username, password, name, first_surname, second_surname,
        date_of_birth, neighborhood, street, postal_code, phone,
        email, user_type, supervisor
    ) VALUES (
        p_username, p_password, p_name, p_first_surname, p_second_surname,
        p_date_of_birth, p_neighborhood, p_street, p_postal_code, p_phone,
        p_email, p_user_type, p_supervisor
    );
END $$
DELIMITER ;


--add incidencia (fecha,descipcion,trazabilida)

DELIMITER $$

CREATE PROCEDURE sp_addIncident(
    IN p_date DATE,
    IN p_description VARCHAR(255),
    IN p_traceability INT
)
BEGIN
    DECLARE traceability_count INT DEFAULT 0;

    SELECT COUNT(*) INTO traceability_count FROM trazabilidad WHERE num = p_traceability;

    IF traceability_count = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid traceability ID';
    END IF;

    INSERT INTO incidencia (fecha, descripcion, trazabilidad)
    VALUES (p_date, p_description, p_traceability);
END $$
DELIMITER ;





