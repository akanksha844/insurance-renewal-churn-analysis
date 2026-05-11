SELECT * FROM portal_db.portal_web_logs;
SELECT * FROM portal_db.customer_profiles;
SELECT * FROM portal_db.policy_details ;



-- Constraint 1: Identify customers whose policy expires in the next 30 days.
SELECT customer_id AS customer_at_risk, expiry_date FROM policy_details WHERE expiry_date BETWEEN curdate() and 
date_add(curdate(), INTERVAL 30 day );


-- Constraint 2: Filter for those who have logged into the Customer Portal at least 3  times in the last 14 days 
--(indicating interest) but have Payment_Status = 'Pending'.

SELECT p.customer_id as renewed_customers FROM portal_web_logs p JOIN policy_details po ON
(p.customer_id = po.customer_id)WHERE visit_timestamp >= curdate() - 
interval 14 day  and po.payment_status='Pending' GROUP BY 
p.customer_id HAVING COUNT(page_viewed) >=3 ORDER BY p.customer_id;



-- Constraint 3: Rank them by their "Lifetime Value" (Total Premium Paid across FHO, Women Care, etc.)

SELECT customer_id, SUM(premium_amount) AS High_premium_due_customer FROM policy_details WHERE 
payment_status= 'Pending' GROUP BY customer_id ORDER BY High_premium_due_customer DESC;


--Final Query -- Write a query to extract a "Renewal Risk" table
USE portal_db;
WITH A AS  (SELECT customer_id , expiry_date FROM policy_details WHERE 
expiry_date BETWEEN curdate() and 
date_add(curdate(), INTERVAL 30 day )),

  B AS (SELECT p.customer_id FROM portal_web_logs p 
  JOIN policy_details po ON
(p.customer_id = po.customer_id)WHERE visit_timestamp >= curdate() - 
interval 14 day  and po.payment_status='Pending' GROUP BY 
p.customer_id HAVING COUNT(page_viewed) >=3 ),

C AS ( SELECT customer_id, SUM(premium_amount) AS High_premium_due_customer FROM policy_details WHERE 
payment_status= 'Pending' GROUP BY customer_id )

SELECT B.customer_id, C.High_premium_due_customer AS payment_pending_customers FROM B JOIN A ON (A.customer_id = B.customer_id)
JOIN C ON (B.customer_id = C.customer_id)  ORDER BY C.High_premium_due_customer DESC;