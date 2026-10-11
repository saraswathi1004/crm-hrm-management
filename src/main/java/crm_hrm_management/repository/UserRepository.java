package crm_hrm_management.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import crm_hrm_management.entity.User;


public interface UserRepository extends JpaRepository<User, Long>{
	boolean existsByUsername(String username);

    boolean existsByEmail(String email);

    User findByUsername(String username);

}
