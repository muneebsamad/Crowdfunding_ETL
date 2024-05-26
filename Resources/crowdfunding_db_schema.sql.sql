-- crowdfunding_db_schema.sql

CREATE TABLE contacts (
    contact_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE category (
    category_id VARCHAR(50) PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE subcategory (
    subcategory_id VARCHAR(50) PRIMARY KEY,
    subcategory_name VARCHAR(255) NOT NULL,
    category_id VARCHAR(50) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE campaign (
    cf_id SERIAL PRIMARY KEY,
    contact_id INTEGER NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    description TEXT,
    goal NUMERIC NOT NULL,
    pledged NUMERIC NOT NULL,
    outcome VARCHAR(50),
    backers_count INTEGER NOT NULL,
    country VARCHAR(50),
    currency VARCHAR(50),
    launch_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    staff_pick BOOLEAN,
    spotlight BOOLEAN,
    category_id VARCHAR(50) NOT NULL,
    subcategory_id VARCHAR(50) NOT NULL,
    FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id),
    FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id)
);