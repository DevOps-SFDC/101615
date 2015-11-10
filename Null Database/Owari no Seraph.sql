use DevOps

TRUNCATE TABLE tbl_login
TRUNCATE TABLE td_logs
TRUNCATE TABLE param
TRUNCATE TABLE UserCredentialInfo

UPDATE session SET sessionstatus = 'Inactive'

UPDATE td_sbquest SET Status = 'Inactive' WHERE Status = 'Active' AND Status = 'Answered' AND Status= 'Not Answered'

UPDATE param SET UserSB = 'Inactive'

INSERT INTO tbl_login VALUES ('devops.gt2.bob', 'Devops', 'Devops', NULL, 'Administrator', NULL)