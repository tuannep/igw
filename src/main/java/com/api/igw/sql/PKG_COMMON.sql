CREATE OR REPLACE PACKAGE BODY PKG_COMMON IS FUNCTION FN_GET_ERRDESC(P_CATEGORY IN VARCHAR2, P_ERRCODE IN VARCHAR2, P_LANGUAGE IN VARCHAR2) RETURN VARCHAR2 IS V_RETURN_VAL VARCHAR2(500);

BEGIN
SELECT CASE
           WHEN P_LANGUAGE = 'EN' THEN ERR_DESC_EN
           ELSE ERR_DESC_VN
       END INTO V_RETURN_VAL
FROM ERR_CODE
WHERE CATEGORY = P_CATEGORY
  AND ERR_CODE = P_ERRCODE --AND IS_ACTIVE = 'Y'

  AND ROWNUM = '1';

RETURN V_RETURN_VAL;


EXCEPTION WHEN NO_DATA_FOUND THEN BEGIN
SELECT CASE
           WHEN P_LANGUAGE = 'EN' THEN ERR_DESC_EN
           ELSE ERR_DESC_VN
       END INTO V_RETURN_VAL
FROM ERR_CODE
WHERE CATEGORY = 'COMMON'
  AND ERR_CODE = P_ERRCODE;

--AND IS_ACTIVE = 'Y';
EXCEPTION WHEN OTHERS THEN V_RETURN_VAL := 'Ma loi khong ton tai';

END;

RETURN V_RETURN_VAL;

END FN_GET_ERRDESC;

END PKG_COMMON;