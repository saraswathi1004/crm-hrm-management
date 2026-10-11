
package crm_hrm_management.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import crm_hrm_management.entity.Customer;
import crm_hrm_management.service.CustomerService;

@Controller
public class CustomerController {

    private final CustomerService customerService;

    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    // Display all customers
    @GetMapping("/customers")
    public String showCustomers(Model model) {
        List<Customer> customers = customerService.getAllCustomers();
        model.addAttribute("customers", customers);
        model.addAttribute("customer", new Customer());
        return "customers";
    }

    // Add customer
    @PostMapping("/customers/add")
    public String addCustomer(
            @ModelAttribute("customer") Customer customer,
            RedirectAttributes redirectAttributes) {

        try {
            customerService.addCustomer(customer);
            redirectAttributes.addFlashAttribute(
                    "successMessage", "Customer added successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute(
                    "errorMessage", "Unable to add customer. Please check the details.");
        }

        return "redirect:/customers";
    }

    // Delete customer
    @PostMapping("/customers/delete/{id}")
    public String deleteCustomer(
            @PathVariable Long id,
            RedirectAttributes redirectAttributes) {

        try {
            customerService.deleteCustomer(id);
            redirectAttributes.addFlashAttribute(
                    "successMessage", "Customer deleted successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute(
                    "errorMessage", "Unable to delete customer.");
        }

        return "redirect:/customers";
    }
    
    @GetMapping("/customers/edit/{id}")
    public String showEditCustomer(@PathVariable Long id,
                                   Model model,
                                   RedirectAttributes redirectAttributes) {
        try {
            Customer customer = customerService.getCustomerById(id);

            model.addAttribute("customer", customer);

            return "edit-customer";

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute(
                "errorMessage", "Customer not found."
            );

            return "redirect:/customers";
        }
    }
    
    @PostMapping("/customers/update/{id}")
    public String updateCustomer(@PathVariable Long id,
                                 Customer updatedCustomer,
                                 RedirectAttributes redirectAttributes) {
        try {
            customerService.updateCustomer(id, updatedCustomer);

            redirectAttributes.addFlashAttribute(
                "successMessage",
                "Customer updated successfully!"
            );

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute(
                "errorMessage",
                "Failed to update customer."
            );
        }

        return "redirect:/customers";
    }
}
