------PRODUCE_CATEGORIES_TRIGERS-------
CREATE OR REPLACE TRIGGER category_id_trigger
BEFORE INSERT ON produce_categories
FOR EACH ROW
BEGIN
    IF :NEW.category_id IS NULL THEN
        SELECT category_seq.NEXTVAL
        INTO :NEW.category_id
        FROM dual;
    END IF;
END;
/

-----Create_Farmer_trigger-----


CREATE OR REPLACE TRIGGER farmer_id_trigger
BEFORE INSERT ON farmers
FOR EACH ROW
BEGIN
    IF :NEW.farmer_id IS NULL THEN
        SELECT farmer_seq.NEXTVAL
        INTO :NEW.farmer_id
        FROM dual;
    END IF;
END;
/

-----Create_Employee_trigger-----

CREATE OR REPLACE TRIGGER employee_id_trigger
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    IF :NEW.employee_id IS NULL THEN
        SELECT employee_seq.NEXTVAL
        INTO :NEW.employee_id
        FROM dual;
    END IF;
END;
/
//triggers for buyers//
CREATE OR REPLACE TRIGGER buyer_id_trigger
BEFORE INSERT ON buyers
FOR EACH ROW
BEGIN
    IF :NEW.buyer_id IS NULL THEN
        SELECT buyer_seq.NEXTVAL
        INTO :NEW.buyer_id
        FROM dual;
    END IF;
END;
/

//triggers for holiday table//

CREATE OR REPLACE TRIGGER holiday_id_trigger
BEFORE INSERT ON public_holidays
FOR EACH ROW
BEGIN
    IF :NEW.holiday_id IS NULL THEN
        SELECT holiday_seq.NEXTVAL
        INTO :NEW.holiday_id
        FROM dual;
    END IF;
END;
/

//triggers for the produce//

CREATE OR REPLACE TRIGGER produce_id_trigger
BEFORE INSERT ON produce
FOR EACH ROW
BEGIN
    IF :NEW.produce_id IS NULL THEN
        SELECT produce_seq.NEXTVAL
        INTO :NEW.produce_id
        FROM dual;
    END IF;
END;
/
 
//triggers for the inventory //
CREATE OR REPLACE TRIGGER inventory_id_trigger
BEFORE INSERT ON inventory
FOR EACH ROW
BEGIN
    IF :NEW.inventory_id IS NULL THEN
        SELECT inventory_seq.NEXTVAL
        INTO :NEW.inventory_id
        FROM dual;
    END IF;
END;
/

//triggers for the orders //

CREATE OR REPLACE TRIGGER order_id_trigger
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    IF :NEW.order_id IS NULL THEN
        SELECT order_seq.NEXTVAL
        INTO :NEW.order_id
        FROM dual;
    END IF;
END;
/

//triggers for the order detail//

CREATE OR REPLACE TRIGGER order_detail_id_trigger
BEFORE INSERT ON order_details
FOR EACH ROW
BEGIN
    IF :NEW.order_detail_id IS NULL THEN
        SELECT order_detail_seq.NEXTVAL
        INTO :NEW.order_detail_id
        FROM dual;
    END IF;
END;
/

//triggers for payment//

CREATE OR REPLACE TRIGGER payment_id_trigger
BEFORE INSERT ON payments
FOR EACH ROW
BEGIN
    IF :NEW.payment_id IS NULL THEN
        SELECT payment_seq.NEXTVAL
        INTO :NEW.payment_id
        FROM dual;
    END IF;
END;
/

//triggers for audit//

CREATE OR REPLACE TRIGGER farmer_audit_trigger

AFTER INSERT OR UPDATE OR DELETE
ON farmers

FOR EACH ROW

BEGIN

    IF INSERTING THEN

        INSERT INTO audit_log
        (
            audit_id,
            username,
            action_type,
            table_name,
            description
        )
        VALUES
        (
            audit_seq.NEXTVAL,
            USER,
            'INSERT',
            'FARMERS',
            'New farmer record inserted'
        );


    ELSIF UPDATING THEN

        INSERT INTO audit_log
        (
            audit_id,
            username,
            action_type,
            table_name,
            description
        )
        VALUES
        (
            audit_seq.NEXTVAL,
            USER,
            'UPDATE',
            'FARMERS',
            'Farmer record updated'
        );


    ELSIF DELETING THEN

        INSERT INTO audit_log
        (
            audit_id,
            username,
            action_type,
            table_name,
            description
        )
        VALUES
        (
            audit_seq.NEXTVAL,
            USER,
            'DELETE',
            'FARMERS',
            'Farmer record deleted'
        );

    END IF;

END;
/

CREATE OR REPLACE TRIGGER business_hours_restriction
BEFORE INSERT OR UPDATE OR DELETE ON farmers
BEGIN
    -- Block on weekdays
    IF TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH') 
       NOT IN ('SAT', 'SUN') THEN
        RAISE_APPLICATION_ERROR(-20001, 
            'Transactions only allowed on weekends!');
    END IF;
    
    -- Block on public holidays
    FOR rec IN (SELECT holiday_date FROM public_holidays) LOOP
        IF TRUNC(SYSDATE) = TRUNC(rec.holiday_date) THEN
            RAISE_APPLICATION_ERROR(-20002, 
                'Transactions not allowed on public holidays!');
        END IF;
    END LOOP;
END;
/


