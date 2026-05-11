USE portal_db;

LOAD DATA LOCAL INFILE 'C:/Users/akank/Downloads/portal_web_logs.csv'
INTO TABLE portal_web_logs
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE customer_profiles (
    age INT,
    sex VARCHAR(10),
    bmi FLOAT,
    children INT,
    smoker VARCHAR(5),
    region VARCHAR(20),
    expenses FLOAT,
    customer_id INT PRIMARY KEY
);

LOAD DATA LOCAL INFILE 'C:/Users/akank/Downloads/customer_profiles.csv'
INTO TABLE customer_profiles
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Table 2: Policy Details
CREATE TABLE policy_details (
    customer_id INT,
    policy_id VARCHAR(20) PRIMARY KEY,
    policy_type VARCHAR(50),
    expiry_date DATE,
    premium_amount FLOAT,
    payment_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customer_profiles(customer_id)
);

LOAD DATA LOCAL INFILE 'C:/Users/akank/Downloads/policy_details.csv'
INTO TABLE policy_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
