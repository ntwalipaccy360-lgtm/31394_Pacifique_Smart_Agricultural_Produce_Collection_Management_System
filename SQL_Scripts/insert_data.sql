----INSERT_DATA_PRODUCE_CATEGORIES-----

INSERT INTO produce_categories(category_name)
VALUES ('Cereals');

INSERT INTO produce_categories(category_name)
VALUES ('Vegetables');

INSERT INTO produce_categories(category_name)
VALUES ('Fruits');

-----Test_Insertion_to_Farmer_table-----

INSERT INTO farmers
(first_name, last_name, phone, district, sector)
VALUES
('Jean', 'Uwase', '0788123456', 'Gasabo', 'Kimironko');


INSERT INTO farmers
(first_name, last_name, phone, district, sector)
VALUES
('Patrick', 'Mugisha', '0788234567', 'Nyarugenge', 'Nyamirambo');


INSERT INTO farmers
(first_name, last_name, phone, district, sector)
VALUES
('Aline', 'Mukamana', '0788345678', 'Kicukiro', 'Niboye');


COMMIT;

-----Test_Insertion_to_Employee_table-----

INSERT INTO employees
(first_name, last_name, position, phone)
VALUES
('David', 'Niyonzima', 'Manager', '0788456789');


INSERT INTO employees
(first_name, last_name, position, phone)
VALUES
('Grace', 'Mukamana', 'Collection Officer', '0788567890');


INSERT INTO employees
(first_name, last_name, position, phone)
VALUES
('Eric', 'Habimana', 'Sales Officer', '0788678901');

COMMIT;

//insertion of buyers //

INSERT INTO buyers
(buyer_name, phone, address)
VALUES
('Kigali Fresh Market', '0788789012', 'Kigali');


INSERT INTO buyers
(buyer_name, phone, address)
VALUES
('Sunrise Hotel', '0788890123', 'Gasabo');


INSERT INTO buyers
(buyer_name, phone, address)
VALUES
('Green Valley Restaurant', '0788901234', 'Kicukiro');


COMMIT;

//insertion for the holidays//
INSERT INTO public_holidays
(holiday_name, holiday_date)
VALUES
('Independence Day', TO_DATE('01-07-2026','DD-MM-YYYY'));


INSERT INTO public_holidays
(holiday_name, holiday_date)
VALUES
('Liberation Day', TO_DATE('04-07-2026','DD-MM-YYYY'));


INSERT INTO public_holidays
(holiday_name, holiday_date)
VALUES
('Christmas Day', TO_DATE('25-12-2026','DD-MM-YYYY'));


COMMIT;

//insertion of produce//
INSERT INTO produce
(produce_name, unit, price_per_kg, category_id)
VALUES
('Maize','Kg',450,1);


INSERT INTO produce
(produce_name, unit, price_per_kg, category_id)
VALUES
('Tomatoes','Kg',700,2);


INSERT INTO produce
(produce_name, unit, price_per_kg, category_id)
VALUES
('Bananas','Kg',500,3);


COMMIT;

//insertion of produce collection//
INSERT INTO produce_collections
(farmer_id, produce_id, employee_id, quantity, grade)
VALUES
(1, 1, 2, 500, 'A');


INSERT INTO produce_collections
(farmer_id, produce_id, employee_id, quantity, grade)
VALUES
(2, 2, 2, 300, 'B');


INSERT INTO produce_collections
(farmer_id, produce_id, employee_id, quantity, grade)
VALUES
(3, 3, 1, 200, 'A');


COMMIT;

//insertion of inventory // 
INSERT INTO inventory
(produce_id, available_quantity)
VALUES
(1,500);


INSERT INTO inventory
(produce_id, available_quantity)
VALUES
(2,300);


INSERT INTO inventory
(produce_id, available_quantity)
VALUES
(3,200);


COMMIT;

//insertion in order //

INSERT INTO orders
(buyer_id, employee_id, status)
VALUES
(1,3,'COMPLETED');


INSERT INTO orders
(buyer_id, employee_id, status)
VALUES
(2,3,'PENDING');


INSERT INTO orders
(buyer_id, employee_id, status)
VALUES
(3,1,'COMPLETED');


COMMIT;


//insertion in order detail //

INSERT INTO order_details
(order_id, produce_id, quantity, unit_price)
VALUES
(1,1,100,450);


INSERT INTO order_details
(order_id, produce_id, quantity, unit_price)
VALUES
(2,2,50,700);


INSERT INTO order_details
(order_id, produce_id, quantity, unit_price)
VALUES
(3,3,80,500);


COMMIT;

//insertion for payments//

INSERT INTO payments
(order_id, amount, payment_method)
VALUES
(1,45000,'Mobile Money');


INSERT INTO payments
(order_id, amount, payment_method)
VALUES
(2,35000,'Bank Transfer');


INSERT INTO payments
(order_id, amount, payment_method)
VALUES
(3,40000,'Cash');


COMMIT;


//insertion in audit//


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
    'Test',
    'Farmer',
    '0788999999',
    'Kigali',
    'Gasabo'
);

COMMIT;



