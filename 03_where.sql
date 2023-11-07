-- Where

-- 값이 같은 친구를 조회하는 방법
SELECT 
	menu_code,
	menu_name,
	menu_price,
	orderable_status
FROM tbl_menu
WHERE ORDERABLE_STATUS = 'Y';

SELECT 
	menu_name,
	menu_price,
	orderable_status
FROM tbl_menu
WHERE menu_price = 13000;

-- 같지 않은 상태를 조회하는 방법
SELECT
	menu_code,
	menu_name,
	orderable_status
FROM tbl_menu
WHERE 
-- orderable_status <> "Y";
orderable_status != "Y";

-- 가격이 20000원 이상인 메뉴를 조회해주세요. 컬럼은 코드, 이름, 가격을 조회하고 코드를 기준으로 내림차순으로 정렬
SELECT 
	menu_code,
	menu_name,
	menu_price
FROM tbl_menu
WHERE menu_price >= 20000
ORDER BY menu_code DESC;

-- 가격이 5000원 이상이면서, 판매중인 제품을 조회
SELECT
	menu_code,
	menu_name,
	menu_price,
	orderable_status
	FROM tbl_menu
WHERE menu_price >= 5000
	AND orderable_status = 'Y';

-- 제품이 판매 중이거나 혹은 카테고리 코드가 10인 목록 조회
SELECT
	menu_code,
	menu_name,
	menu_price,
	orderable_status,
	category_code
FROM tbl_menu
WHERE orderable_status = 'Y'
	OR category_code = 10;

SELECT 
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
FROM tbl_menu
WHERE category_code = 4 
OR menu_price = 9000
AND menu_code > 10;


-- 범위 내의 컬럼을 조회
SELECT
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
FROM tbl_menu
WHERE 
	menu_price >= 10000
AND 
	menu_price <= 25000
ORDER BY menu_price;

SELECT NOW();

SELECT 
	menu_name,
	menu_price,
	category_code
FROM TBL_MENU
WHERE menu_price BETWEEN 10000 AND 25000;

-- 범위에 해당하지 않는 목록들
SELECT 
	menu_name,
	menu_price,
	category_code
FROM
	tbl_menu
WHERE menu_price NOT BETWEEN 10000 AND 25000
ORDER BY menu_price DESC;

-- 값이 포함되어 있는지 확인하는 방법
SELECT 
	menu_name,
	menu_price,
	category_code
FROM tbl_menu
WHERE menu_name LIKE '%마늘%'
ORDER BY menu_name;

-- 가격이 5000원 이상이고, 카테고리 코드가 10번인 음식 중 갈치라는 이름이 포함된 메뉴를 조회.
-- 코드, 이름, 카테고리, 가격 출력
SELECT
	menu_code,
	menu_name,
	category_code,
	menu_price
FROM tbl_menu
WHERE menu_price >= 5000
AND category_code = 10
AND menu_name
LIKE '%갈치%';

-- LIKE의 부정문을 알아본다

SELECT
	menu_code,
	menu_name,
	category_code,
	menu_price
FROM tbl_menu
WHERE menu_price >= 5000
AND category_code = 10
AND menu_name
NOT LIKE '%갈치%';


-- 한식(4) 중식(5) 일식(6) 메뉴를 조회하자
SELECT 
	menu_name,
	category_code
FROM tbl_menu
WHERE category_code = 5
OR category_code = 6
OR category_code = 4;

-- in()
SELECT 
	menu_name,
	category_code
FROM tbl_menu
WHERE category_code IN(4,5,6);

-- 포함되지 않은 값을 조회
SELECT 
	menu_name,
	category_code
FROM tbl_menu
WHERE category_code NOT IN(4,5,6);


-- NULL을 조회하기
SELECT 
	category_code,
	category_name,
	ref_category_code
FROM tbl_category
WHERE ref_category_code IS NULL;

-- NULL이 아닌 목록 조회
SELECT 
	category_code,
	category_name,
	ref_category_code
FROM tbl_category
WHERE ref_category_code IS NOT NULL;



	

	