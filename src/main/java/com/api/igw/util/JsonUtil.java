package com.api.igw.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.json.JsonReadFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonUtil {

    private static final ObjectMapper mapper = new ObjectMapper();

    public static JsonNode toJsonNode(String json) {
        try {
            mapper.configure(
                    JsonReadFeature.ALLOW_UNESCAPED_CONTROL_CHARS.mappedFeature(),
                    true
            );
            JsonNode root = mapper.readTree(json);
            return root;

        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static JsonNode getVal(JsonNode root, String keyPath) {
        if(root == null || keyPath == null || "".equals(keyPath))
            return null;

        return root.at(keyPath);
    }
}
