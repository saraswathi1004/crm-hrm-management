
package crm_hrm_management.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import crm_hrm_management.entity.FollowUp;
import crm_hrm_management.repository.FollowUpRepository;

@Service
public class FollowUpService {

    @Autowired
    private FollowUpRepository followUpRepository;

    public FollowUp addFollowUp(FollowUp followUp) {
        return followUpRepository.save(followUp);
    }

    public List<FollowUp> getAllFollowUps() {
        return followUpRepository.findAll();
    }

    public FollowUp getFollowUpById(Long id) {
        return followUpRepository.findById(id)
                .orElseThrow(() ->
                    new RuntimeException("Follow-up not found with ID: " + id));
    }

    public FollowUp updateFollowUp(Long id, FollowUp updatedFollowUp) {
        FollowUp existing = getFollowUpById(id);

        existing.setCustomerName(updatedFollowUp.getCustomerName());
        existing.setFollowUpDate(updatedFollowUp.getFollowUpDate());
        existing.setFollowUpTime(updatedFollowUp.getFollowUpTime());
        existing.setNotes(updatedFollowUp.getNotes());
        existing.setStatus(updatedFollowUp.getStatus());

        return followUpRepository.save(existing);
    }

    public void deleteFollowUp(Long id) {
        followUpRepository.deleteById(id);
    }
}
