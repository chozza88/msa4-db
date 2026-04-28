-- 1. 사원의 사원번호, 이름, 직급코드를 출력해 주세요.
SELECT 
	emp.emp_id
	,emp.`name`
	,tie.title_code
FROM employees emp
	JOIN title_emps tie
		ON emp.emp_id = tie.emp_id
			AND emp.fire_at IS NULL 
			AND tie.end_at IS NULL
ORDER BY emp.emp_id
; 

-- 2. 사원의 사원번호, 성별, 현재 연봉을 출력해 주세요.
SELECT 
	emp.emp_id
	,emp.gender
	,sal.salary
FROM employees emp
	JOIN salaries sal
		ON emp.emp_id = sal.emp_id
			AND sal.end_at IS NULL 
			AND emp.fire_at IS NULL 
ORDER BY sal.salary
;
-- 3. 10010 사원의 이름과 과거부터 현재까지 연봉 이력을 출력해 주세요.
SELECT 
	emp.emp_id
	,emp.`name`
	,sal.salary
	,sal.start_at
	,sal.end_at
FROM employees emp
	JOIN salaries sal
		ON emp.emp_id = sal.emp_id
			AND sal.emp_id = 10010
ORDER BY sal.start_at;
;

-- 4. 사원의 사원번호, 이름, 소속부서명을 출력해 주세요.

SELECT 
	emp.emp_id
	,emp.`name`
	,dept.dept_name
FROM employees emp
	JOIN department_emps dee
		ON emp.emp_id = dee.emp_id
			AND dee.end_at IS NULL 
	JOIN departments dept
		ON dee.dept_code = dept.dept_code
ORDER BY dept.dept_name, emp.emp_id
;

-- 5. 현재 연봉의 상위 10위까지 사원의 사번, 이름, 연봉을 출력해 주세요.
SELECT 
	emp.emp_id
	,emp.`name`
	,sal.salary
FROM employees emp
	JOIN salaries sal
		ON emp.emp_id = sal.emp_id
			AND sal.end_at IS NULL
ORDER BY sal.salary DESC 
LIMIT 10			 
;

-- 6. 현재 각 부서의 부서장의 부서명, 이름, 입사일을 출력해 주세요.
SELECT 
	dept.dept_name
	,emp.`name`
	,emp.hire_at
FROM employees emp
	JOIN department_managers dem
		ON emp.emp_id = dem.emp_id
			AND dem.end_at IS NULL 
			AND emp.fire_at IS NULL 
	JOIN departments dept
		ON dem.dept_code = dept.dept_code
		AND dept.end_at IS NULL 	
ORDER BY dept.dept_name, emp.hire_at		
;

-- 7. 현재 직급이 "부장"인 사원들의 연봉 평균을 출력해 주세요.
SELECT 
	AVG(sal.salary)
FROM titles tte
	JOIN title_emps tie
		ON tte.title_code =tie.title_code
			AND tte.title = "부장"
			AND tie.end_at IS NULL 
	JOIN employees emp
		ON tie.emp_id = emp.emp_id
			AND emp.fire_at IS NULL 
	JOIN salaries sal
		ON emp.emp_id = sal.emp_id
			AND sal.end_at IS NULL 			
;

-- 8. 부서장직을 역임했던 모든 사원의 이름과 입사일, 사번, 부서번호를 출력해 주세요.
SELECT 
	emp.`name`
	,emp.hire_at
	,emp.emp_id
	,depm.dept_code
FROM employees emp
	JOIN department_managers depm
		ON emp.emp_id = depm.emp_id
;
-- 9. 현재 각 직급별 평균연봉 중 60,000,000이상인 직급의 직급명, 평균연봉(정수)를을 평균연봉 내림차순으로 출력해 주세요.
SELECT 
	tit.title
	,FLOOR(AVG(sal.salary)) avg_salary
FROM titles tit
	JOIN title_emps tie
		ON tit.title_code = tie.title_code
			AND tie.end_at IS NULL 
	JOIN employees emp
		ON tie.emp_id = emp.emp_id
	JOIN salaries sal
		ON emp.emp_id = sal.emp_id
			AND sal.end_at IS NULL 
GROUP BY tit.title
HAVING AVG(sal.salary) >= 60000000
ORDER BY avg_salary DESC 
;
-- 10. 성별이 여자인 사원들의 직급별 사원수를 출력해 주세요.

SELECT 
	tie.title_code
	,COUNT(*)
FROM employees emp
	JOIN title_emps tie
		ON emp.emp_id = tie.emp_id 
			AND emp.gender = 'F'
			AND tie.end_at IS NULL 
GROUP BY tie.title_code
;

-- 7-1. (보너스)현재 각 부장별 이름, 연봉평균

SELECT 
	emp.`name`
	,AVG(sal.salary)
FROM titles tit
	JOIN title_emps tie  
		ON tit.title_code = tie.title_code
			AND tit.title = "부장"
			AND tie.end_at IS NULL 
	JOIN employees emp
		ON tie.emp_id = emp.emp_id
	JOIN salaries sal
		ON emp.emp_id = sal.emp_id
			AND sal.end_at IS NULL 
GROUP BY emp.emp_id, emp.`name`
;