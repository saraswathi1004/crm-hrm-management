package crm_hrm_management.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import crm_hrm_management.entity.Attendance;
import crm_hrm_management.repository.AttendanceRepository;

@Service
public class AttendanceService {

    @Autowired
    private AttendanceRepository attendanceRepository;

    // Add attendance
    public Attendance addAttendance(Attendance attendance) {
        return attendanceRepository.save(attendance);
    }

    // Get all attendance records
    public List<Attendance> getAllAttendance() {
        return attendanceRepository.findAll();
    }

    // Get attendance by ID
    public Attendance getAttendanceById(Long id) {
        return attendanceRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Attendance not found"));
    }

    // Update attendance
    public Attendance updateAttendance(Long id, Attendance updatedAttendance) {
        Attendance existing = getAttendanceById(id);

        existing.setEmployeeId(updatedAttendance.getEmployeeId());
        existing.setEmployeeName(updatedAttendance.getEmployeeName());
        existing.setAttendanceDate(updatedAttendance.getAttendanceDate());
        existing.setStatus(updatedAttendance.getStatus());

        return attendanceRepository.save(existing);
    }

    // Delete attendance
    public void deleteAttendance(Long id) {
        attendanceRepository.deleteById(id);
    }
}