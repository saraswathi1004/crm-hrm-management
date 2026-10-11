package crm_hrm_management.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import crm_hrm_management.entity.Leave;
import crm_hrm_management.service.LeaveService;

@Controller
public class LeaveController {

    @Autowired
    private LeaveService leaveService;

    @GetMapping("/leaves")
    public String showLeaves(Model model) {
        model.addAttribute("leaveList", leaveService.getAllLeaves());
        model.addAttribute("leave", new Leave());
        return "leaves";
    }

    @PostMapping("/leaves/add")
    public String addLeave(Leave leave, RedirectAttributes ra) {
        try {
            leaveService.addLeave(leave);
            ra.addFlashAttribute("successMessage",
                    "Leave request added successfully!");
        } catch (Exception e) {
            ra.addFlashAttribute("errorMessage",
                    "Failed to add leave request.");
        }
        return "redirect:/leaves";
    }

    @GetMapping("/leaves/edit/{id}")
    public String editLeave(@PathVariable Long id, Model model,
                            RedirectAttributes ra) {
        try {
            model.addAttribute("leave", leaveService.getLeaveById(id));
            return "edit-leave";
        } catch (Exception e) {
            ra.addFlashAttribute("errorMessage",
                    "Leave request not found.");
            return "redirect:/leaves";
        }
    }

    @PostMapping("/leaves/update/{id}")
    public String updateLeave(@PathVariable Long id, Leave leave,
                              RedirectAttributes ra) {
        try {
            leaveService.updateLeave(id, leave);
            ra.addFlashAttribute("successMessage",
                    "Leave request updated successfully!");
        } catch (Exception e) {
            ra.addFlashAttribute("errorMessage",
                    "Failed to update leave request.");
        }
        return "redirect:/leaves";
    }

    @PostMapping("/leaves/delete/{id}")
    public String deleteLeave(@PathVariable Long id, RedirectAttributes ra) {
        try {
            leaveService.deleteLeave(id);
            ra.addFlashAttribute("successMessage",
                    "Leave request deleted successfully!");
        } catch (Exception e) {
            ra.addFlashAttribute("errorMessage",
                    "Failed to delete leave request.");
        }
        return "redirect:/leaves";
    }
}