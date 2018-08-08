DELIMITER ;;
DROP PROCEDURE IF EXISTS `micursor`;;
CREATE PROCEDURE `micursor`()
BEGIN
DECLARE done BOOLEAN DEFAULT FALSE;
DECLARE uid integer;
DECLARE newdate integer;
DECLARE c1 cursor for SELECT id,timestamp from employers ORDER BY id ASC;
DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = TRUE;
open c1;
c1_loop: LOOP
fetch c1 into uid,newdate;
        IF `done` THEN LEAVE c1_loop; END IF; 
        UPDATE calendar SET timestamp = newdate  WHERE id=uid;
END LOOP c1_loop;
CLOSE c1;
END ;;

/*Básicamente se declaran dos variables uid y newdate que contendrán el valor de cada campo de la fila.
 Luego se define el cursor mediante una consulta SQL (es como si se creara una tabla temporal). Finalmente, 
se recorre el cursor y se aplica la operación adecuada según nuestro programa.*/



/*llamar el cursor*/
call timechange();