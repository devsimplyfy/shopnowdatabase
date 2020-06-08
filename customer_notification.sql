DELIMITER $$

USE `wsimcpsn_shopnow`$$

DROP PROCEDURE IF EXISTS `customer_notification`$$

CREATE DEFINER=`root`@`%` PROCEDURE `customer_notification`(IN cust_Noti_id INT(11),IN Noti_id VARCHAR(200),IN Cust_id INT(11),IN Not_schedule DATETIME, OUT insProductID VARCHAR(100))
BEGIN
	
	DECLARE iSstatus VARCHAR(100) DEFAULT 0;
	DECLARE cust_name VARCHAR(100);
	DECLARE cust_mobile VARCHAR(100);
	
IF cust_Noti_id=0 THEN  
	
	IF NOT EXISTS(SELECT id FROM customers WHERE id=Cust_id ) THEN 	
		SET  insProductID ='customer not valid';
	 
	 ELSEIF NOT EXISTS(SELECT id FROM customers WHERE id=Cust_id AND STATUS=1) THEN
		SET  insProductID ='customer not conform in if';
	 
	 ELSEIF NOT EXISTS(SELECT id FROM customers WHERE id=Cust_id AND subscribed=1) THEN
		SET  insProductID ='customer not susbriction for notification in if';
		
	  ELSEIF NOT EXISTS(SELECT notification_id FROM notifications WHERE notification_id=Noti_id) THEN 	 		
		SET  insProductID ='notification_id not valid';
	
	 ELSE
	
		 
	 SELECT phone_number INTO @cust_mobile FROM customers WHERE id=Cust_id ;
	 		  
	 INSERT IGNORE INTO customer_notifications (notification_id,customer_id,mobile_number,cust_noti_schedule,STATUS)VALUES(Noti_id,Cust_id,@cust_mobile,Not_schedule,1);
	 SET insProductID='insert notification sucessful';

	END IF;
	
	
ELSE
	
	
	 IF NOT EXISTS(SELECT notification_id FROM notifications WHERE notification_id=Noti_id) THEN 	 		
	 SET  insProductID ='notification_id not valid';
	 
	 ELSEIF NOT EXISTS(SELECT id FROM customer_notifications WHERE id= cust_Noti_id) THEN 	 
	 SET  insProductID ='customer notification id not valid';
	 
	
	
	 ELSEIF NOT EXISTS(SELECT id FROM customers WHERE id=Cust_id ) THEN 	 
	 SET  insProductID ='customer not valid';
	 
	 ELSEIF NOT EXISTS(SELECT id FROM customers WHERE id=Cust_id AND STATUS=1) THEN 
	 SET  insProductID ='customer not conform in else';
	 
	 ELSEIF NOT EXISTS(SELECT id FROM customers WHERE id=Cust_id AND subscribed=1) THEN 
	 SET  insProductID ='customer not susbriction for notification';
	
	
	ELSE
		 
	 SELECT phone_number INTO @cust_mobile FROM customers WHERE id=Cust_id ;	   
	 UPDATE customer_notifications SET notification_id=Noti_id,customer_id=Cust_id,mobile_number=@cust_mobile,cust_noti_schedule=Not_schedule,modified_date=NOW() WHERE notification_id=Noti_id;
	 SET insProductID='update notification sucessful';

	END IF;
		
END IF;
	
	

	END$$

DELIMITER ;