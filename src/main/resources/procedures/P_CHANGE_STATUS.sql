CREATE OR REPLACE PROCEDURE P_CHANGE_STATUS (S_ID NUMBER, STAT NUMBER)
IS
BEGIN
UPDATE SUBMISSIONS
SET STATUS = STAT
WHERE SUBMISSION_ID = S_ID;
END P_CHANGE_STATUS;
