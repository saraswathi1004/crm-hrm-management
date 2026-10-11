
package crm_hrm_management.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import crm_hrm_management.dto.LoginRequest;
import crm_hrm_management.entity.User;
import crm_hrm_management.service.UserService;

@Controller
public class LoginController {

    private final UserService userService;

    public LoginController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/login")
    public String login(
            @ModelAttribute LoginRequest request,
            Model model) {

        try {
            User user = userService.loginUser(
                request.getUsername(),
                request.getPassword()
            );

            if ("CRM".equals(user.getRole())) {
                return "redirect:/crm-dashboard";
            } else if ("HRM".equals(user.getRole())) {
                return "redirect:/hrm-dashboard";
            }

            model.addAttribute("errorMessage", "Invalid user role.");

        } catch (RuntimeException e) {
            model.addAttribute(
                "errorMessage",
                "Invalid username or password."
            );
        }

        return "login";
    }
}
