package ads.customers;

public interface CustomerService {
    void registerCustomer(String name, String email, String password) throws Exception;

    boolean loginCustomer(String email, String password);

    void updateCustomerStatus(String email, boolean isActive) throws Exception;

    void updateCustomerStatus(String email) throws Exception;
}
