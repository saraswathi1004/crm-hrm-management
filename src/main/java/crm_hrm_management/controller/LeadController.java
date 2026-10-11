
package crm_hrm_management.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import crm_hrm_management.entity.Lead;
import crm_hrm_management.service.LeadService;

@Controller
public class LeadController {

    @Autowired
    private LeadService leadService;

    // Display all leads
    @GetMapping("/leads")
    public String showLeads(Model model) {
        model.addAttribute("leads", leadService.getAllLeads());
        model.addAttribute("lead", new Lead());
        return "leads";
    }

    // Add lead
    @PostMapping("/leads/add")
    public String addLead(Lead lead,
                          RedirectAttributes redirectAttributes) {
        try {
            leadService.addLead(lead);
            redirectAttributes.addFlashAttribute(
                    "successMessage", "Lead added successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute(
                    "errorMessage", "Failed to add lead.");
        }
        return "redirect:/leads";
    }

    // Display edit page
    @GetMapping("/leads/edit/{id}")
    public String editLead(@PathVariable Long id,
                           Model model,
                           RedirectAttributes redirectAttributes) {
        try {
            model.addAttribute("lead", leadService.getLeadById(id));
            return "edit-lead";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute(
                    "errorMessage", "Lead not found.");
            return "redirect:/leads";
        }
    }

    // Update lead
    @PostMapping("/leads/update/{id}")
    public String updateLead(@PathVariable Long id,
                             Lead updatedLead,
                             RedirectAttributes redirectAttributes) {
        try {
            leadService.updateLead(id, updatedLead);
            redirectAttributes.addFlashAttribute(
                    "successMessage", "Lead updated successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute(
                    "errorMessage", "Failed to update lead.");
        }
        return "redirect:/leads";
    }

    // Delete lead
    @PostMapping("/leads/delete/{id}")
    public String deleteLead(@PathVariable Long id,
                             RedirectAttributes redirectAttributes) {
        try {
            leadService.deleteLead(id);
            redirectAttributes.addFlashAttribute(
                    "successMessage", "Lead deleted successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute(
                    "errorMessage", "Failed to delete lead.");
        }
        return "redirect:/leads";
    }
}
