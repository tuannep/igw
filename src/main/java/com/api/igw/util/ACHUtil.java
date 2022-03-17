package com.api.igw.util;

import com.api.igw.constant.AppConstant;
import com.api.igw.model.TransAchDetail;
import com.api.igw.model.Transaction;
import com.fasterxml.jackson.databind.JsonNode;
import lombok.extern.slf4j.Slf4j;

import java.math.BigDecimal;
import java.util.Date;
import java.util.UUID;

@Slf4j
public class ACHUtil {
    public static void parseDasOut2Obj(JsonNode root, Transaction transaction, TransAchDetail transAchDetail) {
        try {
            // Transaction
            String xrefId = JsonUtil.getVal(root, "/body/iso8583/DE037_REL_REF_NO").asText() + UUID.randomUUID().toString().replace("-", "").substring(0,23).toUpperCase();
            String clientId = JsonUtil.getVal(root, "/body/iso8583/DE060_CNL_TP").asText();
            String channelId = JsonUtil.getVal(root, "/body/iso8583/DE060_CNL_TP").asText();
            String serviceGroupId = AppConstant.SrvGroup.ACH_INQ;
            String serviceId = AppConstant.ServiceId.SERVICE_INQ_DAS;
            String transCate = JsonUtil.getVal(root, "/body/iso8583/DE003_PROC_CD").asText();
            String transInOut = AppConstant.TransDirection.TRANS_OUT;
            String transDesc = JsonUtil.getVal(root, "/body/iso8583/DE104_TRN_CONT").asText();
            long amount = 0;
            String ccy = "";
            String transStat = "";
            String transStatDesc = "";
            String transDt = JsonUtil.getVal(root, "/body/iso8583/DE007_TRN_DT").asText();

            // Trans_ach_detail
            Long orgTransId = null;
            String senderRefId = "";
            String orgSenderRefId = "";
            String refSenderRefId = "";
            String msgIdentifier = "";
            long feeAmount = 0;
            long vatAmount = 0;
            Date settleDt = new Date();
            String settleMtd = "";
            String instrId = "";
            String endtoendId = "";
            String txId = "";
            String chargeBr = "";
            String dbtrBrn = "";
            String dbtrName = "";

            String dbtrAddress = "";
            String dbtrAcctType = "";
            String dbtrAcctNo = JsonUtil.getVal(root, "/body/iso8583/DE102_SND_ACC_INF").asText();
            String dbtrMemId = "";
            String dbtrMemCode = "";
            String cdtrBrn = "";
            String cdtrName = "";
            String cdtrAddress = "";
            String cdtrAcctType = "";
            String cdtrAcctNo = JsonUtil.getVal(root, "/body/iso8583/DE103_RCV_ACC_INF").asText();
            String cdtrMemId = "";
            String cdtrMemCode = "";
            String coreRef = JsonUtil.getVal(root, "/body/iso8583/DE037_REL_REF_NO").asText();
            String trnRefNo = "";
            String transDetail = transDesc;
            String transStep = "";
            String transStepStat = "";
            String errCode = "";
            String errDesc = "";
            String sessionNo = "";
            String groupStatus = "";
            String isCopy = "";
            String transType = "";
            int numberOfTxs = 0;
            String maker = "";
            String modifier = "";
            String checker = "";
            String createdBy = "SYSTEM";

            transaction.setXrefId(xrefId);
            transaction.setClientId(clientId);
            transaction.setChannelId(channelId);
            transaction.setServiceGroupId(serviceGroupId);
            transaction.setServiceId(serviceId);
            transaction.setTransCate(transCate);
            transaction.setTransInout(transInOut);
            transaction.setTransDesc(transDesc);
            transaction.setAmount(BigDecimal.valueOf(amount));
            transaction.setCcy(ccy);
            transaction.setTransDt(transDt);
            transaction.setTransStat(transStat);
            transaction.setTransStatDesc(transStatDesc);

            transAchDetail.setOrgTransId(orgTransId);
            transAchDetail.setSenderRefId(senderRefId);
            transAchDetail.setOrgSenderRefId(orgSenderRefId);
            transAchDetail.setRefSenderRefId(refSenderRefId);
            transAchDetail.setMsgIdentifier(msgIdentifier);
            transAchDetail.setAmount(BigDecimal.valueOf(amount));
            transAchDetail.setCcy(ccy);
            transAchDetail.setFeeAmount(BigDecimal.valueOf(feeAmount));
            transAchDetail.setVatAmount(BigDecimal.valueOf(vatAmount));
            transAchDetail.setSettleDt(settleDt);
            transAchDetail.setSettleMtd(settleMtd);
            transAchDetail.setInstrId(instrId);
            transAchDetail.setEndtoendId(endtoendId);
            transAchDetail.setTxId(txId);
            transAchDetail.setChargeBr(chargeBr);
            transAchDetail.setDbtrBrn(dbtrBrn);
            transAchDetail.setDbtrName(dbtrName);
            transAchDetail.setDbtrAddress(dbtrAddress);
            transAchDetail.setDbtrAcctType(dbtrAcctType);
            transAchDetail.setDbtrAcctNo(dbtrAcctNo);
            transAchDetail.setDbtrMemId(dbtrMemId);
            transAchDetail.setDbtrMemCode(dbtrMemCode);
            transAchDetail.setCdtrBrn(cdtrBrn);
            transAchDetail.setCdtrName(cdtrName);
            transAchDetail.setCdtrAddress(cdtrAddress);
            transAchDetail.setCdtrAcctType(cdtrAcctType);
            transAchDetail.setCdtrAcctNo(cdtrAcctNo);
            transAchDetail.setCdtrMemId(cdtrMemId);
            transAchDetail.setCdtrMemCode(cdtrMemCode);
            transAchDetail.setCoreRef(coreRef);
            transAchDetail.setTrnRefNo(trnRefNo);
            transAchDetail.setTransDetail(transDetail);
            transAchDetail.setTransStep(transStep);
            transAchDetail.setTransStepStat(transStepStat);
            transAchDetail.setErrCode(errCode);
            transAchDetail.setErrDesc(errDesc);
            transAchDetail.setSessionNo(sessionNo);
            transAchDetail.setGroupStatus(groupStatus);
            transAchDetail.setIsCopy(isCopy);
            transAchDetail.setTransType(transType);
            transAchDetail.setNumberOfTxs(Integer.valueOf(numberOfTxs));
            transAchDetail.setMaker(maker);
            transAchDetail.setModifier(modifier);
            transAchDetail.setChecker(checker);
            transAchDetail.setCreatedBy(createdBy);
        } catch (Exception e) {
            log.error("Exception when handle parseDasOut2Obj:" + e.getMessage());
        }
    }
}
