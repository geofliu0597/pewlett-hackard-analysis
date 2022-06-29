SELECT e.emp_no,
    e.first_name,
    e.last_name,
    ti.title,
    ti.from_date,
    ti.to_date
INTO retirement_titles
FROM employees AS e
FULL JOIN titles AS ti
ON e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;



-- Use Distinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) rt.emp_no,
    rt.first_name,
    rt.last_name,
    rt.title
INTO unique_title
FROM retirement_titles AS rt
WHERE to_date = '9999-01-01'
ORDER BY rt.emp_no ASC, rt.to_date DESC;


SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_title AS ut
GROUP BY ut.title
ORDER BY count DESC



-- Deliverable #2
SELECT DISTINCT ON (emp_no) e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
    ti.title
INTO mentorship_eligibility
FROM employees AS e
LEFT JOIN dept_emp AS de
    ON e.emp_no = de.emp_no
LEFT JOIN titles AS ti
    ON e.emp_no = ti.emp_no
WHERE (de.to_date = '9999-01-01')
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no ASC;

