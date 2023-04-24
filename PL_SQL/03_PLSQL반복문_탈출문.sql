
-- WHILE��

DECLARE
    v_num NUMBER := 3;
    v_count NUMBER := 1;
BEGIN
    WHILE v_count <= 10
    LOOP
        dbms_output.put_line(v_num);
        v_count := v_count + 1;
    END LOOP;
END;


-- Ż�⹮
DECLARE
    v_num NUMBER := 3;
    v_count NUMBER := 1;
BEGIN
    WHILE v_count <= 10
    LOOP
        dbms_output.put_line(v_num);
        EXIT WHEN v_count = 5;
        v_count := v_count + 1;
    END LOOP;
END;


-- FOR��
DECLARE
    v_num NUMBER := 3;
BEGIN

    FOR i IN 1..9 -- .�� �� �� �ۼ��ؼ� ������ ǥ��
    LOOP
        dbms_output.put_line(v_num || 'x' || i || '=' || v_num*i);
    END LOOP;

END;


-- CONTINUE��
DECLARE
    v_num NUMBER := 3;
BEGIN

    FOR i IN 1..9 -- .�� �� �� �ۼ��ؼ� ������ ǥ��
    LOOP
        CONTINUE WHEN i = 5;
        dbms_output.put_line(v_num || 'x' || i || '=' || v_num*i);
    END LOOP;

END;



-- 1. ��� �������� ����ϴ� �͸� ����� ������. (2~9��) -> ��øfor�� ����
BEGIN

    FOR i IN 2..9 -- .�� �� �� �ۼ��ؼ� ������ ǥ��
        
    LOOP
        dbms_output.put_line(i || '��');
        FOR j IN 1..9
            LOOP
                dbms_output.put_line(i || 'x' || j || '=' || j*i);
            END LOOP;
            dbms_output.put_line('-----------');
    END LOOP;

END;



-- 2. INSERT�� 300�� �����ϴ� �͸� ����� ó���ض�.
-- board��� �̸��� ���̺��� ������. (bno, writer, title �÷��� �����Ѵ�.)
-- bno�� SEQUENCE�� �÷��ְ�, writer�� title�� ��ȣ�� �ٿ��� INSERT �����϶�.
-- ex) 1, test1, title1 -> 2, test2, title2 -> 3, test3, title3 ....
DROP SEQUENCE board_seq;

DROP TABLE board;

CREATE SEQUENCE board_seq
    START WITH 1 
    MAXVALUE 300 
    NOCACHE;

CREATE TABLE board (
    bno NUMBER(3) PRIMARY KEY,
    writer VARCHAR2(20),
    title VARCHAR2(20)
);

DECLARE
    v_num NUMBER := 1;
BEGIN
    WHILE v_num <= 300
    LOOP
        INSERT INTO board
        VALUES(board_seq.NEXTVAL, 'test'||i, 'title'||i);
        v_num := v_num+1;
    END LOOP;
END;


SELECT * FROM board;







