-- 서브쿼리
-- query

SELECT 
	menu_code,
	menu_price,
	menu_name,
	category_code,
	orderable_status
FROM tbl_menu
WHERE category_code = (
	SELECT
		category_code
	FROM tbl_menu
	WHERE menu_name = '민트미역국');
	
-- 가장 많은 메뉴가 포험된 카테고리
-- 서브 쿼리
SELECT
	category_code,
	count(*) AS 'count'
FROM tbl_menu
GROUP BY category_code;

SELECT
	max(count) -- 카운트 컬럼 중 가장 값이 큰 것을 출력
FROM (
	SELECT
		count(*) AS 'count' -- 이중 쿼리문에서 이름을 주지 않으면 오류가 남.
	FROM tbl_menu
	GROUP BY category_code) AS countMenu;
	
-- 카테고리 평균 가격보다 높은 가격의 메뉴 조회
SELECT 
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
FROM tbl_menu a
WHERE menu_price > (
	SELECT
		avg(menu_price)
	FROM tbl_menu
		);
		
SELECT 
	category_code
FROM tbl_menu a
WHERE FALSE -- TRUE도 가능,TRUE인 경우 모두 출력한다
	OR menu_name = '민트미역국'; 
	
SELECT 
	category_code
FROM tbl_menu a
WHERE EXISTS (
	SELECT 
		1
	FROM tbl_menu b
	WHERE b.category_code = a.category_code
);

-- common table
WITH menucate AS(
	SELECT
		a.menu_name,
		b.category_code AS cname
	FROM tbl_menu a
	JOIN tbl_category b ON (a.category_code = b.category_code)
)
SELECT
	cname
FROM menucate
GROUP BY cname;