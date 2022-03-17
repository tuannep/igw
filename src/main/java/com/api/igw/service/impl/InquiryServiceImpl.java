package com.api.igw.service.impl;

import com.api.igw.model.DataObj;
import com.api.igw.model.TransAchDetail;
import com.api.igw.model.Transaction;
import com.api.igw.repository.TransactionRepository;
import com.api.igw.service.InquiryService;
import com.api.igw.util.ACHUtil;
import com.api.igw.util.JsonUtil;
import com.fasterxml.jackson.databind.JsonNode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service("InquiryService")
public class InquiryServiceImpl implements InquiryService {
    @Autowired
    TransactionRepository transactionRepository;
    @Override
    public String inquiryDAS(String iso8583Message) {
        log.info("===== Begin Process InquiryDAS =====");
        String transId = "", eCode = "", eDesc = "";
        Transaction trans = new Transaction();
        TransAchDetail transAchDetail = new TransAchDetail();
        DataObj objRes = new DataObj();
        String iso8583toBank = "";
        String senderRefId = "";
        try{
            JsonNode root = JsonUtil.toJsonNode(iso8583Message);
            ACHUtil.parseDasOut2Obj(root, trans, transAchDetail);
            //// 1.init transaction
            ACHUtil.parseDasOut2Obj(root, trans, transAchDetail);
            DataObj initRes = transactionRepository.initTrans(trans, transAchDetail);
            eCode = initRes.getEcode();
            log.info("===== InitTrans: " + initRes.getEdesc() + " =====");
        }catch (Exception e){

        }finally {

        }
        return eCode;
    }
}
