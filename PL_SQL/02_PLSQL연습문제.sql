
-- 1. 구구단 중 3단을 출력하는 익명 블록을 만들어 보자. (출력문 9개를 복사해서 써라)
SET SERVEROUTPUT ON;

DECLARE
    num NUMBER :=3;
BEGIN
    DBMS_OUTPUT.put_line('3x1=' || num*1);
    DBMS_OUTPUT.put_line('3x2=' || num*2);
    DBMS_OUTPUT.put_line('3x3=' || num*3);
    DBMS_OUTPUT.put_line('3x4=' || num*4);
    DBMS_OUTPUT.put_line('3x5=' || num*5);
    DBMS_OUTPUT.put_line('3x6=' || num*6);
    DBMS_OUTPUT.put_line('3x7=' || num*7);
    DBMS_OUTPUT.put_line('3x8=' || num*8);
    DBMS_OUTPUT.put_line('3x9=' || num*9);
END;


-- 2. employees 테이블에서 201번 사원의 이름과 이메일 주소를 출력하는 익명 블록을 만들어 보자.
-- (변수에 담아서 출력)
DECLARE
    v_emp_name VARCHAR2(20);
    v_emp_email VARCHAR2(30);
BEGIN
    SELECT
        first_name, email
    INTO
        v_emp_name, v_emp_email 
    FROM employees 
    WHERE employee_id = 201;
    DBMS_OUTPUT.put_line('이름: ' || v_emp_name);
    DBMS_OUTPUT.put_line('이메일주소: ' || v_emp_email);
END;


-- 3. employees 테이블에서 사원번호가 제일 큰 사원을 찾아낸 뒤 (MAX 함수 사용)
-- 이 번호 + 1번으로 아래의 사원을 emps
-- employee_id, last_name, email, hire_date, job_id를 신규 삽입하는 익명블록을 만들자.
-- SELECT절 이후에 INSERT문 사용이 가능. (나머지 컬럼은 아무 값이나 넣어라)
/*
<사원명>: steven
<이메일> stevenjobs
<입사일자>: 오늘날짜
<JOB_ID>: CEO
*/

DROP TABLE emps;
CREATE TABLE emps AS (SELECT * FROM employees WHERE 1=2);

DECLARE
    v_emp_max_employee_id NUMBER;
BEGIN
    SELECT MAX(employee_id)
    INTO v_emp_max_employee_id
    FROM employees;

    INSERT INTO emps
        (employee_id, last_name, email, hire_date, job_id)
    VALUES
        (v_emp_max_employee_id + 1, 'steven', 'stevenjobs', sysdate, 'CEO');
END;

SELECT * FROM emps;

COMMIT;

