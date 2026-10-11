
package crm_hrm_management.service;

import java.util.List;

import org.springframework.stereotype.Service;

import crm_hrm_management.entity.Payroll;
import crm_hrm_management.repository.PayrollRepository;

@Service
public class PayrollService {

    private final PayrollRepository payrollRepository;

    public PayrollService(PayrollRepository payrollRepository) {
        this.payrollRepository = payrollRepository;
    }

    public Payroll addPayroll(Payroll payroll) {
        double netSalary = payroll.getBasicSalary()
                + payroll.getAllowance()
                - payroll.getDeduction();

        payroll.setNetSalary(netSalary);

        if (payroll.getPaymentStatus() == null
                || payroll.getPaymentStatus().isBlank()) {
            payroll.setPaymentStatus("Pending");
        }

        return payrollRepository.save(payroll);
    }

    public List<Payroll> getAllPayrolls() {
        return payrollRepository.findAll();
    }

    public Payroll getPayrollById(Long id) {
        return payrollRepository.findById(id)
                .orElseThrow(() ->
                        new RuntimeException("Payroll not found: " + id));
    }

    public Payroll updatePayroll(Long id, Payroll updatedPayroll) {
        Payroll payroll = getPayrollById(id);

        payroll.setEmployeeId(updatedPayroll.getEmployeeId());
        payroll.setEmployeeName(updatedPayroll.getEmployeeName());
        payroll.setBasicSalary(updatedPayroll.getBasicSalary());
        payroll.setAllowance(updatedPayroll.getAllowance());
        payroll.setDeduction(updatedPayroll.getDeduction());
        payroll.setPaymentDate(updatedPayroll.getPaymentDate());
        payroll.setPaymentStatus(updatedPayroll.getPaymentStatus());

        payroll.setNetSalary(
                updatedPayroll.getBasicSalary()
                + updatedPayroll.getAllowance()
                - updatedPayroll.getDeduction()
        );

        return payrollRepository.save(payroll);
    }

    public void deletePayroll(Long id) {
        payrollRepository.deleteById(id);
    }
}
