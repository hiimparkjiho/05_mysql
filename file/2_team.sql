
SHOW DATABASES;
USE opez;

SELECT * FROM tbl_master_users;
SELECT * FROM tbl_master_build;
SELECT * FROM tbl_item;
SELECT * FROM tbl_master_skill;
-- 다중 join을 이용하여 판수가 500판 이상이고 1000판 이하인 장인의 닉네임, 티어, 판수, 핵심 룬, 스펠, 첫 코어 아이템의 이름, 스킬 선마 순서를 판수가 많은 순서대로 조회하시오.
-- (tbl_master, tbl_master_build, tbl_rune, tbl_spell, tbl_item)
SELECT 
	AU.user_name,
	AU.user_tier,
	MU.total_games,
	R.main_rune,
	S.spell_D,
	S.spell_F,
	I.item_name,
	MS.skill_name
FROM tbl_all_users AS AU
JOIN tbl_master_users AS MU ON(AU.user_code = MU.user_code)
JOIN tbl_master_build AS MB ON(MU.master_code = MB.master_code)
JOIN tbl_rune AS R ON(MB.build_code = R.build_code)
JOIN tbl_spell AS S ON(MB.build_code = S.build_code)
JOIN tbl_item AS I ON(MB.build_code = I.build_code) 
JOIN tbl_master_skill AS MS ON(MB.build_code = MS.build_code)
WHERE MU.total_games BETWEEN 500 AND 1000
ORDER BY MU.total_games DESC;

-- 4.각챔프별 모든 장인들의 챔피언 이름과 평균 판수 조회하기
  SELECT
     C.champion_name,
     avg(total_games) AS '평균 판수'
  FROM
  tbl_master_users AS MU
  JOIN tbl_champions AS C ON(MU.champion_code = C.champion_code)
  GROUP BY C.champion_name;
 
 -- 3.점멸 안드는 장인의 닉네임과 스펠 모두 조회하기
SELECT
   AU.user_name,
   S.spell_D,
   S.spell_F
FROM
tbl_all_users AS AU
JOIN
tbl_master_users AS MU ON(AU.user_code = MU.user_code)
JOIN
tbl_master_build AS MB ON(MU.master_code = MB.master_code)
JOIN
tbl_spell AS S ON(MB.build_code = S.build_code)
WHERE S.spell_D != '점멸'
  AND S.spell_F != '점멸';

  
SELECT * FROM tbl_all_users;
 
-- 2.승률이 가장 높은 장인 3명의 닉네임 판수 승률을 승률 내림차순으로 조회해라
SELECT
   AU.user_name,
   MU.total_games,
   MU.winning_rate
FROM
tbl_master_users AS MU
JOIN tbl_all_users AS AU ON(MU.user_code = AU.user_code)
ORDER BY winning_rate desc
LIMIT 3;

-- 모든 유저 중 장인을 제외한 일반 유저의 이름과 티어를 출력하시오.
SELECT
	AU.user_name,
	AU.user_tier
FROM tbl_all_users AS AU
LEFT JOIN tbl_master_users AS MU ON(AU.user_code = MU.user_code)
WHERE MU.user_code IS NULL;


