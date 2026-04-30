-- ------------------
-- Transaction
-- ------------------
-- Transaction 시작
START TRANSACTION;
DESC employees;

INSERT INTO employees(
	`name`
	,birth
	,gender
	,hire_at	
	,sup_id
	,created_at
)
VALUES(
	'미어켓'
	,'1988-02-23'
	,'M'
	,NOW()	
	,NULL 
	,NOW()
);
COMMIT;
ROLLBACK;
