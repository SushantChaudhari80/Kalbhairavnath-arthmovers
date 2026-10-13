package com.sushant.live.model;


import jakarta.persistence.*;
import java.time.Instant;

@Entity
@Table(name = "incident_comments")
public class IncidentComment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "incident_id", nullable = false)
    private Long incidentId;

    @Column(name = "comment_text", nullable = false,
            length = 5000)
    private String commentText;

    @Column(name = "commented_by")
    private String commentedBy;

    @Column(name = "created_at", nullable = false,
            updatable = false)
    private Instant createdAt;
    
    @PrePersist
    void onCreate() {
        createdAt = Instant.now();
    }
    

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getIncidentId() {
		return incidentId;
	}

	public void setIncidentId(Long incidentId) {
		this.incidentId = incidentId;
	}

	public String getCommentText() {
		return commentText;
	}

	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}

	public String getCommentedBy() {
		return commentedBy;
	}

	public void setCommentedBy(String commentedBy) {
		this.commentedBy = commentedBy;
	}

	public Instant getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Instant createdAt) {
		this.createdAt = createdAt;
	}

	public IncidentComment(Long id, Long incidentId, String commentText, String commentedBy, Instant createdAt) {
		super();
		this.id = id;
		this.incidentId = incidentId;
		this.commentText = commentText;
		this.commentedBy = commentedBy;
		this.createdAt = createdAt;
	}

	public IncidentComment() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    
    
}
