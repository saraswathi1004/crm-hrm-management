
package crm_hrm_management.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import crm_hrm_management.entity.Employee;
import crm_hrm_management.service.EmployeeService;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    // Display all employees
    @GetMapping("/employees")
    public String showEmployees(Model model) {
        model.addAttribute("employees", employeeService.getAllEmployees());
        model.addAttribute("employee", new Employee());
        return "employees";
    }

    // Add employee
    @PostMapping("/employees/add")
    public String addEmployee(
            Employee employee,
            RedirectAttributes redirectAttributes) {

        try {
            employeeService.addEmployee(employee);
            redirectAttributes.addFlashAttribute(
                    "successMessage", "Employee added successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute(
                    "errorMessage", "Failed to add employee.");
        }

        return "redirect:/employees";
    }

    // Open employee edit page
    @GetMapping("/employees/edit/{id}")
    public String editEmployee(
            @PathVariable Long id,
            Model model,
            RedirectAttributes redirectAttributes) {

        try {
            model.addAttribute("employee", employeeService.getEmployeeById(id));
            return "edit-employee";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute(
                    "errorMessage", "Employee not found.");
            return "redirect:/employees";
        }
    }

    // Update employee
    @PostMapping("/employees/update/{id}")
    public String updateEmployee(
            @PathVariable Long id,
            Employee employee,
            RedirectAttributes redirectAttributes) {

        try {
            employeeService.updateEmployee(id, employee);
            redirectAttributes.addFlashAttribute(
                    "successMessage", "Employee updated successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute(
                    "errorMessage", "Failed to update employee.");
        }

        return "redirect:/employees";
    }

    // Delete employee
    @PostMapping("/employees/delete/{id}")
    public String deleteEmployee(
            @PathVariable Long id,
            RedirectAttributes redirectAttributes) {

        try {
            employeeService.deleteEmployee(id);
            redirectAttributes.addFlashAttribute(
                    "successMessage", "Employee deleted successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute(
                    "errorMessage", "Failed to delete employee.");
        }

        return "redirect:/employees";
    }
}
