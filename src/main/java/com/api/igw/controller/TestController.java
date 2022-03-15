package com.api.igw.controller;

import com.api.igw.model.Transaction;
import com.api.igw.repository.TransactionRepository;
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

    @PutMapping(value ="test", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> inquiry(@RequestBody String iMessage) {
        logger.debug("Received inquiry msg from bank client");
        System.out.println(iMessage);
        return new ResponseEntity<>(iMessage, HttpStatus.OK);
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
