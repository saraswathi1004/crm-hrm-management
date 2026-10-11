package crm_hrm_management.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import crm_hrm_management.entity.Leave;
import crm_hrm_management.repository.LeaveRepository;

@Service
public class LeaveService {

    @Autowired
    private LeaveRepository leaveRepository;

    // Add leave request
    public Leave addLeave(Leave leave) {
        if (leave.getStatus() == null || leave.getStatus().isBlank()) {
            leave.setStatus("Pending");
        }
        return leaveRepository.save(leave);
    }

    // Get all leave requests
    public List<Leave> getAllLeaves() {
        return leaveRepository.findAll();
    }

    // Get leave request by ID
    public Leave getLeaveById(Long id) {
        return leaveRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Leave request not found"));
    }

    // Update leave request
    public Leave updateLeave(Long id, Leave updatedLeave) {
        Leave existing = getLeaveById(id);

        existing.setEmployeeId(updatedLeave.getEmployeeId());
        existing.setEmployeeName(updatedLeave.getEmployeeName());
        existing.setLeaveType(updatedLeave.getLeaveType());
        existing.setFromDate(updatedLeave.getFromDate());
        existing.setToDate(updatedLeave.getToDate());
        existing.setReason(updatedLeave.getReason());
        existing.setStatus(updatedLeave.getStatus());

        return leaveRepository.save(existing);
    }

    // Delete leave request
    public void deleteLeave(Long id) {
        leaveRepository.deleteById(id);
    }
}