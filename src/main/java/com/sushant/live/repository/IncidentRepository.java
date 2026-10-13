
package com.sushant.live.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sushant.live.model.Incident;

import java.util.List;
import java.util.Optional;

public interface IncidentRepository
        extends JpaRepository<Incident, Long> {

    List<Incident> findAllByOrderByCreatedAtDesc();

    List<Incident> findByCreatedByOrderByCreatedAtDesc(
            String userId);

    Optional<Incident> findByIdAndCreatedBy(
            Long id, String userId);
}
