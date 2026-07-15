-----Package Specification------

CREATE OR REPLACE PACKAGE agriculture_management_pkg AS

    PROCEDURE register_farmer(
        p_first_name IN VARCHAR2,
        p_last_name  IN VARCHAR2,
        p_phone      IN VARCHAR2,
        p_district   IN VARCHAR2,
        p_sector     IN VARCHAR2
    );

    FUNCTION calculate_order_total(
        p_order_id IN NUMBER
    ) RETURN NUMBER;

    FUNCTION check_available_stock(
        p_produce_id IN NUMBER
    ) RETURN NUMBER;

END agriculture_management_pkg;
/

--------Create Package Body-----

CREATE OR REPLACE PACKAGE BODY agriculture_management_pkg AS


    PROCEDURE register_farmer(
        p_first_name IN VARCHAR2,
        p_last_name  IN VARCHAR2,
        p_phone      IN VARCHAR2,
        p_district   IN VARCHAR2,
        p_sector     IN VARCHAR2
    )
    IS
    BEGIN

        INSERT INTO farmers
        (
            first_name,
            last_name,
            phone,
            district,
            sector
        )
        VALUES
        (
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
            DBMS_OUTPUT.PUT_LINE('Phone number already exists.');

        WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE(SQLERRM);

    END register_farmer;



    FUNCTION calculate_order_total(
        p_order_id IN NUMBER
    )
    RETURN NUMBER
    IS
        v_total NUMBER;
    BEGIN

        SELECT SUM(quantity * unit_price)
        INTO v_total
        FROM order_details
        WHERE order_id = p_order_id;

        RETURN NVL(v_total,0);

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 0;

        WHEN OTHERS THEN
            RETURN NULL;

    END calculate_order_total;



    FUNCTION check_available_stock(
        p_produce_id IN NUMBER
    )
    RETURN NUMBER
    IS
        v_quantity NUMBER;
    BEGIN

        SELECT available_quantity
        INTO v_quantity
        FROM inventory
        WHERE produce_id = p_produce_id;

        RETURN v_quantity;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 0;

        WHEN OTHERS THEN
            RETURN NULL;

    END check_available_stock;


END agriculture_management_pkg;
/

-----Create Package Body-------


CREATE OR REPLACE PACKAGE BODY agriculture_management_pkg AS


    PROCEDURE register_farmer(
        p_first_name IN VARCHAR2,
        p_last_name  IN VARCHAR2,
        p_phone      IN VARCHAR2,
        p_district   IN VARCHAR2,
        p_sector     IN VARCHAR2
    )
    IS
    BEGIN

        INSERT INTO farmers
        (
            first_name,
            last_name,
            phone,
            district,
            sector
        )
        VALUES
        (
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
            DBMS_OUTPUT.PUT_LINE('Phone number already exists.');

        WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE(SQLERRM);

    END register_farmer;



    FUNCTION calculate_order_total(
        p_order_id IN NUMBER
    )
    RETURN NUMBER
    IS
        v_total NUMBER;
    BEGIN

        SELECT SUM(quantity * unit_price)
        INTO v_total
        FROM order_details
        WHERE order_id = p_order_id;

        RETURN NVL(v_total,0);

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 0;

        WHEN OTHERS THEN
            RETURN NULL;

    END calculate_order_total;



    FUNCTION check_available_stock(
        p_produce_id IN NUMBER
    )
    RETURN NUMBER
    IS
        v_quantity NUMBER;
    BEGIN

        SELECT available_quantity
        INTO v_quantity
        FROM inventory
        WHERE produce_id = p_produce_id;

        RETURN v_quantity;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 0;

        WHEN OTHERS THEN
            RETURN NULL;

    END check_available_stock;


END agriculture_management_pkg;
/

