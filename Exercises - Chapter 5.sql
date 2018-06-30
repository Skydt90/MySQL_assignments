-- Exercise 1, Chapter 5
INSERT INTO terms (terms_id, terms_description, terms_due_days) 
VALUES (6, 'Net Due 120 Days', 120); 

-- Exercise 2, Chapter 5
UPDATE terms 
SET terms_description = 'Net Due 125 Days', terms_due_days = 125
WHERE terms_id = 6;

-- Exercise 3, Chapter 5
DELETE FROM terms
WHERE terms_id = 6;

-- Exercise 4, Chapter 5
INSERT INTO invoices
VALUES (NULL, 32, 'AX-014-027', '2014-08-01', 434.58, 0.00, 0.00, 2, '2014-08-31', NULL);

-- Exercise 5, Chapter 5
INSERT INTO invoice_line_items
VALUES (115, 1, 160, 180.23, 'Hard Drive'),
	   (115, 2, 527, 254.35, 'Exchange Server update');
       
-- Exercise 6, Chapter 5
UPDATE invoices
SET credit_total = invoice_total * 0.10, 
	payment_total = invoice_total - credit_total
WHERE invoice_id = 115;

-- Exercise 7, Chapter 5
UPDATE vendors
SET default_account_number = 403
WHERE vendor_id = 44;

-- Exercise 8, Chapter 5
UPDATE invoices
SET terms_id = 2
WHERE terms_id IN 
	(SELECT vendor_id
     FROM vendors
     WHERE default_terms_id = 2);
     
-- Exercise 9, Chapter 5
DELETE FROM invoice_line_items
WHERE invoice_id = 115;
DELETE FROM invoices
WHERE invoice_id = 115;