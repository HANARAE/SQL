
-- WHILE문

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


-- 탈출문
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


-- FOR문
DECLARE
    v_num NUMBER := 3;
BEGIN

    FOR i IN 1..9 -- .을 두 개 작성해서 범위를 표현
    LOOP
        dbms_output.put_line(v_num || 'x' || i || '=' || v_num*i);
    END LOOP;

END;


-- CONTINUE문
DECLARE
    v_num NUMBER := 3;
BEGIN

    FOR i IN 1..9 -- .을 두 개 작성해서 범위를 표현
    LOOP
        CONTINUE WHEN i = 5;
        dbms_output.put_line(v_num || 'x' || i || '=' || v_num*i);
    END LOOP;

END;



-- 1. 모든 구구단을 출력하는 익명 블록을 만들어라. (2~9단) -> 중첩for문 쓰셈
BEGIN

    FOR i IN 2..9 -- .을 두 개 작성해서 범위를 표현
        
    LOOP
        dbms_output.put_line(i || '단');
        FOR j IN 1..9
            LOOP
                dbms_output.put_line(i || 'x' || j || '=' || j*i);
            END LOOP;
            dbms_output.put_line('-----------');
    END LOOP;

END;



-- 2. INSERT를 300번 실행하는 익명 블록을 처리해라.
-- board라는 이름의 테이블을 만들어라. (bno, writer, title 컬럼이 존재한다.)
-- bno는 SEQUENCE로 올려주고, writer와 title에 번호를 붙여서 INSERT 진행하라.
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







