package crm_hrm_management.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import crm_hrm_management.entity.Attendance;
import crm_hrm_management.service.AttendanceService;

@Controller
public class AttendanceController {

    @Autowired
    private AttendanceService attendanceService;

    @GetMapping("/attendance")
    public String showAttendance(Model model) {
        model.addAttribute("attendanceList",
                attendanceService.getAllAttendance());
        model.addAttribute("attendance", new Attendance());
        return "attendance";
    }

    @PostMapping("/attendance/add")
    public String addAttendance(
            Attendance attendance,
            RedirectAttributes ra) {
        try {
            attendanceService.addAttendance(attendance);
            ra.addFlashAttribute("successMessage",
                    "Attendance added successfully!");
        } catch (Exception e) {
            ra.addFlashAttribute("errorMessage",
                    "Failed to add attendance. Check the entered details.");
        }
        return "redirect:/attendance";
    }

    @GetMapping("/attendance/edit/{id}")
    public String editAttendance(
            @PathVariable Long id,
            Model model,
            RedirectAttributes ra) {
        try {
            model.addAttribute("attendance",
                    attendanceService.getAttendanceById(id));
            return "edit-attendance";
        } catch (Exception e) {
            ra.addFlashAttribute("errorMessage",
                    "Attendance record not found.");
            return "redirect:/attendance";
        }
    }

    @PostMapping("/attendance/update/{id}")
    public String updateAttendance(
            @PathVariable Long id,
            Attendance attendance,
            RedirectAttributes ra) {
        try {
            attendanceService.updateAttendance(id, attendance);
            ra.addFlashAttribute("successMessage",
                    "Attendance updated successfully!");
        } catch (Exception e) {
            ra.addFlashAttribute("errorMessage",
                    "Failed to update attendance.");
        }
        return "redirect:/attendance";
    }

    @PostMapping("/attendance/delete/{id}")
    public String deleteAttendance(
            @PathVariable Long id,
            RedirectAttributes ra) {
        try {
            attendanceService.deleteAttendance(id);
            ra.addFlashAttribute("successMessage",
                    "Attendance deleted successfully!");
        } catch (Exception e) {
            ra.addFlashAttribute("errorMessage",
                    "Failed to delete attendance.");
        }
        return "redirect:/attendance";
    }
}