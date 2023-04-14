
-- �̳�(����) ����: INNER �ܾ� ���� ����
SELECT
    *
FROM info i
INNER JOIN auth a
ON i.auth_id = a.auth_id;

-- ����Ŭ ���� (�� ��� �� ��)
SELECT
    *
FROM info i, auth a
WHERE i.auth_id = a.auth_id;

--auth_id �÷��� �׳� ���� ��ȣ�ϴ� ��� ��
-- �� ������ ���� ���̺� ��� �����ϱ� ����
-- �̷����� �÷��� ���̺� �̸��� ���̴���, ��Ī�� �Ἥ Ȯ���ϰ� �����ؾ� �Ѵ�.
SELECT
    auth.auth_id, info.title, info.content, auth.name
FROM info 
INNER JOIN auth 
ON info.auth_id = auth.auth_id;

SELECT
    a.auth_id, i.title, i.content, a.name
FROM info i
INNER JOIN auth a
ON i.auth_id = a.auth_id;


-- �ʿ��� �����͸� ��ȸ�ϰڴ� ��� �Ѵٸ� WHERE ������ ���� �Ϲ� ������ �ɾ��ָ� �ȴ�.
SELECT
    a.auth_id, i.title, i.content, a.name
FROM info i
INNER JOIN auth a
ON i.auth_id = a.auth_id
WHERE a.name = '�̼���';


-- �ƿ���(�ܺ�) ����: OUTER �ܾ� ���� ����
SELECT
    *
FROM info i LEFT OUTER JOIN auth a --info�� �������� auth�� ���� ����
ON i.auth_id = a.auth_id;



SELECT
    *
FROM info i RIGHT OUTER JOIN auth a --auth�� �������� info�� ���� ����
ON i.auth_id = a.auth_id;


SELECT --����Ŭ ����: ���� ��������
    *
FROM info i, auth a 
WHERE i.auth_id = a.auth_id(+); --info�� �������� auth�� �ٴ´�


-- FULL OUTER JOIN
-- ���� ���̺�� ���� ���̺� �����͸� ��� �о� �ߺ��� �����ʹ� �����Ǵ� �ܺ� ����.: left���� + right����
SELECT *
FROM info i FULL JOIN auth a
ON i.auth_id = a.auth_id;


-- CROSS JOIN�� JOIN������ �������� �ʱ� ������ �ܼ��� ��� �÷��� ���� JOIN�� �����Ѵ�.
-- �����δ� ���� ������� �ʴ´�.
SELECT * FROM info --auth�� info�� ����
CROSS JOIN auth
ORDER BY id ASC;

-- ���� �� ���̺� ���� -> Ű ���� ã�Ƽ� ������ �����ؼ� ���� �ȴ�.
SELECT
    *
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
LEFT JOIN locations loc ON d.location_id = loc.location_id;

/*
- ���̺� ��Ī a, i�� �̿��Ͽ� LEFT OUTER JOIN ���.
- info, auth ���̺� ���
- job �÷��� scientist�� ����� id, title, content, job�� ���
*/
SELECT
    i.id, i.title, i.content, a.job
FROM auth a LEFT JOIN info i
ON a.auth_id = i.auth_id
WHERE a.job = 'scientist';


-- ���� �����̶� ���� ���̺� ������ ������ ���Ѵ�.
-- ���� ���̺� �÷��� ���� ������ �����ϴ� ���� ��Ī���� ������ �� ����Ѵ�.
SELECT 
    e1.employee_id, e1.first_name, e1.manager_id,
    e2.first_name, e2.employee_id
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.employee_id;
