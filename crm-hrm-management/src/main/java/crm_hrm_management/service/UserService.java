
package crm_hrm_management.service;

import org.springframework.stereotype.Service;
import org.springframework.security.crypto.password.PasswordEncoder;

import crm_hrm_management.entity.User;
import crm_hrm_management.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public UserService(
            UserRepository userRepository,
            PasswordEncoder passwordEncoder) {

        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public User registerUser(User user) {

        if (userRepository.existsByUsername(user.getUsername())) {
            throw new RuntimeException("Username already exists");
        }

        if (userRepository.existsByEmail(user.getEmail())) {
            throw new RuntimeException("Email already exists");
        }

        if (user.getPassword() == null ||
                user.getPassword().length() < 8) {
            throw new RuntimeException(
                "Password must contain at least 8 characters"
            );
        }

        String role = user.getRole();

        if (role == null ||
                !(role.equalsIgnoreCase("CRM") ||
                  role.equalsIgnoreCase("HRM"))) {
            throw new RuntimeException("Invalid role selected");
        }

        user.setRole(role.toUpperCase());

        // Store the password as entered (demo purpose only).
        // Plain-text passwords are not safe for real applications.
        user.setPassword(user.getPassword());

        return userRepository.save(user);
    }

    public User loginUser(String username, String password) {

        User user = userRepository.findByUsername(username);

        if (user == null) {
            throw new RuntimeException("Invalid username or password");
        }

        // For your current plain-text demo registration:
        if (!user.getPassword().equals(password)) {
            throw new RuntimeException("Invalid username or password");
        }

        return user;
    }
}
