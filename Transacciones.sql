create database Usuarios;
use usuarios
  

  /* Creacion de tabla departamentos con sus valores*/
CREATE TABLE `departamentos` (
`CODIGO` INTEGER(11) NOT NULL DEFAULT ‘0’,
`NOMBRE` VARCHAR(100),
`PRESUPUESTO` INTEGER(11) DEFAULT NULL,
PRIMARY KEY (`CODIGO`)
)


/*uso de transacion */

START TRANSACTION;
SELECT @A:=PRESUPUESTO FROM departamentos_externos WHERE codigo=11;
UPDATE departamentos SET PRESUPUESTO = PRESUPUESTO + @A WHERE codigo=33;
COMMIT;

/*el ejemplo anterior se guardo el presupuesto del 
departamento externo 11 en la variable @A 
y luego fue asignado al presupuesto en la tabla departamentos.*/