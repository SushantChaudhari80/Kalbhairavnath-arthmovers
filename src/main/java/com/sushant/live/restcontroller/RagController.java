package com.sushant.live.restcontroller;

import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.sushant.live.dto.ChatRequest;
import com.sushant.live.dto.ChatResponse;
import com.sushant.live.model.ai.ChatHistory;
import com.sushant.live.service.ai.RagService;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/rag")
public class RagController {

    private final RagService ragService;

    public RagController(RagService ragService) {
        this.ragService = ragService;
    }

    @PostMapping(
            value = "/documents",
            consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> uploadDocument(
            @RequestParam("file") MultipartFile file)
            throws Exception {

        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ragService.upload(file));
    }

    @DeleteMapping("/documents/{documentName}")
    public ResponseEntity<?> deleteDocument(
            @PathVariable String documentName) {

        return ResponseEntity.ok(
                ragService.deleteDocument(documentName));
    }

    @GetMapping("/documents")
    public ResponseEntity<List<String>> getDocuments() {
        return ResponseEntity.ok(ragService.getDocuments());
    }

    @PostMapping("/chat")
    public ResponseEntity<ChatResponse> chat(
            @Valid @RequestBody ChatRequest request) {

        return ResponseEntity.ok(ragService.chat(request));
    }

    @GetMapping("/chat/history/{sessionId}")
    public ResponseEntity<List<ChatHistory>> getChatHistory(
            @PathVariable String sessionId) {

        return ResponseEntity.ok(
                ragService.getHistory(sessionId));
    }

    @DeleteMapping("/chat/history/{sessionId}")
    public ResponseEntity<?> clearChatHistory(
            @PathVariable String sessionId) {

        ragService.clearHistory(sessionId);

        return ResponseEntity.ok(Map.of(
                "message", "Chat history cleared",
                "sessionId", sessionId
        ));
    }
    
    @GetMapping("/chat/sessions")
    public ResponseEntity<?> getAllChatSessions() {
        return ResponseEntity.ok(ragService.getAllChatSessions());
    }
}