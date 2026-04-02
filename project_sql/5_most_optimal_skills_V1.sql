SELECT
    skills.skills AS skill_name,
    COUNT(skills_to_job.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 2) AS average_yearly_salary
FROM
    job_postings_fact

INNER JOIN skills_job_dim AS skills_to_job ON job_postings_fact.job_id = skills_to_job.job_id
INNER JOIN skills_dim AS skills ON skills_to_job.skill_id = skills.skill_id

WHERE
    job_title_short LIKE 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home IS TRUE


GROUP BY
    skills.skill_id

HAVING
    COUNT(skills_to_job.job_id) > 10

ORDER BY
    average_yearly_salary DESC,
    demand_count DESC


LIMIT 25;