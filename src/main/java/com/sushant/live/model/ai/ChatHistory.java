package com.sushant.live.model.ai;

import jakarta.persistence.*;

import java.time.Instant;

@Entity
@Table(
    name = "chat_history",
    indexes = {
        @Index(name = "idx_chat_history_session", columnList = "session_id")
    }
)
public class ChatHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "session_id", nullable = false, length = 100)
    private String sessionId;

    @Column(name = "role", nullable = false, length = 20)
    private String role;

    @Column(name = "message", nullable = false, columnDefinition = "text")
    private String message;

    @Column(name = "created_at", nullable = false)
    private Instant createdAt = Instant.now();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Instant getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Instant createdAt) {
		this.createdAt = createdAt;
	}

	public ChatHistory(Long id, String sessionId, String role, String message, Instant createdAt) {
		super();
		this.id = id;
		this.sessionId = sessionId;
		this.role = role;
		this.message = message;
		this.createdAt = createdAt;
	}

	public ChatHistory() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    
}