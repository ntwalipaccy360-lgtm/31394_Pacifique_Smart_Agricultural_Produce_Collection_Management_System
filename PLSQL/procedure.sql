//Procedure 1: Register a New Farmer//


CREATE OR REPLACE PROCEDURE register_farmer (
    p_first_name IN VARCHAR2,
    p_last_name  IN VARCHAR2,
    p_phone      IN VARCHAR2,
    p_district   IN VARCHAR2,
    p_sector     IN VARCHAR2
)
IS
BEGIN
    INSERT INTO farmers (
        first_name,
        last_name,
        phone,
        district,
        sector
    )
    VALUES (
        p_first_name,
        p_last_name,
        p_phone,
        p_district,
        p_sector
    );

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Farmer registered successfully.');

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: Phone number already exists.');

    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Unexpected Error: ' || SQLERRM);
END;
/


//Procedure 2: Record Produce Collection//


CREATE OR REPLACE PROCEDURE record_produce_collection (
    p_farmer_id    IN NUMBER,
    p_produce_id   IN NUMBER,
    p_employee_id  IN NUMBER,
    p_quantity     IN NUMBER,
    p_grade        IN VARCHAR2
)
IS
BEGIN

    INSERT INTO produce_collections
    (
        farmer_id,
        produce_id,
        employee_id,
        quantity,
        grade
    )
    VALUES
    (
        p_farmer_id,
        p_produce_id,
        p_employee_id,
        p_quantity,
        p_grade
    );

    UPDATE inventory
    SET available_quantity = available_quantity + p_quantity,
        last_updated = SYSDATE
    WHERE produce_id = p_produce_id;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Produce collection recorded successfully.');

EXCEPTION

    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE(SQLERRM);

END;
/

//Create Buyer Order//


CREATE OR REPLACE PROCEDURE create_order (
    p_buyer_id     IN NUMBER,
    p_employee_id  IN NUMBER,
    p_status       IN VARCHAR2
)
IS
BEGIN

    INSERT INTO orders
    (
        buyer_id,
        employee_id,
        status
    )
    VALUES
    (
        p_buyer_id,
        p_employee_id,
        UPPER(p_status)
    );

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Order created successfully.');

EXCEPTION

    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);

END;
/

