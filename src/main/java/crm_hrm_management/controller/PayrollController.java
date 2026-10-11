
package crm_hrm_management.controller;

import crm_hrm_management.entity.Payroll;
import crm_hrm_management.service.PayrollService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class PayrollController {

    private final PayrollService payrollService;

    public PayrollController(PayrollService payrollService) {
        this.payrollService = payrollService;
    }

    @GetMapping("/payroll")
    public String showPayroll(Model model) {
        model.addAttribute("payrollList",
                payrollService.getAllPayrolls());
        model.addAttribute("payroll", new Payroll());

        return "payroll";
    }

    @PostMapping("/payroll/add")
    public String addPayroll(
            @ModelAttribute("payroll") Payroll payroll,
            RedirectAttributes redirectAttributes) {
        try {
            payrollService.addPayroll(payroll);
            redirectAttributes.addFlashAttribute(
                    "success", "Payroll added successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute(
                    "error", "Unable to add payroll. Check the details.");
        }

        return "redirect:/payroll";
    }

    @GetMapping("/payroll/edit/{id}")
    public String editPayroll(
            @PathVariable Long id, Model model) {
        model.addAttribute("payroll",
                payrollService.getPayrollById(id));

        return "edit-payroll";
    }

    @PostMapping("/payroll/update/{id}")
    public String updatePayroll(
            @PathVariable Long id,
            @ModelAttribute("payroll") Payroll payroll,
            RedirectAttributes redirectAttributes) {
        try {
            payrollService.updatePayroll(id, payroll);
            redirectAttributes.addFlashAttribute(
                    "success", "Payroll updated successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute(
                    "error", "Unable to update payroll. Check the details.");
        }

        return "redirect:/payroll";
    }

    @PostMapping("/payroll/delete/{id}")
    public String deletePayroll(
            @PathVariable Long id,
            RedirectAttributes redirectAttributes) {
        try {
            payrollService.deletePayroll(id);
            redirectAttributes.addFlashAttribute(
                    "success", "Payroll deleted successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute(
                    "error", "Unable to delete payroll.");
        }

        return "redirect:/payroll";
    }
}
