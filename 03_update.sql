-- update 문
--  DML 중 하나로 저장되어있는 기존 데이터를 수정하기 위해 사용하는 쿼리
-- UPDATE 테이블명
-- SET 
-- 	컬럼1 = 값1
-- 	,컬럼2 = 값2
-- 	[,...]
-- [WHERE 조건];


-- select 문으로 확인하고 update문으로 바꾸면 휴먼에러를 줄일수 있음
UPDATE employees
SET 
	`name` = '조장님'
WHERE 
	emp_id = 100005
;

-- 100005번 사원의 생일을 '2020-01-01', 이름을 '마이콜'로 변경해 주세요.

UPDATE employees
SET 
	`name` = '마이콜'
	,birth = '2020-01-01'
WHERE 
	emp_id = 100005
; 
	
SELECT *
FROM employees
WHERE 
	emp_id = 100005
;


