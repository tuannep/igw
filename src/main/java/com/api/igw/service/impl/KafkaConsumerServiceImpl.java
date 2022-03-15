package com.api.igw.service.impl;

import com.api.igw.kafka.CustomKafkaMessage;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

@Slf4j
@Service("KafkaConsumerService")
public class KafkaConsumerServiceImpl {

    @KafkaListener(topics = "TEST.KAFKA", groupId = "group01")
    public void TestKafka(CustomKafkaMessage kafkaMessage) {
        try {
            log.info("===> Consummer TEST.KAFKA Message: " + kafkaMessage.getMessage());
        } catch (Exception e) {
            log.error("Exception when handle TestKafka:" + e.getMessage());
        }
    }
}
