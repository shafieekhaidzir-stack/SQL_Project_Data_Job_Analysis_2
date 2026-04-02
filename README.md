# Introduction
Wanna find a job but can't decide which job to choose? Already know what job to go for but can't decide what skill to learn for it? Look no further! This project dives into top paying jobs, most in demand skills, top paying skills, and what are the overall most skills to learn!

Here are the SQL queries! [project_sql](/project_sql/)

# Background
This project aims to answer 5 main questions

1. What are the top-paying data-related jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in-demand for these jobs?
4. What skills are associated with the highest salaries?
5. What are the most optimal skills to learn?

# Tools I Used
For this project, the tools used were
- **SQL**: For querying the database to reveal critical insights.
- **PostgreSQL**: The database management system.
- **Visual Studio Code**: The text editor to write the queries.
- **Git & GitHub**: Crucial for version control and sharing the scripts.

# The Analysis
Lets cover the analysis by per-question basis.

## 1. What are the top-paying jobs?
This query is for finding what are the jobs with the highest average annual salary for data-related jobs. The query script is as follows:

```sql
SELECT
    job_id,
    job_location,
    job_title_short,
    job_posted_date,
    salary_year_avg,
    company.name as company_name

FROM 
    job_postings_fact

LEFT JOIN company_dim company ON job_postings_fact.company_id = company.company_id

WHERE
    job_title_short LIKE '%Data%' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home IS TRUE

ORDER BY
    salary_year_avg DESC
LIMIT 10;
```
I'll write down the other questions later! Stay tuned!
# What I Learned
This is actually my first experience in SQL, so I learned ALOT of SQL here. Hoping to apply this to my job!

# Conclusions
