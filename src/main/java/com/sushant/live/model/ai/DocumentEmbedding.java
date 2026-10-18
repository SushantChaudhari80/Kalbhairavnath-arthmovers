package com.sushant.live.model.ai;

import jakarta.persistence.*;

import org.hibernate.annotations.ColumnTransformer;
//import org.hibernate.annotations.Array;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;

import java.time.Instant;

@Entity
@Table(
    name = "document_embedding",
    indexes = {
        @Index(name = "idx_document_embedding_name", columnList = "document_name")
    }
)
public class DocumentEmbedding {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "document_name", nullable = false, length = 255)
    private String documentName;

    @Column(name = "chunk_index", nullable = false)
    private Integer chunkIndex;

    @Column(name = "chunk_text", nullable = false, columnDefinition = "text")
    private String chunkText;

    @ColumnTransformer(
    	    read = "embedding::text",
    	    write = "?::vector"
    	)
    	@Column(
    	    name = "embedding",
    	    nullable = false,
    	    columnDefinition = "vector(768)"
    	)
    	private String embedding;

    @Column(name = "created_at", nullable = false)
    private Instant createdAt = Instant.now();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDocumentName() {
		return documentName;
	}

	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}

	public Integer getChunkIndex() {
		return chunkIndex;
	}

	public void setChunkIndex(Integer chunkIndex) {
		this.chunkIndex = chunkIndex;
	}

	public String getChunkText() {
		return chunkText;
	}

	public void setChunkText(String chunkText) {
		this.chunkText = chunkText;
	}



	public String getEmbedding() {
		return embedding;
	}

	public void setEmbedding(String embedding) {
		this.embedding = embedding;
	}

	public Instant getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Instant createdAt) {
		this.createdAt = createdAt;
	}

	

	public DocumentEmbedding(Long id, String documentName, Integer chunkIndex, String chunkText, String embedding,
			Instant createdAt) {
		super();
		this.id = id;
		this.documentName = documentName;
		this.chunkIndex = chunkIndex;
		this.chunkText = chunkText;
		this.embedding = embedding;
		this.createdAt = createdAt;
	}

	public DocumentEmbedding() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    
}
