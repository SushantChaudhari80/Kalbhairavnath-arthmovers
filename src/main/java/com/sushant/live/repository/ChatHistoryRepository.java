package com.sushant.live.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.sushant.live.model.ai.ChatHistory;

import java.util.List;
import java.util.Map;

public interface ChatHistoryRepository
        extends JpaRepository<ChatHistory, Long> {

    List<ChatHistory> findBySessionIdOrderByCreatedAtAsc(String sessionId);

    void deleteBySessionId(String sessionId);
    
    @Query(value = """
    	    SELECT
    	        session_id AS "sessionId",
    	        (
    	            SELECT h2.message
    	            FROM chat_history h2
    	            WHERE h2.session_id = h1.session_id
    	            ORDER BY h2.created_at DESC, h2.id DESC
    	            LIMIT 1
    	        ) AS "lastMessage",
    	        MAX(created_at) AS "lastMessageAt",
    	        COUNT(*) AS "messageCount"
    	    FROM chat_history h1
    	    GROUP BY session_id
    	    ORDER BY MAX(created_at) DESC
    	    """, nativeQuery = true)
    	List<Map<String, Object>> findAllChatSessions();
}