
package crm_hrm_management.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import crm_hrm_management.entity.Lead;

public interface LeadRepository extends JpaRepository<Lead, Long> {

}