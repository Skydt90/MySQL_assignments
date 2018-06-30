-- Exercise 1, Chapter 6
SELECT v.vendor_id, SUM(i.invoice_total) AS invoice_total FROM invoices i
	JOIN vendors v ON i.vendor_id = v.vendor_id
GROUP BY vendor_id;

-- Exercise 2, Chapter 6
SELECT v.vendor_name, SUM(i.payment_total) AS payment_total FROM invoices i
	JOIN vendors v ON i.vendor_id = v.vendor_id
	GROUP BY v.vendor_name
ORDER BY payment_total DESC;

-- Exercise 3, Chapter 6
SELECT vendor_name, COUNT(invoice_number) AS number_of_invoices, 
	SUM(invoice_total) AS invoice_total
FROM vendors v JOIN invoices i 
	ON i.vendor_id = v.vendor_id
GROUP BY vendor_name
ORDER BY number_of_invoices DESC;

-- Exercise 4, Chapter 6
SELECT account_description, COUNT(line_item_amount) AS number_of_items,
	SUM(line_item_amount) AS sum_of_items FROM invoice_line_items i 
JOIN general_ledger_accounts g ON g.account_number = i.account_number
GROUP BY account_description
HAVING number_of_items > 1
ORDER BY sum_of_items DESC;

-- Exercise 5, Chapter 6
SELECT account_description, COUNT(line_item_amount) AS number_of_items,
	SUM(line_item_amount) AS sum_of_items FROM invoice_line_items i 
	JOIN general_ledger_accounts g ON g.account_number = i.account_number
	JOIN invoices iv ON i.invoice_id = iv.invoice_id
WHERE invoice_date BETWEEN '2014-04-01' AND '2014-06-30'
GROUP BY account_description
HAVING number_of_items > 1
ORDER BY sum_of_items DESC;

-- Exercise 6, Chapter 6
SELECT account_number, SUM(line_item_amount) AS line_item_sum
FROM invoice_line_items
GROUP BY account_number WITH ROLLUP;

-- Exercise 7, Chapter 6
SELECT vendor_name, COUNT(DISTINCT li.account_number) 
	AS number_of_gl_accounts FROM vendors v 
  JOIN invoices i ON v.vendor_id = i.vendor_id
  JOIN invoice_line_items li ON i.invoice_id = li.invoice_id
GROUP BY vendor_name
HAVING number_of_gl_accounts > 1
ORDER BY vendor_name;
