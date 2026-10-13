package com.sushant.live.restcontroller;

import jakarta.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import com.sushant.live.dto.CommentRequest;
import com.sushant.live.dto.IncidentRequest;
import com.sushant.live.dto.StatusRequest;
import com.sushant.live.model.Incident;
import com.sushant.live.model.IncidentComment;
import com.sushant.live.service.IncidentService;

import java.util.List;

@RestController
@RequestMapping("/api/incidents")
public class IncidentController {

	@Autowired
    private  IncidentService incidentService;

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Incident create(
            @Valid @RequestBody IncidentRequest request) {

        return incidentService.create(request);
    }

    @GetMapping
    public List<Incident> list() {

        return incidentService.list();
    }

    @GetMapping("/{id}")
    public Incident get(
            @PathVariable Long id
           ) {

        return incidentService.get(id);
    }

    @PatchMapping("/{id}/status")
    public Incident updateStatus(
            @PathVariable Long id,
            @Valid @RequestBody StatusRequest request) {

        return incidentService.updateStatus(id, request);
    }

    @GetMapping("/{id}/comments")
    public List<IncidentComment> getComments(
            @PathVariable Long id
            ) {

        return incidentService.getComments(id);
    }

    @PostMapping("/{id}/comments")
    @ResponseStatus(HttpStatus.CREATED)
    public IncidentComment addComment(
            @PathVariable Long id,
            @Valid @RequestBody CommentRequest request) {

        return incidentService.addComment(id, request);
    }
}
