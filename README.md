# Celestial Bodies SQL

Creation of a relational PostgreSQL database of celestial bodies built via command line in a Linux environment to practice schema design and SQL fundamentals.

## Tools & Skills Used

![SQL](https://img.shields.io/badge/SQL-PostgreSQL-%233298DA)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database%20Design-%23336791)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database%20Schema-%23336791)
![Linux](https://img.shields.io/badge/Linux-Command%20Line-%23ffcc33)
![Gitpod](https://img.shields.io/badge/Gitpod-Virtual%20Environment-%23ff8a00)

## Quick Access

- [SQL Dump](/universe.sql)
- [Step-by-Step Guide](/step-by-step.md)

## Project Overview

This project, completed as part of the freeCodeCamp [Relational Database certification](https://www.freecodecamp.org/learn/relational-database/), demonstrates the design and implementation of a relational **PostgreSQL database** of celestial bodies. Built entirely via the **command line** in a **vitual Linux environment**, the database models galaxies, stars, planets, and moons under strict relational principles.

## Objectives

- Design and implement a relational database schema for celestial bodies.  
- Apply primary and foreign key constraints to enforce relationships.  
- Populate tables with realistic sample data.  
- Demonstrate use of multiple data types (`INT`, `NUMERIC`, `TEXT`, `BOOLEAN`).  
- Enforce integrity constraints (`NOT NULL`, `UNIQUE`, `VARCHAR`). 

## Methodology

1. **Schema Design**  

   - Created database `universe` with at least 5 tables (`galaxy`, `star`, `planet`, `moon`, plus supporting tables).  
   - Defined primary keys with auto-increment and consistent naming (`table_name_id`).  
   - Established foreign key relationships.  

2. **Data Types & Constraints**

   - Used a mix of `INT`, `NUMERIC`, `TEXT`, and `BOOLEAN`.  
   - Applied `NOT NULL` and `UNIQUE` constraints.  
   - Standardized `name` columns as `VARCHAR`.  

3. **Population & Validation**

   - Inserted minimum required 3 rows per table, plus table‑specific requirements:
     - `galaxy` table: 6 rows
     - `star` table: 6 rows
     - `planet` table: 12 rows
     - `moon` table: 20 rows  
   - Added a `name` column in each table and ensured minimum required 3 columns per table, plus table‑specific requirements:
     - `galaxy` table: 5 columns
     - `star` table: 5 columns
     - `planet` table: 5 columns
     - `moon` table: 5 columns
   - Verified schema integrity and relational consistency.  

## Reflection

- Practiced schema design and constraint enforcement in PostgreSQL.  
- Strengthened command‑line workflow skills in a Linux environment.  
- Gained experience translating abstract requirements into a working relational model.  
