DELIMITER $$

USE `wsimcpsn_shopnow`$$

DROP PROCEDURE IF EXISTS `fashion`$$

CREATE DEFINER=`root`@`%` PROCEDURE `fashion`(IN fid INT(11),IN pname VARCHAR(256),IN keywords VARCHAR(256),IN pimage VARCHAR(256),IN instragramid VARCHAR(256),IN fstatus INT(11),OUT insProductID1 VARCHAR(256))
BEGIN
 
 DECLARE fashionID INT DEFAULT 0; 
 
 
 
IF fid=0 THEN  
 
	
  
		INSERT INTO fashion_trends (NAME,keywords,image,instragramid,STATUS) VALUES(pNAME,keywords,pimage,instragramid,fstatus);
		SELECT fashion_id INTO @fashionID FROM fashion_trends  ORDER BY fashion_id DESC LIMIT 1;
		SET insProductID1 = CONCAT('fashion_id insert successful ~ ',@fashionID);
      

ELSE
        
	 
         UPDATE fashion_trends SET NAME=pNAME,keywords=keywords,image=pimage,instragramid=instragramid,STATUS=fstatus,modified_date=NOW() WHERE fashion_id=fid;
         
         SET insProductID1 = 'fashion_id update successful';

END IF;
	
END$$

DELIMITER ;