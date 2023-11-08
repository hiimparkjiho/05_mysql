SELECT MENU_NAME FROM tbl_menu;

SELECT
	menu_code,
	menu_name,
	menu_price
FROM tbl_menu ;

-- CODE, 이름, 가격, STATUS(상태), 카테고리를 조회해주세요

SELECT 
	menu_code, -- 컬럼들
	menu_name,
	menu_price,
	category_code,
	orderable_status
FROM tbl_menu; -- 컬럼을 불러올 테이블

SELECT * FROM TBL_MENU; -- 해당 테이블의 모든 컬럼을 불러오는 구문

-- DB가 가지고 있는 내장 기능
SELECT 6 * 3; -- 연산기능
SELECT NOW(); -- 현재 시간 
SELECT CONCAT('홍',        '길','동'); -- 문자열 합체
SELECT CONCAT('홍',',        '        '길','동') AS 'NAME'; -- 별명을 지정함










	








