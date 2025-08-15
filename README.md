# Azure-Medallion-Data-Pipeline
End-to-end Azure Data Engineering project implementing Medallion Architecture with Data Factory, Databricks, Synapse Analytics, and Power BI.


## 📌 Overview
This repository showcases a **comprehensive end-to-end Azure Data Engineering pipeline** built using the **Medallion Architecture** (Bronze → Silver → Gold).  
It demonstrates **real-world, production-grade design patterns** with a focus on **reusability, scalability, and security**.

The project covers:
- **Data ingestion** using **Azure Data Factory (ADF)** with **dynamic pipelines**
- **Data transformation** using **Azure Databricks** and **PySpark**
- **Data serving** using **Azure Synapse Analytics**
- **Visualization & reporting** via **Power BI**
- **Secure service connections** with **Azure Managed Identities**

This architecture is commonly used in modern data engineering solutions, making it ideal for **interview preparation** and **practical learning**.

---

## 🏗 Architecture
![Architecture Diagram](<img width="1366" height="768" alt="20250815_1809_image" src="https://github.com/user-attachments/assets/6c5d22b9-e86d-420e-a92d-909fb6a12dcf" />
)

**Workflow:**
1. **Data Source** – HTTP API or external dataset
2. **Data Ingestion (Bronze Layer)** – Raw data is ingested into Azure Data Lake Gen2 using **dynamic pipelines** in ADF
3. **Data Transformation (Silver Layer)** – Databricks cleanses and transforms data into analytics-friendly format
4. **Data Serving (Gold Layer)** – Synapse Analytics stores curated data for reporting
5. **Reporting & Visualization** – Power BI consumes data from Synapse for dashboards and insights

---

## 🔄 Project Workflow in Detail

### **1️⃣ Bronze Layer – Data Ingestion**
- Ingestion handled by **Azure Data Factory**
- **Dynamic pipelines** with:
  - Parameters for dataset paths
  - `ForEach` activity for multiple file ingestion
- Raw data stored in **Data Lake Gen2** (Bronze zone)
- Supports API ingestion directly without manual CSV uploads

### **2️⃣ Silver Layer – Data Transformation**
- **Azure Databricks** with **PySpark** for large-scale processing
- Key transformations:
  - Schema enforcement
  - String and date manipulations
  - Aggregations and joins
  - Data quality checks
- Stores cleaned data in **Data Lake Gen2** (Silver zone)

### **3️⃣ Gold Layer – Data Serving**
- Data loaded into **Azure Synapse Analytics**
- **External tables** and **views** created for optimized access
- Uses **CETAS** (`CREATE EXTERNAL TABLE AS SELECT`) for efficiency
- **RBAC** and **Managed Identities** for secure connections

### **4️⃣ Reporting**
- Synapse **serverless SQL endpoints** connected to **Power BI**
- Dashboards show business insights based on curated Gold data

---

## ✨ Key Features
- 🚀 **End-to-End Azure Data Engineering pipeline**
- 🔄 **Dynamic pipelines** in ADF for multi-file ingestion
- 💎 **Medallion Architecture** for data organization
- ⚡ **Scalable Spark transformations** in Databricks
- 🔐 **Secure connections** using Managed Identities & RBAC
- 📊 **Interactive dashboards** in Power BI
- 🧰 **Reusable components** (parameterized datasets, linked services, JSON-driven configs)




