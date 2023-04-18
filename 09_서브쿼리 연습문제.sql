/*
���� 1.
-EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� �����͸� ��� �ϼ��� ( AVG(�÷�) ���)
-EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� ���� ����ϼ���
-EMPLOYEES ���̺��� job_id�� IT_PROG�� ������� ��ձ޿����� ���� ������� �����͸� ����ϼ���
*/
SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT COUNT(*)
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT *
FROM employees
WHERE salary >(SELECT AVG(salary) FROM employees WHERE job_id = 'IT_PROG');


/*
���� 2.
-DEPARTMENTS���̺��� manager_id�� 100�� ����� department_id��
EMPLOYEES���̺��� department_id�� ��ġ�ϴ� ��� ����� ������ �˻��ϼ���.
*/
SELECT *
FROM employees
WHERE department_id = (SELECT department_id FROM departments 
                       WHERE manager_id = 100);


/*
���� 3.
-EMPLOYEES���̺��� ��Pat���� manager_id���� ���� manager_id�� ���� ��� ����� �����͸� ����ϼ���
-EMPLOYEES���̺��� ��James��(2��)���� manager_id�� ���� ��� ����� �����͸� ����ϼ���.
*/
SELECT *
FROM employees
WHERE manager_id > (SELECT manager_id 
                    FROM employees 
                    WHERE first_name = 'Pat');

SELECT *
FROM employees
WHERE manager_id = ANY(SELECT manager_id
                        FROM employees
                        WHERE first_name = 'James');


/*
���� 4.
-EMPLOYEES���̺� ���� first_name�������� �������� �����ϰ�, 41~50��° �������� �� ��ȣ, �̸��� ����ϼ���
*/
SELECT * 
FROM 
    (
    SELECT ROWNUM AS rn, first_name
    FROM 
        (
        SELECT *
        FROM employees
        ORDER BY first_name DESC
        ) tbl
    )
WHERE rn BETWEEN 41 AND 50;


/*
���� 5.
-EMPLOYEES���̺��� hire_date�������� �������� �����ϰ�, 31~40��° �������� �� ��ȣ, ���id, �̸�, ��ȭ��ȣ, 
�Ի����� ����ϼ���.
*/
SELECT * 
FROM 
    (
    SELECT ROWNUM AS rn, employee_id, first_name, PHONE_NUMBER, hire_date
    FROM 
        (
        SELECT *
        FROM employees
        ORDER BY hire_date ASC
         ) tbl
    )
WHERE rn BETWEEN 31 AND 40;




