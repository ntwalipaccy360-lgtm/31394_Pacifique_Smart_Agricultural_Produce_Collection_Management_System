--------Calculate Total Amount for an Order--------

CREATE OR REPLACE FUNCTION calculate_order_total (
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

    RETURN NVL(v_total, 0);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;

    WHEN OTHERS THEN
        RETURN NULL;
END;
/

-----Check Available Stock------

CREATE OR REPLACE FUNCTION check_available_stock (
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
END;
/

-----Count Orders for a Buyer-----

CREATE OR REPLACE FUNCTION count_buyer_orders (
    p_buyer_id IN NUMBER
)
RETURN NUMBER
IS
    v_total NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_total
    FROM orders
    WHERE buyer_id = p_buyer_id;

    RETURN v_total;

EXCEPTION
    WHEN OTHERS THEN
        RETURN NULL;
END;
/

