WITH top_paying_jobs AS (

SELECT
    job_id,
    job_title_short,
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
LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills.skills
FROM
    top_paying_jobs

INNER JOIN skills_job_dim AS skills_to_job ON top_paying_jobs.job_id = skills_to_job.job_id
INNER JOIN skills_dim AS skills ON skills_to_job.skill_id = skills.skill_id

ORDER BY
    salary_year_avg DESC;