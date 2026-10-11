
package crm_hrm_management.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import crm_hrm_management.entity.Lead;
import crm_hrm_management.repository.LeadRepository;

@Service
public class LeadService {

    @Autowired
    private LeadRepository leadRepository;

    // Add Lead
    public Lead addLead(Lead lead) {
        return leadRepository.save(lead);
    }

    // Get All Leads
    public List<Lead> getAllLeads() {
        return leadRepository.findAll();
    }

    // Get Lead By ID
    public Lead getLeadById(Long id) {
        return leadRepository.findById(id)
                .orElseThrow(() ->
                    new RuntimeException("Lead not found with ID: " + id));
    }

    // Update Lead
    public Lead updateLead(Long id, Lead updatedLead) {
        Lead existingLead = getLeadById(id);

        existingLead.setLeadName(updatedLead.getLeadName());
        existingLead.setEmail(updatedLead.getEmail());
        existingLead.setPhone(updatedLead.getPhone());
        existingLead.setCompany(updatedLead.getCompany());
        existingLead.setSource(updatedLead.getSource());
        existingLead.setStatus(updatedLead.getStatus());

        return leadRepository.save(existingLead);
    }

    // Delete Lead
    public void deleteLead(Long id) {
        Lead lead = getLeadById(id);
        leadRepository.delete(lead);
    }
}
