# 03 - Subqueries & Advanced Aggregations

## 🧠 Project Overview
This project demonstrates intermediate SQL querying techniques, moving beyond simple data extraction to solve complex filtering requirements. The objective is to identify the top three most popular TV show genres and then calculate the overall average IMDb rating for the series within those specific genres.

## 🛠️ Core Concepts Applied
* **Subqueries (Nested Queries):** Using a query within a `WHERE ... IN` clause to dynamically filter datasets.
* **Derived Tables:** Implementing an inner subquery `(SELECT ... FROM ...) AS top3` to successfully bypass MySQL's restriction on using `LIMIT` directly inside an `IN` operator.
* **Aggregations & Grouping:** Using `COUNT()` to determine popularity and `AVG()` combined with `ROUND()` to calculate precise analytical metrics.
* **Table Aliasing:** Maintaining clean, readable syntax (`s` for Series, `e` for Episodios) across multiple relational joins.
