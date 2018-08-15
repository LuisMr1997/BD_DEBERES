CREATE PROCEDURE `contar_productos` (IN codigo varchar(5),
  OUT nproductos INT)
BEGIN
SELECT
  COUNT(*)
INTO
  nproductos
FROM
  productos
WHERE
  cprincipal=codigo
END;

/*PARA LLAMAR AL SP*/
CALL contar_productos('001', @cantidad);
select  @cantidad;