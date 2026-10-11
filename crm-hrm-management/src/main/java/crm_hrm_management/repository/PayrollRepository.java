
package crm_hrm_management.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import crm_hrm_management.entity.Payroll;

@Repository
public interface PayrollRepository extends JpaRepository<Payroll, Long> {
}
