
package crm_hrm_management.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import crm_hrm_management.dto.SignupRequest;
import crm_hrm_management.entity.User;
import crm_hrm_management.service.UserService;

@Controller
public class SignupController {

    private final UserService userService;

    public SignupController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/signup")
    public String registerUser(
            @ModelAttribute SignupRequest request,
            Model model) {

        try {
            User user = new User();

            user.setFullName(request.getFullName());
            user.setEmail(request.getEmail());
            user.setUsername(request.getUsername());
            user.setPassword(request.getPassword());
            user.setRole(request.getRole());

            userService.registerUser(user);

            model.addAttribute(
                "successMessage",
                "Account created successfully!"
            );

        } catch (RuntimeException e) {
            model.addAttribute("errorMessage", e.getMessage());
        }

        return "signup";
    }
}
