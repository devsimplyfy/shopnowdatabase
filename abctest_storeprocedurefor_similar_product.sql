DELIMITER $$

USE `wsimcpsn_shopnow`$$

DROP PROCEDURE IF EXISTS `abctest`$$

CREATE DEFINER=`root`@`%` PROCEDURE `abctest`(IN spid INT(11),IN proid INT(11),IN similarid INT(11),IN confidence_score FLOAT(10),IN pro_vendor_id INT(11),IN similar_vendor_id INT(11),IN stype INT(11),OUT insProductID VARCHAR(256))
BEGIN
 
IF spid=0 THEN  
 
IF NOT EXISTS(SELECT id FROM products WHERE id=proid) THEN
       SET insProductID = 'product_id not valid';
 
        
ELSEIF NOT EXISTS (SELECT id FROM products WHERE id=similarid) THEN
            SET insProductID = 'similar product id not valid';
     
  
 ELSEIF NOT EXISTS (SELECT id FROM products WHERE vendor_id=pro_vendor_id AND id=proid) THEN
            SET insProductID = 'product vendor_id not valid';
  
 ELSEIF NOT EXISTS (SELECT id FROM products WHERE vendor_id=similar_vendor_id AND id=similarid) THEN
            SET insProductID = 'similar product vendor id not valid';
          
  ELSEIF EXISTS (SELECT id FROM similar_products WHERE product_id=proid AND similar_product_id=similarid AND TYPE=stype) THEN
            SET insProductID = 'product_id and similar_product_is of same type presant so not insert into table'; 
 
 
           
   
  ELSE 
  SET insProductID = 'final';
  END IF;
  
        IF  insProductID = 'final' THEN
        
		INSERT INTO similar_products  (product_id,similar_product_id,confidence_score,product_vendor_id,similar_product_vendor_id,TYPE) VALUES(proid,similarid,confidence_score,pro_vendor_id,similar_vendor_id,stype);
         SET insProductID = 'product insert successful';
        END IF;

ELSE

   
  
   IF NOT EXISTS(SELECT id FROM products WHERE id=proid) THEN
       SET insProductID = 'product_id not valid';
       
   ELSEIF NOT EXISTS (SELECT id FROM similar_products WHERE id=spid AND product_id=proid AND TYPE=stype) THEN
            SET insProductID = 'id not valid for update';  
 
        
    ELSEIF NOT EXISTS (SELECT id FROM products WHERE id=similarid) THEN
            SET insProductID = 'similar product id not valid';
     
  
     ELSEIF NOT EXISTS (SELECT id FROM products WHERE vendor_id=pro_vendor_id AND id=proid) THEN
            SET insProductID = 'product vendor_id not valid';
  
     ELSEIF NOT EXISTS (SELECT id FROM products WHERE vendor_id=similar_vendor_id AND id=similarid) THEN
            SET insProductID = 'similar product vendor id not valid';
      
     ELSE 
       SET insProductID = 'final';
  END IF;
  
        IF  insProductID = 'final' THEN
     
	UPDATE  similar_products SET  product_id=proid,similar_product_id=similarid,confidence_score=confidence_score,product_vendor_id=pro_vendor_id,similar_product_vendor_id=similar_vendor_id,TYPE=stype,modified_date=NOW() WHERE id=spid AND product_id=proid AND TYPE=stype;
         
         SET insProductID = 'product update successful';
         
        END IF;

END IF;
	
END$$

DELIMITER ;