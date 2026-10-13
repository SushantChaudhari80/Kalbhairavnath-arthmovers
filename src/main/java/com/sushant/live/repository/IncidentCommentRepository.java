package com.sushant.live.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sushant.live.model.IncidentComment;

import java.util.List;

public interface IncidentCommentRepository
        extends JpaRepository<IncidentComment, Long> {

    List<IncidentComment> findAllByIncidentIdOrderByCreatedAtAsc(
        Long incidentId
    );
}

