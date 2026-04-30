-- 전 사원의 사번, 이름 현재 급여를 출력해주세요.

SELECT 
	emp.emp_id
	,emp.`name` 
	,sal.salary
	,emp.fire_at
FROM employees emp
	LEFT JOIN salaries sal
		ON emp.emp_id = sal.emp_id
			AND sal.end_at IS NULL
WHERE emp.fire_at IS NULL 
ORDER BY emp.emp_id desc
;



SELECT 
	COUNT(*)
FROM employees;

SELECT 
	COUNT(fire_at)
FROM employees;