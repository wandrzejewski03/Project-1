CREATE TABLE orders (
row_id INT PRIMARY KEY,
order_id VARCHAR(10),
created_at DATETIME,
item_id VARCHAR(10),
quantity INT,
cust_id INT,
delivery BOOLEAN,
add_id INT

);



CREATE TABLE customers (
cust_id INT PRIMARY KEY,
cust_firstname VARCHAR(50),
cust_lastname VARCHAR(50)
);



CREATE TABLE address (
add_id INT PRIMARY KEY,
delivery_address1 VARCHAR(200),
delivery_address2 VARCHAR(200),
delivery_city VARCHAR(50),
delivery_zipcode VARCHAR(20)
);



CREATE TABLE item (
item_id VARCHAR(10) PRIMARY KEY,
sku VARCHAR(20),
item_name VARCHAR(100),
item_cat VARCHAR(100),
item_size VARCHAR(10),
item_price DECIMAL(10,2)
)



CREATE TABLE ingredient (
ing_id VARCHAR(10) PRIMARY KEY,
ing_name VARCHAR(200),
ing_weight INT,
ing_meas VARCHAR(20),
ing_price DECIMAL(5,2)
)



CREATE TABLE recipe (
row_id INT PRIMARY KEY,
recipe_id VARCHAR(20),
ing_id VARCHAR(10),
quantity INT
)



CREATE TABLE inventory (
inv_id INT PRIMARY KEY,
item_id VARCHAR(10),
quantity INT
)



CREATE TABLE staff (
staff_id VARCHAR(20) PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
position VARCHAR(100),
hourly_rate DECIMAL(5,2)
)



CREATE TABLE shift (
shift_id VARCHAR(20) PRIMARY KEY,
day_of_week VARCHAR(10),
start_time TIME,
end_time TIME
)



CREATE TABLE rota (
row_id INT PRIMARY KEY,
rota_id VARCHAR(20),
date_ DATE,
shift_id VARCHAR(20),
staff_id VARCHAR(20)
)

CREATE TABLE orders_rota (
row_id INT PRIMARY KEY,
date_ DATE
)

ALTER TABLE orders
ADD CONSTRAINT fk_cust_id
FOREIGN KEY(cust_id) REFERENCES customers(cust_id);


ALTER TABLE orders
ADD CONSTRAINT fk_item_id
FOREIGN KEY(item_id) REFERENCES item(item_id);


ALTER TABLE orders
ADD CONSTRAINT fk_add_id
FOREIGN KEY(add_id) REFERENCES address(add_id);


ALTER TABLE rota
ADD CONSTRAINT 
UNIQUE(date_);

ALTER TABLE orders
ADD CONSTRAINT
UNIQUE(created_at)


ALTER TABLE rota 
ADD CONSTRAINT fk_created_at
FOREIGN KEY(date_) REFERENCES orders(created_at);


ALTER TABLE recipe
ADD CONSTRAINT fk_ing_id
FOREIGN KEY(ing_id) REFERENCES ingredient(ing_id);



ALTER TABLE recipe
ADD CONSTRAINT fk_recipe_id_sku
FOREIGN KEY(recipe_id) REFERENCES item(sku);


ALTER TABLE recipe
ADD CONSTRAINT fk_inv_recipe
FOREIGN KEY(ing_id) REFERENCES inventory(item_id)





 
ALTER TABLE rota
ADD CONSTRAINT fk_staff_id
FOREIGN KEY(staff_id) REFERENCES staff(staff_id);

ALTER TABLE rota
ADD CONSTRAINT fk_shift_id
FOREIGN KEY(shift_id) REFERENCES shift(shift_id);

ALTER TABLE rota
ADD CONSTRAINT fk_date_orders_rota
FOREIGN KEY(date_) REFERENCES orders(date_);



ALTER TABLE orders
DROP CONSTRAINT fk_order_rotaorder

ALTER TABLE orders
ADD CONSTRAINT fk_order_rotaorder
FOREIGN KEY(date_) REFERENCES orders_rota(date_)

ALTER TABLE rota
ADD CONSTRAINT fk_rota_rotaorder
FOREIGN KEY(date_) REFERENCES orders_rota(date_)


DELETE FROM orders
WHERE row_id > 0

select * from orders
select * from orders_rota


