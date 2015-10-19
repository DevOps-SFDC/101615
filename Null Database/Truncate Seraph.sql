use DevOps
TRUNCATE TABLE tbl_login
TRUNCATE TABLE td_logs

INSERT INTO
	tbl_login
VALUES
	(
	'devops.gt2',
	'DevOps',
	'DevOps',
	NULL,
	'Administrator',
	NULL
	)

UPDATE
	td_sbquest
SET
	Status = 'Inactive'
WHERE
	Status = 'Answered' OR Status = 'Not Answered' OR Status = 'Active'