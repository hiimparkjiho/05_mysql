-- LIMIT 

SELECT 
	menu_code,
	menu_name,
	menu_price
FROM tbl_menu
ORDER BY menu_price DESC;

SELECT 
	menu_code,
	menu_name,
	menu_price
FROM tbl_menu
ORDER BY menu_code  
LIMIT 0,4;	-- 앞자리가 인덱스, 뒷자리가 나타낼 개수

SELECT 
	menu_code,
	menu_name,
	menu_price
FROM tbl_menu
ORDER BY
menu_price DESC,
menu_name ASC
LIMIT 5;

