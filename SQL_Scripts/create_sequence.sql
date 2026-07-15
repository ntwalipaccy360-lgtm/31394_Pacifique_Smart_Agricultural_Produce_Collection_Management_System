-----PRODUCE_CATEGORIES_SEQUENCES-----

CREATE SEQUENCE category_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

-----Create_Farmers_table----
CREATE SEQUENCE farmer_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

-----Create_Employee_table----

CREATE SEQUENCE employee_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

//sequences for buyers // 

CREATE SEQUENCE buyer_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

//sequences for holiday //

CREATE SEQUENCE holiday_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

//sequences for produce//
CREATE SEQUENCE produce_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

//sequences for produce collection //
CREATE SEQUENCE collection_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

//triggers for produce collection//

CREATE OR REPLACE TRIGGER collection_id_trigger
BEFORE INSERT ON produce_collections
FOR EACH ROW
BEGIN
    IF :NEW.collection_id IS NULL THEN
        SELECT collection_seq.NEXTVAL
        INTO :NEW.collection_id
        FROM dual;
    END IF;
END;
/

//sequences for inventory//
CREATE SEQUENCE inventory_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

//sequences for orders //

CREATE SEQUENCE order_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

//sequences for order detail//

CREATE SEQUENCE order_detail_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

//sequences for payment//

CREATE SEQUENCE payment_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

//sequences for audit//

CREATE SEQUENCE audit_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

