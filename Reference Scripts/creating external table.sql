-- Step 1: Create a master key (only once per DB)
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'YourStrongPassword123!';

-- Step 2: Create a scoped credential
CREATE DATABASE SCOPED CREDENTIAL my_cred
WITH IDENTITY = 'Managed Identity';

-- Step 3: Create external data source for Silver
CREATE EXTERNAL DATA SOURCE source_silver
WITH (
    LOCATION = 'https://awstoragedatalakebasic.blob.core.windows.net/silver',
    CREDENTIAL = my_cred
);

-- Step 4: Create external data source For Gold Layer
CREATE EXTERNAL DATA SOURCE source_gold
WITH (
    LOCATION = 'https://awstoragedatalakebasic.blob.core.windows.net/gold',
    CREDENTIAL = my_cred
);


-- Step 4: Create external file format
CREATE EXTERNAL FILE FORMAT parquet_format
WITH (
    FORMAT_TYPE = PARQUET
);

-- Step 5: Create external table
CREATE EXTERNAL TABLE sales_external 
WITH (
    LOCATION = 'extsales',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = parquet_format
)
AS SELECT * from gold.sales;

 
SELECT * FROM sales_external;

CREATE EXTERNAL TABLE customers_external 
WITH (
    LOCATION = 'extcustomers',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = parquet_format
)
AS SELECT * from gold.customers;

 
SELECT * FROM customers_external;

