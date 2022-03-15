package com.api.igw.service;

import com.api.igw.kafka.CustomKafkaMessage;

public interface KafkaProducerService {


    public void sendMessage(String message, String topic);

    public void sendMessage(CustomKafkaMessage message, String topic);
}
