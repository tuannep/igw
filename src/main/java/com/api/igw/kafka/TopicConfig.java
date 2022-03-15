package com.api.igw.kafka;//package vn.com.npgw.config;
//
//import java.util.HashMap;
//import java.util.Map;
//import org.apache.kafka.clients.admin.AdminClientConfig;
//import org.apache.kafka.clients.admin.NewTopic;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.kafka.config.TopicBuilder;
//import org.springframework.kafka.core.KafkaAdmin;
//import vn.com.npgw.constant.AppConstant;
//
//@Configuration
//public class TopicConfig
//{
//    @Value(value = "${spring.kafka.consumer.bootstrap-servers}")
//    private String bootstrapAddress;
//
//    @Value(value = "${TOPIC_NRT_IN_PACS008_PARTITIONS}")
//    private Integer TOPIC_NRT_IN_PACS008_PARTITIONS;
//
//    @Bean
//    public NewTopic TOPIC_NRT_IN_PACS008Topic() {
//        return TopicBuilder.name(AppConstant.QueueConfig.TOPIC_NRT_IN_PACS008)
//                .partitions(TOPIC_NRT_IN_PACS008_PARTITIONS)
//                .replicas(1)
//                .build();
//    }
//
////    @Bean
////    public NewTopic TOPIC_NACK_IN_ISO8583Topic() {
////        return TopicBuilder.name(AppConstant.QueueConfig.TOPIC_NACK_IN_ISO8583)
////                .partitions(1)
////                .replicas(1)
////                .build();
////    }
//
//
//    //If not using spring boot
//
//    @Bean
//    public KafkaAdmin kafkaAdmin()
//    {
//        Map<String, Object> configs = new HashMap<>();
//        configs.put(AdminClientConfig.BOOTSTRAP_SERVERS_CONFIG, bootstrapAddress);
//        return new KafkaAdmin(configs);
//    }
//}
