# Fundamental Queries & Aggregations 📊

This directory contains foundational SQL scripts designed to retrieve, filter, sort, and aggregate relational data. 

The queries in this module focus on transforming raw operational data into analytical insights without relying on complex table junctions, demonstrating a strong grasp of SQL's order of execution and aggregate functions.

## 🧠 Core SQL Clauses Applied

* **`SELECT` & `FROM`:** The backbone of data retrieval. Utilized to target specific columns and declare the primary data source (tables) from which the information is extracted.
* **`GROUP BY`:** A crucial clause for data analysis. It collapses multiple identical rows into summary rows, enabling the calculation of metrics across specific categories (e.g., grouping all episodes belonging to a single series).
* **Aggregate Functions (`AVG()`, `COUNT()`):**
    * `COUNT()`: Scans the grouped partitions to return the exact number of non-null records, useful for frequency analysis.
    * `AVG()`: Performs mathematical averaging on numeric datasets to evaluate overall performance or quality (e.g., IMDB ratings).
* **`ORDER BY` (with `ASC`/`DESC`):** Sorts the final result set sequentially. `DESC` (Descending) is heavily utilized here to surface the highest values (top ratings, longest durations) to the top of the data output.
* **`LIMIT`:** An optimization and formatting clause used to restrict the number of rows returned by the query, efficiently isolating the absolute maximum or minimum value in a sorted dataset.

## 🚀 Repository Structure

1.  **`schema.sql`**: Contains the Data Definition Language (DDL) to construct the database schema and enforce primary/foreign key constraints.
2.  **`seed.sql`**: Contains the Data Manipulation Language (DML) to populate the tables with testing data.
3.  **`queries.sql`**: Contains the documented analytical queries applying the clauses described above.
