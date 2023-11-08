-- 정렬 기능 알아보기
-- ORDER BY

SELECT -- 조회한다
	*	-- 조회할 컬럼 * 은 모든 컬럼을 조회할 때 사용
FROM tbl_menu -- 조회할 테이블
ORDER BY menu_code DESC; -- tbl_menu 테이블의 menu_code 컬럼을 내림차순으로 정렬

SELECT -- 조회한다
	*	-- 조회할 컬럼 * 은 모든 컬럼을 조회할 때 사용
FROM tbl_menu -- 조회할 테이블
ORDER BY menu_code ASC; -- tbl_menu 테이블의 menu_code 컬럼을 오름차순으로 정렬(기본 값은 오름 차순이다.)

-- ORDER BY 철을 사용하여 결과 집합을 여러 열로 정렬
SELECT 
	menu_code,
	menu_name,
	menu_price
FROM TBL_MENU  
ORDER BY
	menu_price DESC, 
	menu_code ASC; -- 만약 같은 가격이 있다면 menu_code 컬럼 오름차순으로 정렬한다.
	
	
-- 열산 결과로 결과 집합 정렬
-- 아래의 결과는 두번 연산이 진행되는 것으로 판단됨 
-- 데이터의 값이 증가할 수록 성능이 저하된다
SELECT 
	menu_code,
	menu_price,
	menu_code * menu_price 
FROM tbl_menu
ORDER BY 
	menu_code * menu_price DESC;

-- 위의 연산의 경우 다음과 같이 사용하는 것이 좋다.
SELECT 
	menu_code,
	menu_price,
	menu_code * menu_price AS '메뉴코드와 가격을 곱한 값' 
FROM tbl_menu
ORDER BY 
	'메뉴코드와 가격을 곱한 값'  DESC;


SELECT FIELD('A','A','B','C');
SELECT FIELD('B','A','B','C');

SELECT
	MENU_CODE,
	MENU_NAME, 
	FIELD(orderable_status, 'N', 'Y') -- orderable_status 컬럼의 값이 N이면 1, Y면 2를 반환
FROM tbl_menu;

SELECT * FROM TBL_MENU;

SELECT 
	menu_name,
	orderable_status,
	FIELD(orderable_status, 'N', 'Y')
FROM TBL_MENU
ORDER BY FIELD(orderable_status, 'N', 'Y') DESC;

-- null
-- 오름차순 시 null 처음으로(default)
SELECT
	category_code,
	category_name,
	ref_category_code
FROM tbl_category
ORDER BY ref_category_code ;

-- 역순으로 정렬시
-- DESC
SELECT
	category_code,
	category_name,
	ref_category_code
FROM tbl_category
ORDER BY ref_category_code IS NULL;

-- 내림차순시 처음으로 정렬
SELECT
	category_code,
	category_name,
	ref_category_code
FROM tbl_category
ORDER BY ref_category_code IS NULL DESC; 









