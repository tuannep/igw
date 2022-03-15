package com.api.igw.service.impl;

import com.api.igw.kafka.CustomKafkaMessage;
import com.api.igw.service.KafkaProducerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

@Service("KafkaProducerService")
public class KafkaProducerServiceImpl implements KafkaProducerService {

    public static Logger logger = LoggerFactory.getLogger(KafkaProducerServiceImpl.class);

    @Autowired
    KafkaTemplate<String,String> kafkaTemplate;

    @Autowired
    KafkaTemplate<String, CustomKafkaMessage> customKafkaMessageKafkaTemplate;


    @Override
    public void sendMessage(String message, String topic) {
        this.kafkaTemplate.send(topic,message);
    }

    @Override
    public void sendMessage(CustomKafkaMessage message, String topic) {
        this.customKafkaMessageKafkaTemplate.send(topic,message);
    }
}
