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