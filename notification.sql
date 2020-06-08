DELIMITER $$

USE `wsimcpsn_shopnow`$$

DROP PROCEDURE IF EXISTS `notification`$$

CREATE DEFINER=`root`@`%` PROCEDURE `notification`(IN Noti_id INT(11),IN Not_name VARCHAR(200),IN Not_type INT(11),IN Not_schedule DATETIME,IN Message VARCHAR(500),IN Not_state VARCHAR(255), OUT insProductID VARCHAR(100))
BEGIN
	
	
IF Noti_id=0 THEN  
	
	
			  
	 INSERT INTO notifications (notification_name,TYPE,notification_schedule,message,notification_state)VALUE(Not_name,Not_type,Not_schedule,Message,Not_state);
	 SET insProductID='insert notification sucessful';

	
	
	
ELSE
	
	
	 IF NOT EXISTS(SELECT notification_id FROM notifications WHERE notification_id=Noti_id) THEN 	 		
	 SET  insProductID ='notification_id not valid';
	
	
	
	ELSE
		 
		   
	 UPDATE notifications SET notification_name=Not_name,TYPE=Not_type,notification_schedule=Not_schedule,message=Message,notification_state=Not_state,modified_date=NOW() WHERE notification_id=Noti_id;
	 SET insProductID='update notification sucessful';

	END IF;
		
END IF;
	
	

	END$$

DELIMITER ;