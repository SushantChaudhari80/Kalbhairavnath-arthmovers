package com.sushant.live.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.sushant.live.model.ai.DocumentEmbedding;

import java.util.List;

public interface DocumentEmbeddingRepository
        extends JpaRepository<DocumentEmbedding, Long> {

    boolean existsByDocumentName(String documentName);

    long deleteByDocumentName(String documentName);

    @Query("""
        SELECT DISTINCT d.documentName
        FROM DocumentEmbedding d
        ORDER BY d.documentName
        """)
    List<String> findDistinctDocumentNames();

    @Query(value = """
        SELECT id, document_name, chunk_index, chunk_text,
               embedding, created_at
        FROM document_embedding
        ORDER BY embedding <=> CAST(:queryVector AS vector)
        LIMIT :limit
        """, nativeQuery = true)
    List<DocumentEmbedding> findSimilarChunks(
            @Param("queryVector") String queryVector,
            @Param("limit") int limit
    );
}