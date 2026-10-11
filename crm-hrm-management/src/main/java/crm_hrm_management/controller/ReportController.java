
package crm_hrm_management.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import crm_hrm_management.repository.CustomerRepository;
import crm_hrm_management.repository.LeadRepository;
import crm_hrm_management.repository.FollowUpRepository;

@Controller
public class ReportController {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private LeadRepository leadRepository;

    @Autowired
    private FollowUpRepository followUpRepository;

    @GetMapping("/reports")
    public String showReports(Model model) {

        model.addAttribute(
                "customerCount", customerRepository.count());

        model.addAttribute(
                "leadCount", leadRepository.count());

        model.addAttribute(
                "followUpCount", followUpRepository.count());

        return "reports";
    }
}
