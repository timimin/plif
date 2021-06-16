CREATE OR REPLACE PROCEDURE P_ALLOCATE (ID NUMBER, P_ID NUMBER, S_ID NUMBER, ALLOC_DATE DATE)
IS
V_STATUS NUMBER;
PAPER_NOT_ALLOCATED EXCEPTION;
BEGIN
SELECT STATUS INTO V_STATUS
FROM SUBMISSIONS
WHERE PAPER_ID = P_ID;
IF V_STATUS = 1
THEN INSERT INTO ALLOCATIONS (ALLOCATION_ID, PAPER_ID, SESSION_ID, ALLOCATION_DATE)
VALUES (ID, P_ID, S_ID, ALLOC_DATE);
ELSE RAISE PAPER_NOT_SUBMITTED;
END IF;
EXCEPTION
WHEN
PAPER_NOT_ALLOCATED
THEN INSERT INTO LOGS VALUES (.);
WHEN OTHERS THEN NULL;
END P_ALLOCATE;
