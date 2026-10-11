package crm_hrm_management.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import crm_hrm_management.entity.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Long> {

}