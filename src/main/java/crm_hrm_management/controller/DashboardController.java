
package crm_hrm_management.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    @GetMapping("/hrm-dashboard")
    public String hrmDashboard() {
        return "hrm-dashboard";
    }

    @GetMapping("/crm-dashboard")
    public String crmDashboard() {
        return "crm-dashboard";
    }
}
