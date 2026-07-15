---------Cursor 1: Farmer Collection Report-----------

SET SERVEROUTPUT ON;

DECLARE

    CURSOR farmer_cursor IS
        SELECT
            f.first_name,
            f.last_name,
            p.produce_name,
            pc.quantity,
            pc.grade
        FROM farmers f
        JOIN produce_collections pc
            ON f.farmer_id = pc.farmer_id
        JOIN produce p
            ON pc.produce_id = p.produce_id;

    v_first_name farmers.first_name%TYPE;
    v_last_name  farmers.last_name%TYPE;
    v_produce    produce.produce_name%TYPE;
    v_quantity   produce_collections.quantity%TYPE;
    v_grade      produce_collections.grade%TYPE;

BEGIN

    OPEN farmer_cursor;

    LOOP

        FETCH farmer_cursor
        INTO
            v_first_name,
            v_last_name,
            v_produce,
            v_quantity,
            v_grade;

        EXIT WHEN farmer_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            v_first_name || ' ' ||
            v_last_name || ' delivered ' ||
            v_quantity || ' Kg of ' ||
            v_produce || ' (Grade ' ||
            v_grade || ')'
        );

    END LOOP;

    CLOSE farmer_cursor;

END;
/

---------Cursor 2: Buyer Order Report--------

SET SERVEROUTPUT ON;

DECLARE

    CURSOR buyer_order_cursor IS
        SELECT
            b.buyer_name,
            o.order_id,
            o.order_date,
            o.status
        FROM buyers b
        JOIN orders o
            ON b.buyer_id = o.buyer_id;


    v_buyer_name buyers.buyer_name%TYPE;
    v_order_id   orders.order_id%TYPE;
    v_date       orders.order_date%TYPE;
    v_status     orders.status%TYPE;


BEGIN

    OPEN buyer_order_cursor;

    LOOP

        FETCH buyer_order_cursor
        INTO
            v_buyer_name,
            v_order_id,
            v_date,
            v_status;


        EXIT WHEN buyer_order_cursor%NOTFOUND;


        DBMS_OUTPUT.PUT_LINE(
            'Buyer: ' ||
            v_buyer_name ||
            ' | Order ID: ' ||
            v_order_id ||
            ' | Date: ' ||
            v_date ||
            ' | Status: ' ||
            v_status
        );


    END LOOP;


    CLOSE buyer_order_cursor;


END;
/
