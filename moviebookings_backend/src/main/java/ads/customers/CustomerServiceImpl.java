package ads.customers;

import ads.ConnectionPool;
import ads.ConnectionPoolImpl;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class CustomerServiceImpl implements CustomerService {
    private final ConnectionPool connectionPool;

    public CustomerServiceImpl() {
        this.connectionPool = ConnectionPoolImpl.getInstance();
    }

    public static void main(String[] args) {
        CustomerService customerService = new CustomerServiceImpl();
        boolean loopselector = true;
        Scanner scanner = new Scanner(System.in);
        while (loopselector) {
            System.out.println("1. Đăng ký");
            System.out.println("2. Đăng nhập");
            System.out.println("3. thay đổi trạng thái");
            System.out.println("4. break");
            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume newline
            switch (choice) {
                case 1:
                    System.out.print("Nhập tên: ");
                    String name = scanner.nextLine();
                    System.out.print("Nhập email: ");
                    String email = scanner.nextLine();
                    System.out.print("Nhập mật khẩu: ");
                    String password = scanner.nextLine();
                    try {
                        customerService.registerCustomer(name, email, password);
                        System.out.println("Đăng ký thành công!");
                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                    }
                    break;
                case 2:
                    System.out.print("Nhập email: ");
                    String loginEmail = scanner.nextLine();
                    System.out.print("Nhập mật khẩu: ");
                    String loginPassword = scanner.nextLine();
                    boolean loggedIn = customerService.loginCustomer(loginEmail, loginPassword);
                    if (loggedIn) {
                        System.out.println("Đăng nhập thành công!");
                    } else {
                        System.out.println("Sai email hoặc mật khẩu.");
                    }
                    break;
                case 3:
                    System.out.print("Nhập email để thay đổi trạng thái hoạt động: ");
                    String statusEmail = scanner.nextLine();
                    try {
                        customerService.updateCustomerStatus(statusEmail);
                        System.out.println("Cập nhật trạng thái thành công!");
                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                    }
                    break;
                case 4:
                    loopselector = false;
                    break;
                default:
                    System.out.println("Lựa chọn không hợp lệ.");
                    break;
            }
        }
        scanner.close();
    }

    @Override
    public void registerCustomer(String name, String email, String password) throws Exception {
        try (Connection connection = connectionPool.getConnection("CustomerServiceImpl.registerCustomer")) {
            // Check if customer already exists
            String checkCustomerQuery = "SELECT * FROM tbltcustomers WHERE customer_email = ?";
            try (PreparedStatement checkStmt = connection.prepareStatement(checkCustomerQuery)) {
                checkStmt.setString(1, email);
                try (ResultSet resultSet = checkStmt.executeQuery()) {
                    if (resultSet.next()) {
                        throw new Exception("Tài khoản đã tồn tại. Vui lòng nhập lại email.");
                    }
                }
            }

            // Insert new customer
            String insertCustomerQuery = "INSERT INTO tbltcustomers (customer_name, customer_email, customer_password, customer_is_active) VALUES (?, ?, md5(?),true)";
            try (PreparedStatement insertStmt = connection.prepareStatement(insertCustomerQuery)) {
                insertStmt.setString(1, name);
                insertStmt.setString(2, email);
                insertStmt.setString(3, password);
                insertStmt.executeUpdate();
            }
        }
    }

    @Override
    public boolean loginCustomer(String email, String password) {
        try (Connection connection = connectionPool.getConnection("CustomerServiceImpl.loginCustomer")) {
            // Try to log in with plain text password
            String loginQuery = "SELECT * FROM tbltcustomers WHERE customer_email = ? AND (customer_password = ? OR customer_password = md5(?))";
            try (PreparedStatement stmt = connection.prepareStatement(loginQuery)) {
                stmt.setString(1, email);
                stmt.setString(2, password);
                stmt.setString(3, password);
                try (ResultSet resultSet = stmt.executeQuery()) {
                    if (resultSet.next()) {
                        return resultSet.getBoolean("customer_is_active");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public void updateCustomerStatus(String email, boolean isActive) throws Exception {
        try (Connection connection = connectionPool.getConnection("CustomerServiceImpl.updateCustomerStatus")) {
            // Check if customer exists
            String checkCustomerQuery = "SELECT * FROM tbltcustomers WHERE customer_email = ?";
            try (PreparedStatement checkStmt = connection.prepareStatement(checkCustomerQuery)) {
                checkStmt.setString(1, email);
                try (ResultSet resultSet = checkStmt.executeQuery()) {
                    if (!resultSet.next()) {
                        throw new Exception("Tài khoản không tồn tại.");
                    }
                }
            }

            // Update customer status
            String updateStatusQuery = "UPDATE tbltcustomers SET customer_is_active = ? WHERE customer_email = ?";
            try (PreparedStatement updateStmt = connection.prepareStatement(updateStatusQuery)) {
                updateStmt.setBoolean(1, isActive);
                updateStmt.setString(2, email);
                updateStmt.executeUpdate();
            }
        }
    }

    @Override
    public void updateCustomerStatus(String email) throws Exception {
        try (Connection connection = connectionPool.getConnection("CustomerServiceImpl.updateCustomerStatus")) {
            // Check if customer exists
            String checkCustomerQuery = "SELECT * FROM tbltcustomers WHERE customer_email = ?";
            try (PreparedStatement checkStmt = connection.prepareStatement(checkCustomerQuery)) {
                checkStmt.setString(1, email);
                try (ResultSet resultSet = checkStmt.executeQuery()) {
                    if (!resultSet.next()) {
                        throw new Exception("Tài khoản không tồn tại.");
                    } else {
                        boolean currentStatus = resultSet.getBoolean("customer_is_active");
                        boolean newStatus = !currentStatus;
                        // Update customer status
                        String updateStatusQuery = "UPDATE tbltcustomers SET customer_is_active = ? WHERE customer_email = ?";
                        try (PreparedStatement updateStmt = connection.prepareStatement(updateStatusQuery)) {
                            updateStmt.setBoolean(1, newStatus);
                            updateStmt.setString(2, email);
                            updateStmt.executeUpdate();
                        }
                    }
                }
            }
        }
    }

    private String md5Hash(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(password.getBytes());
            byte[] digest = md.digest();
            StringBuilder sb = new StringBuilder();
            for (byte b : digest) {
                sb.append(String.format("%02x", b & 0xff));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

}
