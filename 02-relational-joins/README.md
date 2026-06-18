# Relational Joins & Data Intersection 🔗

This module focuses on the relational core of SQL: joining normalized tables to reconstruct comprehensive datasets and resolve relationship architectures (1:N and N:M).

The queries contained herein demonstrate how to extract actionable business intelligence by traversing primary and foreign key constraints across the database schema.

## 🧠 Core SQL Clauses Applied

* **`INNER JOIN`:** The default intersection. Returns only the rows that have matching values in both tables. Utilized here to match series with their respective episodes and aggregate valid runtime metrics.
* **`LEFT JOIN`:** A directional join that returns *all* records from the left table, and the matched records from the right table. Applied in an audit scenario to identify actors who are registered in the system but have no active roles (yielding `NULL` on the right side).
* **`RIGHT JOIN`:** The inverse of the left join. Returns *all* records from the right table, and the matched records from the left. Used to verify the series catalog, surfacing series that have been announced/registered but currently lack episode entries.
* **`SUM()`:** An aggregate mathematical function used alongside joins to calculate the cumulative total of a specific numeric column (e.g., total binge-watching duration of a series).

## 🚀 Repository Structure

1.  **`schema.sql`**: The database schema establishing the Entity-Relationship rules.
2.  **`seed.sql`**: The mock data utilized to populate the tables.
3.  **`queries.sql`**: The documented analytical queries executing the multi-table joins.
