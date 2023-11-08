-- join
-- on은 테이블간의 연결할 조건을 의미한다.
-- where은 조회된 결과에서 필터링할 조건이다.

-- inner join
SELECT 
	a.menu_name,
	b.category_name
FROM tbl_menu a
JOIN tbl_category b ON(a.category_code = b.category_code);

-- right join b의 데이터와 a와 b의 교집합 데이터를 출력함.
SELECT 
	a.menu_name,
	b.category_name
FROM
	tbl_menu a
RIGHT JOIN tbl_category b ON a.category_code = b.category_code;

-- Cross join a와 b의 데이터를 모두 출력(잘 쓰지 않는다)
SELECT 
	a.menu_name,
	b.category_name
FROM
	tbl_menu a
CROSS JOIN tbl_category b;

-- Outer join 
SELECT 
	a.menu_name,
	b.category_name
FROM tbl_menu a
RIGHT JOIN tbl_category b ON (a.category_code = b.category_code)
WHERE a.menu_name IS NULL;

-- self join
SELECT 
	b.category_code AS 'b의 코드',
	a.category_code AS 'a의 코드',
	a.category_name,
	b.category_name
FROM tbl_category a
JOIN tbl_category b ON (a.category_code = b.ref_category_code);

SELECT * FROM tbl_category;


	
	
