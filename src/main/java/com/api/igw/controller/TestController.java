package com.api.igw.controller;

import com.api.igw.kafka.CustomKafkaMessage;
import com.api.igw.model.Transaction;
import com.api.igw.repository.TransactionRepository;
import com.api.igw.service.KafkaProducerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.Date;

@RestController
@RequestMapping("/api/igw")
public class TestController {

    public static Logger logger = LoggerFactory.getLogger(TestController.class);

    @Autowired
    TransactionRepository transactionRepository;

    @Autowired
    KafkaProducerService producer;

    @PutMapping(value ="test", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> inquiry(@RequestBody String iMessage) {
        logger.debug("Received inquiry msg from bank client");
        System.out.println(iMessage);
        return new ResponseEntity<>(iMessage, HttpStatus.OK);
    }

    @GetMapping(value = "/kafka")
    public ResponseEntity<Object> pushKafka() {
        String json = "{\n" +
                "\"msgType\":\"0200\",\n" +
                "\"PAN\":\"4005242303504066\",\n" +
                "\"processingCode\":\"430000\",\n" +
                "\"transAmount\":\"000000000000\",\n" +
                "\"transmissionDateTime\":\"0225150251\",\n" +
                "\"systemTraceAuditNum\":\"025130\",\n" +
                "\"localTime\":\"150251\",\n" +
                "\"localDate\":\"0225\",\n" +
                "\"settlementDate\":\"0225\",\n" +
                "\"merchantType\":\"6011\",\n" +
                "\"pointOfServiceEntryCode \":\"021\",\n" +
                "\"pointOfServiceConditionCode \":\"00\",\n" +
                "\"sendingMember \":\"970406\",\n" +
                "\"retRefNumber \":\"905600025130\",\n" +
                "\"cardAcceptorTerminalId\":\"00001111\",\n" +
                "\"cardAcceptorId\":\"BINH DUONG MINH\",\n" +
                "\"cardAcceptorNameLocation \":\"BINH DUONG MINH SANG PLAZBINHDUONG VNM\",\n" +
                "\"additionalDataPrivate \":\"OANG MAI CHI A08.03 CC CITIHOME KP3 P CAT LAI\",\n" +
                "\"transCurrencyCode \":\"704\",\n" +
                "\"usrDefinedField \":\"01\",\n" +
                "\"serviceCode\":\"IF_INQ\",\n" +
                "\"transRefNumber\":\"6Z60Z8ECl6MuBJQM\",\n" +
                "\"senderAcc\":\"4005242303504066\",\n" +
                "\"receiverAcc\":\"9704030002303504\",\n" +
                "\"contentTransfers \":\"Chuyen tien lien NH - INQ c2c\",\n" +
                "\"MAC\":\"B33290D4CF8A683B\"\n" +
                "}\n";
        CustomKafkaMessage msg = new CustomKafkaMessage();
        msg.setTransId("123");
        msg.setErrCode("00");
        msg.setErrDesc("success");
        msg.setMessage(json);

        producer.sendMessage(msg, "TEST.KAFKA");
        return new ResponseEntity<>("success", HttpStatus.OK);
    }

    @GetMapping(value = "/trans")
    public ResponseEntity<Object> trans() {
        Transaction trans = new Transaction();
        trans.setXrefId("1");
        trans.setClientId("1");
        trans.setChannelId("ABC");
        trans.setServiceGroupId("G1");
        trans.setServiceId("S1");
        trans.setAmount(new BigDecimal(1000));
        trans.setCreatedOn(new Date());
        transactionRepository.save(trans);

        return new ResponseEntity<>("success", HttpStatus.OK);
    }
}
