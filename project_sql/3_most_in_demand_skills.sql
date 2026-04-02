SELECT 
    skills.skills AS skill_name,
    COUNT(skills_to_job.job_id) AS demand_count

FROM 
    job_postings_fact

INNER JOIN skills_job_dim AS skills_to_job ON job_postings_fact.job_id = skills_to_job.job_id
INNER JOIN skills_dim AS skills ON skills_to_job.skill_id = skills.skill_id

WHERE
    job_title_short LIKE '%Data%' AND
    job_work_from_home IS TRUE

GROUP BY
    skill_name

ORDER BY
    demand_count DESC
LIMIT 5;