# 04 - Common Table Expressions (CTEs)

## 🧠 Project Overview
This project demonstrates advanced SQL querying by breaking down complex multi-step aggregations into readable, modular blocks. The objective is to evaluate the overall success of TV series by combining two independent performance metrics: total episode output and average audience ratings.

## 🛠️ Core Concepts Applied
* **Common Table Expressions (`WITH`):** Defining temporary, named result sets (`ShowAverages` and `ShowTotals`) that exist strictly within the execution scope of the primary query.
* **CTE Chaining:** Declaring multiple sequential CTEs separated by commas to avoid deeply nested, hard-to-maintain subqueries.
* **Multi-Table Inner Joins:** Joining the primary dimension table (`Series`) to multiple derived CTE fact tables simultaneously on a shared Primary Key (`serie_id`).
* **Defensive Sorting:** Explicitly referencing column aliases in the `ORDER BY` clause rather than positional integers to guarantee long-term code stability.

## 📂 Repository Files
* **`schema.sql`**: Data Definition Language (DDL) establishing tables and foreign key constraints.
* **`seed.sql`**: Sample mock data insertion.
* **`queries.sql`**: The execution script containing the chained CTE logic.
