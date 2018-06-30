-- Exercise 1, chapter 4.
SELECT * FROM vendors
	JOIN invoices ON vendors.vendor_id = invoices.vendor_id;
    
-- Exercise 2, chapter 4.
SELECT v.vendor_name, i.invoice_number, i.invoice_date,
i.invoice_total - i.payment_total - i.credit_total AS 'balance_due' FROM vendors AS v
   JOIN invoices AS i ON v.vendor_id = i.vendor_id
   WHERE i.invoice_total - i.payment_total - i.credit_total > 0
ORDER BY v.vendor_name ASC;
       
-- Exercise 3, chapter 4.
SELECT v.vendor_name, v.default_account_number, g.account_description FROM vendors AS v
	JOIN general_ledger_accounts AS g ON v.default_account_number = g.account_number
ORDER BY g.account_description AND v.vendor_name;
    
-- Exercise 4, chapter 4.
SELECT v.vendor_name, i.invoice_date, i.invoice_number, 
il.invoice_sequence, il.line_item_amount FROM vendors AS v
	JOIN invoices AS i ON v.vendor_id = i.vendor_id
	JOIN invoice_line_items AS il ON i.invoice_id = il.invoice_id
ORDER BY v.vendor_name ASC, i.invoice_date ASC,
	i.invoice_number ASC, il.invoice_sequence ASC;
        
-- Exercise 5, chapter 4.
SELECT v1.vendor_id, v1.vendor_name, CONCAT(v1.vendor_contact_first_name, ' ', v1.vendor_contact_last_name) 
AS 'contact_name' FROM vendors AS v1
	JOIN vendors AS v2 ON v1.vendor_contact_last_name = v2.vendor_contact_last_name
	AND v1.vendor_id != v2.vendor_id
ORDER BY v1.vendor_contact_last_name;
    
-- Exercise 6, chapter 4.
SELECT gl.account_number, gl.account_description FROM general_ledger_accounts AS gl
	LEFT JOIN invoice_line_items AS li ON gl.account_number = li.account_number
    WHERE li.account_number IS NULL
ORDER BY gl.account_number ASC;

-- Exercise 7, chapter 4.
SELECT vendor_name, vendor_state FROM vendors
	WHERE vendor_state = 'CA'
UNION
SELECT vendor_name, 'Outside CA' FROM vendors
	WHERE vendor_state != 'CA'
ORDER BY vendor_name;
    
		
	
       
       
	