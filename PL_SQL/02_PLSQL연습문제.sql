
-- 1. ������ �� 3���� ����ϴ� �͸� ����� ����� ����. (��¹� 9���� �����ؼ� ���)
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


-- 2. employees ���̺��� 201�� ����� �̸��� �̸��� �ּҸ� ����ϴ� �͸� ����� ����� ����.
-- (������ ��Ƽ� ���)
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
    DBMS_OUTPUT.put_line('�̸�: ' || v_emp_name);
    DBMS_OUTPUT.put_line('�̸����ּ�: ' || v_emp_email);
END;


-- 3. employees ���̺��� �����ȣ�� ���� ū ����� ã�Ƴ� �� (MAX �Լ� ���)
-- �� ��ȣ + 1������ �Ʒ��� ����� emps
-- employee_id, last_name, email, hire_date, job_id�� �ű� �����ϴ� �͸����� ������.
-- SELECT�� ���Ŀ� INSERT�� ����� ����. (������ �÷��� �ƹ� ���̳� �־��)
/*
<�����>: steven
<�̸���> stevenjobs
<�Ի�����>: ���ó�¥
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

