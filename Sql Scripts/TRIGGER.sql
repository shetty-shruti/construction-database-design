DROP TRIGGER IF EXISTS MYDB.TR_AFTER_BUILDING_INSERT;
DELIMITER  $$
CREATE TRIGGER  MYDB.TR_AFTER_BUILDING_INSERT
	AFTER INSERT ON MYDB.BUILDINGS
    FOR EACH ROW			
BEGIN	
    
	DECLARE TOTAL_FLOORS INT;
    DECLARE ROOM_NO INT;
    DECLARE SELLING_PRICE DOUBLE;
    DECLARE COST_PRICE DOUBLE;    
    SET TOTAL_FLOORS = 1;
		WHILE TOTAL_FLOORS <= NEW.NO_OF_FLOORS DO
			SET ROOM_NO = 1;
			WHILE ROOM_NO <= NEW.FLATS_PER_FLOOR DO
				CASE TOTAL_FLOORS
					WHEN TOTAL_FLOORS BETWEEN 1 AND 5 THEN 
						SET COST_PRICE = 100;
                        SET SELLING_PRICE = 300;
					WHEN TOTAL_FLOORS BETWEEN 6 AND 10 THEN 
						SET COST_PRICE = 300;
                        SET SELLING_PRICE = 500;
					WHEN TOTAL_FLOORS BETWEEN 11 AND 15 THEN 
						SET COST_PRICE = 500;
                        SET SELLING_PRICE = 700;
					WHEN TOTAL_FLOORS BETWEEN 16 AND 20 THEN 
						SET COST_PRICE = 700;
                        SET SELLING_PRICE = 900;
					WHEN TOTAL_FLOORS BETWEEN 21 AND 25 THEN 
						SET COST_PRICE = 900;
                        SET SELLING_PRICE = 1100;
					ELSE
						SET COST_PRICE = 1100;
                        SET SELLING_PRICE = 1300;
				END CASE;
					INSERT INTO MYDB.FLATS (FLAT_NO,BUILDING_ID,FLAT_COST_PRICE,FLAT_SELLING_PRICE,FLOOR_NO)
					VALUES (ROOM_NO,NEW.BUILDING_ID,COST_PRICE,SELLING_PRICE,TOTAL_FLOORS);            
				SET ROOM_NO = ROOM_NO + 1;
            END WHILE;
            SET TOTAL_FLOORS = TOTAL_FLOORS + 1;
		END WHILE;
END $$
DELIMITER ;
