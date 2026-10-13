package com.sushant.live.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import com.sushant.live.dto.CommentRequest;
import com.sushant.live.dto.IncidentRequest;
import com.sushant.live.dto.StatusRequest;
import com.sushant.live.model.Incident;
import com.sushant.live.model.IncidentComment;
import com.sushant.live.repository.IncidentCommentRepository;
import com.sushant.live.repository.IncidentRepository;

import java.time.Instant;
import java.util.List;

@Service
public class IncidentService {

	@Autowired
    private  IncidentRepository incidentRepository;
	
	@Autowired
    private  IncidentCommentRepository commentRepository;
	
	@Autowired
    private  JdbcTemplate jdbcTemplate;

    private Incident findAccessibleIncident(
            Long id) {

    	return incidentRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "Incident not found"));
        
    }

    private String nextIncidentCode() {
        Long sequence = jdbcTemplate.queryForObject(
            "SELECT nextval('incident_id_seq')", Long.class);

        return "INC-TANVI%04d".formatted(sequence);
    }

    @Transactional
    public Incident create(
            IncidentRequest request) {

        Incident incident = new Incident();

        incident.setIncidentCode(nextIncidentCode());
        incident.setTitle(request.title().trim());
        incident.setCategory(request.category().name());
        incident.setPriority(request.priority().name());
        incident.setStatus("Open");
        incident.setDescription(request.description().trim());
        incident.setCreatedBy(request.createdBy().trim());
        incident.setCreatedAt(Instant.now());
        

        return incidentRepository.save(incident);
    }

    @Transactional(readOnly = true)
    public List<Incident> list() {
        return incidentRepository.findAllByOrderByCreatedAtDesc();
    }

    @Transactional(readOnly = true)
    public Incident get(Long id) {
        return findAccessibleIncident(id);
    }

    @Transactional
    public Incident updateStatus(
            Long id, StatusRequest request) {

        Incident incident = incidentRepository.findById(id)
            .orElseThrow(() -> new ResponseStatusException(
                HttpStatus.NOT_FOUND, "Incident not found"));

        String status = switch (request.status()) {
            case Open -> "Open";
            case In_Progress -> "In Progress";
            case Resolved -> "Resolved";
        };

        incident.setStatus(status);
        return incidentRepository.save(incident);
    }

    @Transactional
    public IncidentComment addComment(
            Long id, CommentRequest request) {

        findAccessibleIncident(id);

        IncidentComment comment = new IncidentComment();
        comment.setIncidentId(id);
        comment.setCommentText(request.comment().trim());
        comment.setCommentedBy(request.commentedBy().trim());
        comment.setCreatedAt(Instant.now());

        return commentRepository.save(comment);
    }

    @Transactional(readOnly = true)
    public List<IncidentComment> getComments(
            Long id) {

        findAccessibleIncident(id);

        return commentRepository
            .findAllByIncidentIdOrderByCreatedAtAsc(id);
    }
}
