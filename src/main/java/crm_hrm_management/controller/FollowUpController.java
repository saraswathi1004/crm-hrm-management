
package crm_hrm_management.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import crm_hrm_management.entity.FollowUp;
import crm_hrm_management.service.FollowUpService;

@Controller
public class FollowUpController {

    @Autowired
    private FollowUpService followUpService;

    @GetMapping("/follow-ups")
    public String showFollowUps(Model model) {
        model.addAttribute("followUps",
                followUpService.getAllFollowUps());
        model.addAttribute("followUp", new FollowUp());
        return "follow-ups";
    }

    @PostMapping("/follow-ups/add")
    public String addFollowUp(
            FollowUp followUp,
            RedirectAttributes redirectAttributes) {

        try {
            followUpService.addFollowUp(followUp);
            redirectAttributes.addFlashAttribute(
                    "successMessage", "Follow-up added successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute(
                    "errorMessage", "Failed to add follow-up.");
        }

        return "redirect:/follow-ups";
    }

    @GetMapping("/follow-ups/edit/{id}")
    public String editFollowUp(
            @PathVariable Long id,
            Model model,
            RedirectAttributes redirectAttributes) {

        try {
            model.addAttribute(
                    "followUp", followUpService.getFollowUpById(id));
            return "edit-follow-up";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute(
                    "errorMessage", "Follow-up not found.");
            return "redirect:/follow-ups";
        }
    }

    @PostMapping("/follow-ups/update/{id}")
    public String updateFollowUp(
            @PathVariable Long id,
            FollowUp followUp,
            RedirectAttributes redirectAttributes) {

        try {
            followUpService.updateFollowUp(id, followUp);
            redirectAttributes.addFlashAttribute(
                    "successMessage", "Follow-up updated successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute(
                    "errorMessage", "Failed to update follow-up.");
        }

        return "redirect:/follow-ups";
    }

    @PostMapping("/follow-ups/delete/{id}")
    public String deleteFollowUp(
            @PathVariable Long id,
            RedirectAttributes redirectAttributes) {

        try {
            followUpService.deleteFollowUp(id);
            redirectAttributes.addFlashAttribute(
                    "successMessage", "Follow-up deleted successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute(
                    "errorMessage", "Failed to delete follow-up.");
        }

        return "redirect:/follow-ups";
    }
}
