-- SET OPERATORS 

-- UNION 중복을 제거하고 쿼리를 합쳐준다 UNION ALL을 사용하면 중복을 제거하지 않고 중복되서 모두 출력
SELECT
	menu_code
	, menu_name
	, menu_price
	, category_code
	, orderable_status
FROM tbl_menu
WHERE category_code = 10
UNION 
SELECT 
	menu_code
	, menu_name
	, menu_price
	, category_code
	, orderable_status
FROM tbl_menu
WHERE menu_price < 9000;

SELECT
	menu_code
	, menu_name
	, menu_price
	, category_code
	, orderable_status
FROM tbl_menu
WHERE category_code = 10
UNION ALL 
SELECT 
	menu_code
	, menu_name
	, menu_price
	, category_code
	, orderable_status
FROM tbl_menu
WHERE menu_price < 9000;

-- inner join에 sub query 사용하기
SELECT
	a.menu_code
	, a.menu_name
	, a.menu_price
	, a.category_code
	, a.orderable_status
FROM tbl_menu AS a
	JOIN (SELECT
			menu_code
			, menu_price
			, category_code
			, orderable_status
		FROM tbl_menu
		WHERE menu_price < 9000) AS b ON(a.menu_code = b.menu_code)
WHERE a.category_code = 10;

SELECT 
	a.menu_code
	, a.menu_name
	, a.menu_price
	, a.category_code
	, a.orderable_status
FROM tbl_menu AS a
LEFT JOIN (SELECT
			menu_code
			, menu_name
			, menu_price
			, category_code
			, orderable_status
		FROM tbl_menu
		WHERE menu_price < 9000) AS b ON(a.menu_code = b.menu_code)
		WHERE a.category_code = 10
		AND b.menu_code IS NULL;
