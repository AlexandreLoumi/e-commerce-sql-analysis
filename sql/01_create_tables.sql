-- Création d'une table orders où 1 ligne = 1 commande

CREATE TABLE orders (
    "Order ID" TEXT,
    "Order Date" TEXT NOT NULL,
    "CustomerName" TEXT NOT NULL,
    "State" TEXT,
    "City" TEXT
);

-- Création d'une table order_items où 1 produit = plusieurs lignes

CREATE TABLE order_items (
    "Order ID" TEXT,
    "Amount" NUMERIC NOT NULL,
    "Profit" NUMERIC NOT NULL,
    "Quantity" INT NOT NULL,
    "Category" TEXT NOT NULL,
    "Sub-Category" TEXT
);

-- Création d'une table sales_target 

CREATE TABLE sales_target (
    "Month of Order Date" TEXT NOT NULL,
    "Category" TEXT NOT NULL,
    "Target" NUMERIC NOT NULL
);

-- Standardisation des noms de colonnes pour chaque table

-- TABLE orders
ALTER TABLE orders
RENAME COLUMN "Order ID" TO order_id;

ALTER TABLE orders
RENAME COLUMN "Order Date" TO order_date;

ALTER TABLE orders
RENAME COLUMN "CustomerName" TO customer_name;

ALTER TABLE orders
RENAME COLUMN "State" TO state;

ALTER TABLE orders
RENAME COLUMN "City" TO city LIMIT 5;

-- Vérification
SELECT * FROM orders;

-- TABLE order_items
ALTER TABLE order_items
RENAME COLUMN "Order ID" TO order_id;

ALTER TABLE order_items
RENAME COLUMN "Amount" TO amount;

ALTER TABLE order_items
RENAME COLUMN "Profit" TO profit;

ALTER TABLE order_items
RENAME COLUMN "Quantity" TO quantity; 

ALTER TABLE order_items
RENAME COLUMN "Category" TO category;

ALTER TABLE order_items
RENAME COLUMN "Sub-Category" TO sub_category;

--Vérification
SELECT * FROM order_items LIMIT 5;

-- TABLE sales_target

ALTER TABLE sales_target
RENAME COLUMN "Month of Order Date" TO order_date;

ALTER TABLE sales_target
RENAME COLUMN "Category" TO category;

ALTER TABLE sales_target
RENAME COLUMN "Target" TO target;

-- Vérification
SELECT * FROM sales_target LIMIT 5;


-- Vérification et modification des types des colonnes pour chaque table

-- Vérification
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'orders'; -- Toutes les colonnes sont de type TEXT.

-- Changement des types pour la table orders
ALTER TABLE orders
ALTER COLUMN order_date TYPE DATE
USING TO_DATE(order_date, 'DD-MM-YYYY');

-- Ajout d'une PRIMARY KEY à la table orders
ALTER TABLE orders
ADD PRIMARY KEY (order_id);

-- NEXT STEP : FAIRE LA TRANSFORMATION DES AUTRES TABLES (types, keys...)