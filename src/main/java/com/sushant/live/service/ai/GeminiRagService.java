package com.sushant.live.service.ai;

import com.google.genai.Client;
import com.google.genai.types.ContentEmbedding;
import com.google.genai.types.EmbedContentConfig;
import com.google.genai.types.EmbedContentResponse;
import com.google.genai.types.GenerateContentConfig;
import com.google.genai.types.GenerateContentResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import com.google.genai.errors.ServerException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

@Service
public class GeminiRagService {

    private final Client client;
    private final String chatModel;
    private final String embeddingModel;
    private final int dimensions;
    private static final Logger log =
            LoggerFactory.getLogger(GeminiRagService.class);

    private final String fallbackChatModel;

    public GeminiRagService(
            Client client,
            @Value("${google.ai.chat-model}") String chatModel,
            @Value("${google.ai.embedding-model}") String embeddingModel,
            @Value("${rag.embedding-dimensions:768}") int dimensions,
            @Value("${google.ai.fallback-chat-model:gemini-2.5-flash}")
            String fallbackChatModel) {

        this.client = client;
        this.chatModel = chatModel;
        this.embeddingModel = embeddingModel;
        this.dimensions = dimensions;
        this.fallbackChatModel=fallbackChatModel;
    }

    public float[] embedDocument(String text) {
        return embed(text, "RETRIEVAL_DOCUMENT");
    }

    public float[] embedQuery(String text) {
        return embed(text, "RETRIEVAL_QUERY");
    }

    private float[] embed(String text, String taskType) {
        EmbedContentConfig config = EmbedContentConfig.builder()
                .taskType(taskType)
                .outputDimensionality(dimensions)
                .build();

        EmbedContentResponse response =
                client.models.embedContent(
                        embeddingModel,
                        text,
                        config
                );

        List<ContentEmbedding> embeddings = response.embeddings()
                .orElseThrow(() ->
                        new IllegalStateException(
                                "Gemini returned no embeddings"));

        List<Float> values = embeddings.get(0).values()
                .orElseThrow(() ->
                        new IllegalStateException(
                                "Gemini returned empty embedding values"));

        if (values.size() != dimensions) {
            throw new IllegalStateException(
                    "Unexpected embedding dimensions: " + values.size());
        }

        float[] vector = new float[values.size()];

        for (int i = 0; i < values.size(); i++) {
            vector[i] = values.get(i);
        }

        return vector;
    }


public String generateAnswer(String prompt) {

    GenerateContentConfig config =
            GenerateContentConfig.builder()
                    .temperature(0.2f)
                    .build();

    // Retry the primary model up to 3 times.
    try {
        return generateWithRetry(
                chatModel, prompt, config, 3);
    } catch (ServerException primaryError) {

        log.warn(
                "Primary Gemini model {} unavailable. "
                + "Trying fallback model {}.",
                chatModel, fallbackChatModel);

        // Do not retry the same model indefinitely.
        return generateWithRetry(
                fallbackChatModel, prompt, config, 2);
    }
}

private String generateWithRetry(
        String model,
        String prompt,
        GenerateContentConfig config,
        int maxAttempts) {

    for (int attempt = 1; attempt <= maxAttempts; attempt++) {
        try {
            GenerateContentResponse response =
                    client.models.generateContent(
                            model, prompt, config);

            String answer = response.text();

            if (answer == null || answer.isBlank()) {
                throw new IllegalStateException(
                        "Gemini returned an empty answer");
            }

            return answer.trim();

        } catch (ServerException ex) {

            if (attempt == maxAttempts) {
                log.error(
                        "Gemini model {} failed after {} attempts",
                        model, maxAttempts, ex);
                throw ex;
            }

            long delayMs = 1000L * (1L << (attempt - 1));

            log.warn(
                    "Gemini model {} returned a server error. "
                    + "Attempt {}/{}. Retrying in {} ms.",
                    model, attempt, maxAttempts, delayMs);

            try {
                Thread.sleep(delayMs);
            } catch (InterruptedException interrupted) {
                Thread.currentThread().interrupt();

                throw new IllegalStateException(
                        "Interrupted while retrying Gemini",
                        interrupted);
            }
        }
    }

    throw new IllegalStateException(
            "Gemini generation failed unexpectedly");
}

}