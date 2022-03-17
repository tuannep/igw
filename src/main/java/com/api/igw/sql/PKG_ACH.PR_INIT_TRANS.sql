CREATE OR REPLACE PACKAGE ACHOWN.pkg_ach IS

  PROCEDURE PR_INSERT_TRANS(P_TRANS_ID         IN OUT NUMBER,
                            P_XREF_ID          IN VARCHAR2,
                            P_CLIENT_ID        IN VARCHAR2,
                            P_CHANNEL_ID       IN VARCHAR2,
                            P_SERVICE_GROUP_ID IN VARCHAR2,
                            P_SERVICE_ID       IN VARCHAR2,
                            P_TRANS_CATE       IN VARCHAR2,
                            P_TRANS_INOUT      IN VARCHAR2,
                            P_TRANS_DESC       IN VARCHAR2,
                            P_AMOUNT           IN NUMBER,
                            P_CCY              IN VARCHAR2,
                            P_TRANS_DT         IN VARCHAR2,
                            P_TRANS_STAT       IN VARCHAR2,
                            P_TRANS_STAT_DESC  IN VARCHAR2,
                            P_CREATED_BY       IN VARCHAR2,
                            P_COMMIT           IN VARCHAR2,
                            P_OUT_ECODE        OUT VARCHAR2,
                            P_OUT_EDESC        OUT VARCHAR2);

  PROCEDURE PR_INSERT_TRANS_ACH_DTL(P_TRANS_ID          IN NUMBER,
                                    P_ORG_TRANS_ID      IN NUMBER,
                                    P_SENDER_REF_ID     IN VARCHAR2,
                                    P_ORG_SENDER_REF_ID IN VARCHAR2,
                                    P_REF_SENDER_REF_ID IN VARCHAR2,
                                    P_MSG_IDENTIFIER    IN VARCHAR2,
                                    P_CCY               IN VARCHAR2,
                                    P_AMOUNT            IN NUMBER,
                                    P_FEE_AMOUNT        IN NUMBER,
                                    P_VAT_AMOUNT        IN NUMBER,
                                    P_SETTLE_DT         IN DATE,
                                    P_SETTLE_MTD        IN VARCHAR2,
                                    P_INSTR_ID          IN VARCHAR2,
                                    P_ENDTOEND_ID       IN VARCHAR2,
                                    P_TX_ID             IN VARCHAR2,
                                    P_CHARGE_BR         IN VARCHAR2,
                                    P_DBTR_BRN          IN VARCHAR2,
                                    P_DBTR_NAME         IN VARCHAR2,
                                    P_DBTR_ADDRESS      IN VARCHAR2,
                                    P_DBTR_ACCT_TYPE    IN VARCHAR2,
                                    P_DBTR_ACCT_NO      IN VARCHAR2,
                                    P_DBTR_MEM_ID       IN VARCHAR2,
                                    P_DBTR_MEM_CODE     IN VARCHAR2,
                                    P_CDTR_BRN          IN VARCHAR2,
                                    P_CDTR_NAME         IN VARCHAR2,
                                    P_CDTR_ADDRESS      IN VARCHAR2,
                                    P_CDTR_ACCT_TYPE    IN VARCHAR2,
                                    P_CDTR_ACCT_NO      IN VARCHAR2,
                                    P_CDTR_MEM_ID       IN VARCHAR2,
                                    P_CDTR_MEM_CODE     IN VARCHAR2,
                                    P_CORE_REF          IN VARCHAR2,
                                    P_TRN_REF_NO        IN VARCHAR2,
                                    P_TRANS_DETAIL      IN VARCHAR2,
                                    P_TRANS_STEP        IN VARCHAR2,
                                    P_TRANS_STEP_STAT   IN VARCHAR2,
                                    P_ERR_CODE          IN VARCHAR2,
                                    P_ERR_DESC          IN VARCHAR2,
                                    P_SESSION_NO        IN VARCHAR2,
                                    P_GROUP_STATUS      IN VARCHAR2,
                                    P_IS_COPY           IN VARCHAR2,
                                    P_TRANS_TYPE        IN VARCHAR2,
                                    P_NUMBER_OF_TXS     IN NUMBER,
                                    P_MAKER             IN VARCHAR2,
                                    P_MODIFIER          IN VARCHAR2,
                                    P_CHECKER           IN VARCHAR2,
                                    P_CREATED_BY        IN VARCHAR2,
                                    P_COMMIT            IN VARCHAR2,
                                    P_OUT_ECODE         OUT VARCHAR2,
                                    P_OUT_EDESC         OUT VARCHAR2);

  PROCEDURE PR_INSERT_TRANS_ACH_ACTIVITY(P_ACTIVITY_ID    IN OUT NUMBER,
                                         P_TRANS_ID       IN NUMBER,
                                         P_SENDER_REF_ID  IN VARCHAR2,
                                         P_MSG_IDENTIFIER IN VARCHAR2,
                                         P_ACTIVITY_DESC  IN VARCHAR2,
                                         P_MSG_TYPE       IN VARCHAR2,
                                         P_MSG_CONTENT    IN CLOB,
                                         P_MSG_DT         IN DATE,
                                         P_ACTIVITY_STEP  IN VARCHAR2,
                                         P_ERR_CODE       IN VARCHAR2,
                                         P_ERR_DESC       IN VARCHAR2,
                                         P_COMMIT         IN VARCHAR2,
                                         P_OUT_ECODE      OUT VARCHAR2,
                                         P_OUT_EDESC      OUT VARCHAR2);

  PROCEDURE PR_INIT_TRANS( --Transaction
                          P_TRANS_ID         IN OUT NUMBER,
                          P_XREF_ID          IN VARCHAR2,
                          P_CLIENT_ID        IN VARCHAR2,
                          P_CHANNEL_ID       IN VARCHAR2,
                          P_SERVICE_GROUP_ID IN VARCHAR2,
                          P_SERVICE_ID       IN VARCHAR2,
                          P_TRANS_CATE       IN VARCHAR2,
                          P_TRANS_INOUT      IN VARCHAR2,
                          P_TRANS_DESC       IN VARCHAR2,
                          P_AMOUNT           IN NUMBER,
                          P_CCY              IN VARCHAR2,
                          P_TRANS_DT         IN VARCHAR2,
                          P_TRANS_STAT       IN VARCHAR2,
                          P_TRANS_STAT_DESC  IN VARCHAR2,
                          --Trans_ach_detail
                          P_ORG_TRANS_ID      IN NUMBER,
                          P_SENDER_REF_ID     IN VARCHAR2,
                          P_ORG_SENDER_REF_ID IN VARCHAR2,
                          P_REF_SENDER_REF_ID IN VARCHAR2,
                          P_MSG_IDENTIFIER    IN VARCHAR2,
                          P_FEE_AMOUNT        IN NUMBER,
                          P_VAT_AMOUNT        IN NUMBER,
                          P_SETTLE_DT         IN DATE,
                          P_SETTLE_MTD        IN VARCHAR2,
                          P_INSTR_ID          IN VARCHAR2,
                          P_ENDTOEND_ID       IN VARCHAR2,
                          P_TX_ID             IN VARCHAR2,
                          P_CHARGE_BR         IN VARCHAR2,
                          P_DBTR_BRN          IN VARCHAR2,
                          P_DBTR_NAME         IN VARCHAR2,
                          P_DBTR_ADDRESS      IN VARCHAR2,
                          P_DBTR_ACCT_TYPE    IN VARCHAR2,
                          P_DBTR_ACCT_NO      IN VARCHAR2,
                          P_DBTR_MEM_ID       IN VARCHAR2,
                          P_DBTR_MEM_CODE     IN VARCHAR2,
                          P_CDTR_BRN          IN VARCHAR2,
                          P_CDTR_NAME         IN VARCHAR2,
                          P_CDTR_ADDRESS      IN VARCHAR2,
                          P_CDTR_ACCT_TYPE    IN VARCHAR2,
                          P_CDTR_ACCT_NO      IN VARCHAR2,
                          P_CDTR_MEM_ID       IN VARCHAR2,
                          P_CDTR_MEM_CODE     IN VARCHAR2,
                          P_CORE_REF          IN VARCHAR2,
                          P_TRN_REF_NO        IN VARCHAR2,
                          P_TRANS_DETAIL      IN VARCHAR2,
                          P_TRANS_STEP        IN VARCHAR2,
                          P_TRANS_STEP_STAT   IN VARCHAR2,
                          P_ERR_CODE          IN VARCHAR2,
                          P_ERR_DESC          IN VARCHAR2,
                          P_SESSION_NO        IN VARCHAR2,
                          P_GROUP_STATUS      IN VARCHAR2,
                          P_IS_COPY           IN VARCHAR2,
                          P_TRANS_TYPE        IN VARCHAR2,
                          P_NUMBER_OF_TXS     IN NUMBER,
                          P_MAKER             IN VARCHAR2,
                          P_MODIFIER          IN VARCHAR2,
                          P_CHECKER           IN VARCHAR2,
                          --Trans_ach_activity
                          P_ACTIVITY_ID   IN OUT NUMBER,
                          P_ACTIVITY_DESC IN VARCHAR2,
                          P_MSG_TYPE      IN VARCHAR2,
                          P_MSG_CONTENT   IN CLOB,
                          P_MSG_DT        IN DATE,
                          P_ACTIVITY_STEP IN VARCHAR2,
                          P_CREATED_BY    IN VARCHAR2,
                          P_INIT_TYPE     IN VARCHAR2, --1,2,3
                          P_RESULT_CODE   OUT VARCHAR2,
                          P_RESULT_DESC   OUT VARCHAR2);

  FUNCTION PR_CHECK_UNIQUE_XREF(P_XREF IN VARCHAR2) RETURN VARCHAR2;
END pkg_ach;
/
CREATE OR REPLACE PACKAGE BODY ACHOWN.pkg_ach IS

  PROCEDURE PR_INSERT_TRANS(P_TRANS_ID         IN OUT NUMBER,
                            P_XREF_ID          IN VARCHAR2,
                            P_CLIENT_ID        IN VARCHAR2,
                            P_CHANNEL_ID       IN VARCHAR2,
                            P_SERVICE_GROUP_ID IN VARCHAR2,
                            P_SERVICE_ID       IN VARCHAR2,
                            P_TRANS_CATE       IN VARCHAR2,
                            P_TRANS_INOUT      IN VARCHAR2,
                            P_TRANS_DESC       IN VARCHAR2,
                            P_AMOUNT           IN NUMBER,
                            P_CCY              IN VARCHAR2,
                            P_TRANS_DT         IN VARCHAR2,
                            P_TRANS_STAT       IN VARCHAR2,
                            P_TRANS_STAT_DESC  IN VARCHAR2,
                            P_CREATED_BY       IN VARCHAR2,
                            P_COMMIT           IN VARCHAR2,
                            P_OUT_ECODE        OUT VARCHAR2,
                            P_OUT_EDESC        OUT VARCHAR2) IS
  BEGIN
    P_TRANS_ID := SEQ_TRANSACTION.nextval;
    INSERT INTO TRANSACTION
      (TRANS_ID,
       XREF_ID,
       CLIENT_ID,
       CHANNEL_ID,
       SERVICE_GROUP_ID,
       SERVICE_ID,
       TRANS_CATE,
       TRANS_INOUT,
       TRANS_DESC,
       AMOUNT,
       CCY,
       TRANS_DT,
       TRANS_STAT,
       TRANS_STAT_DESC,
       CREATED_BY,
       CREATED_ON)
    VALUES
      (P_TRANS_ID,
       P_XREF_ID,
       P_CLIENT_ID,
       P_CHANNEL_ID,
       P_SERVICE_GROUP_ID,
       P_SERVICE_ID,
       P_TRANS_CATE,
       P_TRANS_INOUT,
       P_TRANS_DESC,
       P_AMOUNT,
       P_CCY,
       P_TRANS_DT,
       P_TRANS_STAT,
       P_TRANS_STAT_DESC,
       P_CREATED_BY,
       SYSDATE);

    IF P_COMMIT = 'Y' THEN
      COMMIT;
    END IF;
    P_OUT_ECODE := PKG_ACH_CONST.COMMON_TRANS_SUCCESS;
    P_OUT_EDESC := 'Success';
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      P_TRANS_ID  := 0;
      P_OUT_ECODE := PKG_ACH_CONST.COMMON_TRANS_FAILED;
      P_OUT_EDESC := 'PR_INSERT_TRANS error: ' || SQLERRM;
  END PR_INSERT_TRANS;

  PROCEDURE PR_INSERT_TRANS_ACH_DTL(P_TRANS_ID          IN NUMBER,
                                    P_ORG_TRANS_ID      IN NUMBER,
                                    P_SENDER_REF_ID     IN VARCHAR2,
                                    P_ORG_SENDER_REF_ID IN VARCHAR2,
                                    P_REF_SENDER_REF_ID IN VARCHAR2,
                                    P_MSG_IDENTIFIER    IN VARCHAR2,
                                    P_CCY               IN VARCHAR2,
                                    P_AMOUNT            IN NUMBER,
                                    P_FEE_AMOUNT        IN NUMBER,
                                    P_VAT_AMOUNT        IN NUMBER,
                                    P_SETTLE_DT         IN DATE,
                                    P_SETTLE_MTD        IN VARCHAR2,
                                    P_INSTR_ID          IN VARCHAR2,
                                    P_ENDTOEND_ID       IN VARCHAR2,
                                    P_TX_ID             IN VARCHAR2,
                                    P_CHARGE_BR         IN VARCHAR2,
                                    P_DBTR_BRN          IN VARCHAR2,
                                    P_DBTR_NAME         IN VARCHAR2,
                                    P_DBTR_ADDRESS      IN VARCHAR2,
                                    P_DBTR_ACCT_TYPE    IN VARCHAR2,
                                    P_DBTR_ACCT_NO      IN VARCHAR2,
                                    P_DBTR_MEM_ID       IN VARCHAR2,
                                    P_DBTR_MEM_CODE     IN VARCHAR2,
                                    P_CDTR_BRN          IN VARCHAR2,
                                    P_CDTR_NAME         IN VARCHAR2,
                                    P_CDTR_ADDRESS      IN VARCHAR2,
                                    P_CDTR_ACCT_TYPE    IN VARCHAR2,
                                    P_CDTR_ACCT_NO      IN VARCHAR2,
                                    P_CDTR_MEM_ID       IN VARCHAR2,
                                    P_CDTR_MEM_CODE     IN VARCHAR2,
                                    P_CORE_REF          IN VARCHAR2,
                                    P_TRN_REF_NO        IN VARCHAR2,
                                    P_TRANS_DETAIL      IN VARCHAR2,
                                    P_TRANS_STEP        IN VARCHAR2,
                                    P_TRANS_STEP_STAT   IN VARCHAR2,
                                    P_ERR_CODE          IN VARCHAR2,
                                    P_ERR_DESC          IN VARCHAR2,
                                    P_SESSION_NO        IN VARCHAR2,
                                    P_GROUP_STATUS      IN VARCHAR2,
                                    P_IS_COPY           IN VARCHAR2,
                                    P_TRANS_TYPE        IN VARCHAR2,
                                    P_NUMBER_OF_TXS     IN NUMBER,
                                    P_MAKER             IN VARCHAR2,
                                    P_MODIFIER          IN VARCHAR2,
                                    P_CHECKER           IN VARCHAR2,
                                    P_CREATED_BY        IN VARCHAR2,
                                    P_COMMIT            IN VARCHAR2,
                                    P_OUT_ECODE         OUT VARCHAR2,
                                    P_OUT_EDESC         OUT VARCHAR2) IS
  BEGIN
    INSERT INTO TRANS_ACH_DETAIL
      (TRANS_ID,
       ORG_TRANS_ID,
       SENDER_REF_ID,
       ORG_SENDER_REF_ID,
       REF_SENDER_REF_ID,
       MSG_IDENTIFIER,
       CCY,
       AMOUNT,
       FEE_AMOUNT,
       VAT_AMOUNT,
       SETTLE_DT,
       SETTLE_MTD,
       INSTR_ID,
       ENDTOEND_ID,
       TX_ID,
       CHARGE_BR,
       DBTR_BRN,
       DBTR_NAME,
       DBTR_ADDRESS,
       DBTR_ACCT_TYPE,
       DBTR_ACCT_NO,
       DBTR_MEM_ID,
       DBTR_MEM_CODE,
       CDTR_BRN,
       CDTR_NAME,
       CDTR_ADDRESS,
       CDTR_ACCT_TYPE,
       CDTR_ACCT_NO,
       CDTR_MEM_ID,
       CDTR_MEM_CODE,
       CORE_REF,
       TRN_REF_NO,
       TRANS_DETAIL,
       TRANS_STEP,
       TRANS_STEP_STAT,
       ERR_CODE,
       ERR_DESC,
       SESSION_NO,
       GROUP_STATUS,
       IS_COPY,
       TRANS_TYPE,
       NUMBER_OF_TXS,
       MAKER,
       MODIFIER,
       CHECKER,
       CREATED_BY,
       CREATED_ON)
    VALUES
      (P_TRANS_ID,
       P_ORG_TRANS_ID,
       P_SENDER_REF_ID,
       P_ORG_SENDER_REF_ID,
       P_REF_SENDER_REF_ID,
       P_MSG_IDENTIFIER,
       P_CCY,
       P_AMOUNT,
       P_FEE_AMOUNT,
       P_VAT_AMOUNT,
       P_SETTLE_DT,
       P_SETTLE_MTD,
       P_INSTR_ID,
       P_ENDTOEND_ID,
       P_TX_ID,
       P_CHARGE_BR,
       P_DBTR_BRN,
       P_DBTR_NAME,
       P_DBTR_ADDRESS,
       P_DBTR_ACCT_TYPE,
       P_DBTR_ACCT_NO,
       P_DBTR_MEM_ID,
       P_DBTR_MEM_CODE,
       P_CDTR_BRN,
       P_CDTR_NAME,
       P_CDTR_ADDRESS,
       P_CDTR_ACCT_TYPE,
       P_CDTR_ACCT_NO,
       P_CDTR_MEM_ID,
       P_CDTR_MEM_CODE,
       P_CORE_REF,
       P_TRN_REF_NO,
       P_TRANS_DETAIL,
       P_TRANS_STEP,
       P_TRANS_STEP_STAT,
       P_ERR_CODE,
       P_ERR_DESC,
       P_SESSION_NO,
       P_GROUP_STATUS,
       P_IS_COPY,
       P_TRANS_TYPE,
       P_NUMBER_OF_TXS,
       P_MAKER,
       P_MODIFIER,
       P_CHECKER,
       P_CREATED_BY,
       SYSDATE);

    IF P_COMMIT = 'Y' THEN
      COMMIT;
    END IF;

    P_OUT_ECODE := PKG_ACH_CONST.COMMON_TRANS_SUCCESS;
    P_OUT_EDESC := 'Success';
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      P_OUT_ECODE := PKG_ACH_CONST.COMMON_TRANS_FAILED;
      P_OUT_EDESC := 'PR_INSERT_TRANS_ACH_DTL error: ' || SQLERRM;
  END PR_INSERT_TRANS_ACH_DTL;

  PROCEDURE PR_INSERT_TRANS_ACH_ACTIVITY(P_ACTIVITY_ID    IN OUT NUMBER,
                                         P_TRANS_ID       IN NUMBER,
                                         P_SENDER_REF_ID  IN VARCHAR2,
                                         P_MSG_IDENTIFIER IN VARCHAR2,
                                         P_ACTIVITY_DESC  IN VARCHAR2,
                                         P_MSG_TYPE       IN VARCHAR2,
                                         P_MSG_CONTENT    IN CLOB,
                                         P_MSG_DT         IN DATE,
                                         P_ACTIVITY_STEP  IN VARCHAR2,
                                         P_ERR_CODE       IN VARCHAR2,
                                         P_ERR_DESC       IN VARCHAR2,
                                         P_COMMIT         IN VARCHAR2,
                                         P_OUT_ECODE      OUT VARCHAR2,
                                         P_OUT_EDESC      OUT VARCHAR2) IS
  BEGIN
    P_ACTIVITY_ID := SEQ_TRANS_ACH_ACTIVITY.NEXTVAL;
    INSERT INTO TRANS_ACH_ACTIVITY
      (ACTIVITY_ID,
       TRANS_ID,
       SENDER_REF_ID,
       MSG_IDENTIFIER,
       ACTIVITY_DESC,
       MSG_TYPE,
       MSG_CONTENT,
       MSG_DT,
       ACTIVITY_STEP,
       ERR_CODE,
       ERR_DESC,
       CREATED_ON)
    VALUES
      (P_ACTIVITY_ID,
       P_TRANS_ID,
       P_SENDER_REF_ID,
       P_MSG_IDENTIFIER,
       P_ACTIVITY_DESC,
       P_MSG_TYPE,
       P_MSG_CONTENT,
       P_MSG_DT,
       P_ACTIVITY_STEP,
       P_ERR_CODE,
       P_ERR_DESC,
       SYSDATE);
    IF P_COMMIT = 'Y' THEN
      COMMIT;
    END IF;

    P_OUT_ECODE := PKG_ACH_CONST.COMMON_TRANS_SUCCESS;
    P_OUT_EDESC := 'Success';
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      P_ACTIVITY_ID := 0;
      P_OUT_ECODE   := PKG_ACH_CONST.COMMON_TRANS_FAILED;
      P_OUT_EDESC   := 'PR_INSERT_TRANS_ACH_ACTIVITY error: ' || SQLERRM;
  END PR_INSERT_TRANS_ACH_ACTIVITY;


  PROCEDURE PR_INIT_TRANS( --Transaction
                          P_TRANS_ID         IN OUT NUMBER,
                          P_XREF_ID          IN VARCHAR2,
                          P_CLIENT_ID        IN VARCHAR2,
                          P_CHANNEL_ID       IN VARCHAR2,
                          P_SERVICE_GROUP_ID IN VARCHAR2,
                          P_SERVICE_ID       IN VARCHAR2,
                          P_TRANS_CATE       IN VARCHAR2,
                          P_TRANS_INOUT      IN VARCHAR2,
                          P_TRANS_DESC       IN VARCHAR2,
                          P_AMOUNT           IN NUMBER,
                          P_CCY              IN VARCHAR2,
                          P_TRANS_DT         IN VARCHAR2,
                          P_TRANS_STAT       IN VARCHAR2,
                          P_TRANS_STAT_DESC  IN VARCHAR2,
                          --Trans_ach_detail
                          P_ORG_TRANS_ID      IN NUMBER,
                          P_SENDER_REF_ID     IN VARCHAR2,
                          P_ORG_SENDER_REF_ID IN VARCHAR2,
                          P_REF_SENDER_REF_ID IN VARCHAR2,
                          P_MSG_IDENTIFIER    IN VARCHAR2,
                          P_FEE_AMOUNT        IN NUMBER,
                          P_VAT_AMOUNT        IN NUMBER,
                          P_SETTLE_DT         IN DATE,
                          P_SETTLE_MTD        IN VARCHAR2,
                          P_INSTR_ID          IN VARCHAR2,
                          P_ENDTOEND_ID       IN VARCHAR2,
                          P_TX_ID             IN VARCHAR2,
                          P_CHARGE_BR         IN VARCHAR2,
                          P_DBTR_BRN          IN VARCHAR2,
                          P_DBTR_NAME         IN VARCHAR2,
                          P_DBTR_ADDRESS      IN VARCHAR2,
                          P_DBTR_ACCT_TYPE    IN VARCHAR2,
                          P_DBTR_ACCT_NO      IN VARCHAR2,
                          P_DBTR_MEM_ID       IN VARCHAR2,
                          P_DBTR_MEM_CODE     IN VARCHAR2,
                          P_CDTR_BRN          IN VARCHAR2,
                          P_CDTR_NAME         IN VARCHAR2,
                          P_CDTR_ADDRESS      IN VARCHAR2,
                          P_CDTR_ACCT_TYPE    IN VARCHAR2,
                          P_CDTR_ACCT_NO      IN VARCHAR2,
                          P_CDTR_MEM_ID       IN VARCHAR2,
                          P_CDTR_MEM_CODE     IN VARCHAR2,
                          P_CORE_REF          IN VARCHAR2,
                          P_TRN_REF_NO        IN VARCHAR2,
                          P_TRANS_DETAIL      IN VARCHAR2,
                          P_TRANS_STEP        IN VARCHAR2,
                          P_TRANS_STEP_STAT   IN VARCHAR2,
                          P_ERR_CODE          IN VARCHAR2,
                          P_ERR_DESC          IN VARCHAR2,
                          P_SESSION_NO        IN VARCHAR2,
                          P_GROUP_STATUS      IN VARCHAR2,
                          P_IS_COPY           IN VARCHAR2,
                          P_TRANS_TYPE        IN VARCHAR2,
                          P_NUMBER_OF_TXS     IN NUMBER,
                          P_MAKER             IN VARCHAR2,
                          P_MODIFIER          IN VARCHAR2,
                          P_CHECKER           IN VARCHAR2,
                          --Trans_ach_activity
                          P_ACTIVITY_ID   IN OUT NUMBER,
                          P_ACTIVITY_DESC IN VARCHAR2,
                          P_MSG_TYPE      IN VARCHAR2,
                          P_MSG_CONTENT   IN CLOB,
                          P_MSG_DT        IN DATE,
                          P_ACTIVITY_STEP IN VARCHAR2,
                          P_CREATED_BY    IN VARCHAR2,
                          P_INIT_TYPE     IN VARCHAR2, --1,2,3
                          P_RESULT_CODE   OUT VARCHAR2,
                          P_RESULT_DESC   OUT VARCHAR2) IS
    V_TRANS_STAT      VARCHAR2(5) := NULL;
    V_TRANS_STAT_DESC VARCHAR2(500) := NULL;
  BEGIN

    --Check xref duplicated
    IF PR_CHECK_UNIQUE_XREF(P_XREF_ID) = 'Y' THEN
      V_TRANS_STAT      := PKG_ACH_CONST.COMMON_TRANS_COINCIDES_XREF;
      V_TRANS_STAT_DESC := 'Loi trung so XREF: ' || P_XREF_ID;
    END IF;

    --Insert transaction
    PKG_ACH.PR_INSERT_TRANS(P_TRANS_ID,
                            P_XREF_ID,
                            P_CLIENT_ID,
                            P_CHANNEL_ID,
                            P_SERVICE_GROUP_ID,
                            P_SERVICE_ID,
                            P_TRANS_CATE,
                            P_TRANS_INOUT,
                            P_TRANS_DESC,
                            P_AMOUNT,
                            P_CCY,
                            P_TRANS_DT,
                            V_TRANS_STAT,
                            V_TRANS_STAT_DESC,
                            P_CREATED_BY,
                            'N',
                            P_RESULT_CODE,
                            P_RESULT_DESC);

    IF P_RESULT_CODE <> '00' THEN
      RETURN;
    END IF;

    IF P_INIT_TYPE = '2' OR P_INIT_TYPE = '3' THEN
      --Insert trans_ach_detail
      PKG_ACH.PR_INSERT_TRANS_ACH_DTL(P_TRANS_ID,
                                      P_ORG_TRANS_ID,
                                      P_SENDER_REF_ID,
                                      P_ORG_SENDER_REF_ID,
                                      P_REF_SENDER_REF_ID,
                                      P_MSG_IDENTIFIER,
                                      P_CCY,
                                      P_AMOUNT,
                                      P_FEE_AMOUNT,
                                      P_VAT_AMOUNT,
                                      P_SETTLE_DT,
                                      P_SETTLE_MTD,
                                      P_INSTR_ID,
                                      P_ENDTOEND_ID,
                                      P_TX_ID,
                                      P_CHARGE_BR,
                                      P_DBTR_BRN,
                                      P_DBTR_NAME,
                                      P_DBTR_ADDRESS,
                                      P_DBTR_ACCT_TYPE,
                                      P_DBTR_ACCT_NO,
                                      P_DBTR_MEM_ID,
                                      P_DBTR_MEM_CODE,
                                      P_CDTR_BRN,
                                      P_CDTR_NAME,
                                      P_CDTR_ADDRESS,
                                      P_CDTR_ACCT_TYPE,
                                      P_CDTR_ACCT_NO,
                                      P_CDTR_MEM_ID,
                                      P_CDTR_MEM_CODE,
                                      P_CORE_REF,
                                      P_TRN_REF_NO,
                                      P_TRANS_DETAIL,
                                      P_TRANS_STEP,
                                      P_TRANS_STEP_STAT,
                                      P_ERR_CODE,
                                      P_ERR_DESC,
                                      P_SESSION_NO,
                                      P_GROUP_STATUS,
                                      P_IS_COPY,
                                      P_TRANS_TYPE,
                                      P_NUMBER_OF_TXS,
                                      P_MAKER,
                                      P_MODIFIER,
                                      P_CHECKER,
                                      P_CREATED_BY,
                                      'N',
                                      P_RESULT_CODE,
                                      P_RESULT_DESC);

      IF P_RESULT_CODE <> '00' THEN
        RETURN;
      END IF;
    END IF;

    IF P_INIT_TYPE = '3' THEN
      PKG_ACH.PR_INSERT_TRANS_ACH_ACTIVITY(P_ACTIVITY_ID,
                                           P_TRANS_ID,
                                           CASE WHEN P_MSG_IDENTIFIER =
                                           'pacs.008.001.07' THEN
                                           P_ORG_SENDER_REF_ID ELSE
                                           P_SENDER_REF_ID END,
                                           P_MSG_IDENTIFIER,
                                           P_ACTIVITY_DESC,
                                           P_MSG_TYPE,
                                           P_MSG_CONTENT,
                                           P_MSG_DT,
                                           P_ACTIVITY_STEP,
                                           P_ERR_CODE,
                                           P_ERR_DESC,
                                           'N',
                                           P_RESULT_CODE,
                                           P_RESULT_DESC);

      IF P_RESULT_CODE <> '00' THEN
        RETURN;
      END IF;
    END IF;

    COMMIT;

    IF P_RESULT_CODE IS NOT NULL AND P_RESULT_CODE = '00' THEN
      IF V_TRANS_STAT IS NULL THEN
        P_RESULT_CODE := PKG_ACH_CONST.COMMON_TRANS_SUCCESS;
        P_RESULT_DESC := 'Khoi tao thanh cong';
      ELSE
        P_RESULT_CODE := V_TRANS_STAT;
        P_RESULT_DESC := V_TRANS_STAT_DESC;
      END IF;
    END IF;

  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      P_RESULT_CODE := PKG_ACH_CONST.COMMON_TRANS_FAILED;
      P_RESULT_DESC := 'PR_INIT_TRANS error: ' || SQLERRM;
  END PR_INIT_TRANS;

  FUNCTION PR_CHECK_UNIQUE_XREF(P_XREF IN VARCHAR2) RETURN VARCHAR2 IS
    V_COUNT NUMBER := 0;
  BEGIN
    SELECT COUNT(1)
      INTO V_COUNT
      FROM TRANSACTION T
     WHERE T.XREF_ID = P_XREF;

    IF V_COUNT > 0 THEN
      RETURN 'Y';
    ELSE
      RETURN 'N';
    END IF;
  END PR_CHECK_UNIQUE_XREF;
    
END pkg_ach;