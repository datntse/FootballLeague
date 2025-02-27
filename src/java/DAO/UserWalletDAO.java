/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.DBContext;
import Model.TransitionHistory;
import Model.User;
import Model.UserWallet;
import Model.UserWalletOrder;
import Model.ViewModel.UserWalletOrderVM;
import Service.MailService;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;

public class UserWalletDAO extends DBContext {

    private Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public UserWalletDAO() {
        try {
            con = new DBContext().getConnection();
            System.out.println("Connect success");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean isExitUserWallet(int userId) {
        try {
            String sql = "SELECT * FROM UserWallet WHERE UserId = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            } else {
                sql = "INSERT INTO [UserWallet] (Ammount, CreateAt, UserId) VALUES (?, ?, ?)";
                ps = con.prepareStatement(sql);
                ps.setFloat(1, 0);
                DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                Date date = new Date();
                String currentDate = dateFormat.format(date);
                ps.setString(2, currentDate);
                ps.setInt(3, userId);
                int affectedRow = ps.executeUpdate();
                if (affectedRow > 0) {
                    System.out.println("Taoj vi tien thanh cong");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public UserWallet getUserWalletByUserId(int userId) {
        try {
            isExitUserWallet(userId);
            String sql = "SELECT * FROM UserWallet WHERE UserId = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            if (rs.next()) {
                UserWallet order = new UserWallet();
                order.setWalletId(rs.getInt("Id"));
                order.setAmmount(rs.getInt("Ammount"));
                order.setCreateAt(rs.getString("CreateAt"));
                order.setUserId(rs.getInt("UserId"));
                return order;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean addWalletOrder(int userWalletId, int userId, float amount) {
        try {
            String sql = "INSERT INTO UserWalletOrder (UserWalletId, Ammount, CreateAt, Status, UserId) VALUES (?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setInt(1, userWalletId);
            ps.setFloat(2, amount);
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            String currentDate = dateFormat.format(date);
            ps.setString(3, currentDate);
            ps.setInt(4, 0); // 0 for pending, 1 for approved, 2 for rejected    
            ps.setInt(5, userId);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public int getWalletOrdersTotal() {
        try {
            String sql = "SELECT COUNT(*) "
                    + "FROM UserWalletOrder uwo JOIN [User] u ON uwo.UserId = u.Id";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<UserWalletOrderVM> getWalletOrders(int index) {
        List<UserWalletOrderVM> orders = new ArrayList<>();
        try {
            String sql = "SELECT uwo.Id, uwo.UserId, uwo.Ammount, uwo.UserId, uwo.UserWalletId, uwo.Status, u.Email, u.Image "
                    + "FROM UserWalletOrder uwo JOIN [User] u ON uwo.UserId = u.Id ORDER BY uwo.CreateAt DESC OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";
            ps = con.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 5);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserWalletOrderVM order = new UserWalletOrderVM();
                order.setId(rs.getInt("Id"));
                order.setUserWalletId(rs.getInt("UserWalletId"));
                order.setAmmount(rs.getFloat("Ammount"));
                order.setStatus(rs.getInt("Status"));
                order.setUserId(rs.getInt("UserId"));
                order.setEmail(rs.getString("Email"));

                byte[] imgData = rs.getBytes("Image");
                String base64Image = null;
                if (imgData != null) {
                    base64Image = Base64.getEncoder().encodeToString(imgData);
                }
                order.setImage(base64Image);
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    public List<UserWalletOrderVM> getWalletOrdersPending() {
        List<UserWalletOrderVM> orders = new ArrayList<>();
        try {
            String sql = "SELECT uwo.Id, uwo.UserId, uwo.Ammount, uwo.UserId, uwo.UserWalletId, uwo.Status, u.Email, u.Image FROM UserWalletOrder uwo JOIN [User] u ON uwo.UserId = u.Id WHERE uwo.Status = 0";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserWalletOrderVM order = new UserWalletOrderVM();
                order.setId(rs.getInt("Id"));
                order.setUserWalletId(rs.getInt("UserWalletId"));
                order.setAmmount(rs.getFloat("Ammount"));
                order.setStatus(rs.getInt("Status"));
                order.setUserId(rs.getInt("UserId"));
                order.setEmail(rs.getString("Email"));

                byte[] imgData = rs.getBytes("Image");
                String base64Image = null;
                if (imgData != null) {
                    base64Image = Base64.getEncoder().encodeToString(imgData);
                }
                order.setImage(base64Image);
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    public boolean approveWalletOrder(int orderId) {
        try {
            String sql = "UPDATE UserWalletOrder SET Status = 1 WHERE Id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, orderId);
            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {                // Update user's wallet balance    
                sql = "SELECT UserId, Ammount, UserWalletId FROM UserWalletOrder WHERE Id = ?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, orderId);
                rs = ps.executeQuery();
                if (rs.next()) {
                    int userId = rs.getInt("UserId");
                    float amount = rs.getFloat("Ammount");
                    int walletId = rs.getInt("UserWalletId");
                    updateUserWalletBalance(userId, walletId, amount);

                    NotificationDAO notiDAO = new NotificationDAO();
                    String title = "NẠP TIỀN VÀO VÍ";
                    String contentNoti = "Bạn đã nạp tiền thành công!";
                    notiDAO.createNotification(userId, title, contentNoti);

                }
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean rejectWalletOrder(int orderId) {
        try {
            String sql = "UPDATE UserWalletOrder SET Status = 2 WHERE Id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, orderId);
            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                sql = "SELECT UserId, Ammount, UserWalletId FROM UserWalletOrder WHERE Id = ?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, orderId);
                rs = ps.executeQuery();
                if (rs.next()) {
                    int userId = rs.getInt("UserId");
                    float amount = rs.getFloat("Ammount");
                    int walletId = rs.getInt("UserWalletId");
                    updateUserWalletBalance(userId, walletId, amount);

                    NotificationDAO notiDAO = new NotificationDAO();
                    String title = "NẠP TIỀN VÀO VÍ";
                    String contentNoti = "Yêu cầu nạp tiền của bạn đã bị từ chối, vui lòng kiểm tra lại";
                    notiDAO.createNotification(userId, title, contentNoti);
                }
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }

    private boolean updateUserWalletBalance(int userId, int userWalletId, float amount) {
        try {
            String sql = "UPDATE UserWallet SET Ammount = Ammount + ? WHERE UserId = ? AND Id = ?";
            ps = con.prepareStatement(sql);
            ps.setFloat(1, amount);
            ps.setInt(2, userId);
            ps.setInt(3, userWalletId);

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                String content = "Bạn nạp thành công vào ví tiền " + amount;
                addTransitionHistory(content, userWalletId);

                AuthenticationDAO authDAO = new AuthenticationDAO();
                User user = authDAO.getUserById(userId);
                // send mail
                String contentEmail = "Bạn đã được thêm " + amount + " tiền bởi admin. Mọi thắc mắc vui lòng liên hệ!";
                MailService.sendMailWithInfo(user.getEmail(), contentEmail);
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;

    }

    public boolean addTransitionHistory(String Content, int WalletId) {
        try {
            String sql = "INSERT INTO TransitionHistory (Content, CreateAt, WalletId) VALUES (?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, Content);
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            String currentDate = dateFormat.format(date);
            ps.setString(2, currentDate);
            ps.setInt(3, WalletId);

            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public int getWalletHistoryTotal(int walletId) {
        try {
            String sql = "SELECT COUNT(*) FROM TransitionHistory WHERE WalletId = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, walletId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<TransitionHistory> getWalletHistory(int walletId, int index) {
        List<TransitionHistory> listHistory = new ArrayList();
        try {
            String sql = "SELECT * FROM TransitionHistory WHERE WalletId = ? ORDER BY CreateAt DESC  OFFSET ? ROWS FETCH NEXT 8 ROWS ONLY";
            ps = con.prepareStatement(sql);
            ps.setInt(1, walletId);
            ps.setInt(2, (index - 1) * 8);
            rs = ps.executeQuery();
            while (rs.next()) {
                TransitionHistory order = new TransitionHistory();
                order.setWalletId(rs.getInt("Id"));
                order.setContent(rs.getString("Content"));
                order.setCreateAt(rs.getString("CreateAt"));
                order.setWalletId(rs.getInt("WalletId"));
                listHistory.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listHistory;
    }

    public UserWallet getUserWalletById(int userId) {
        try {
            String sql = "SELECT * FROM UserWallet WHERE UserId = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            if (rs.next()) {
                float ammount = rs.getFloat("Ammount");
                UserWallet wallet = new UserWallet();
                // convert từ điểm sang tiền.
                wallet.setAmmount(ammount / 1000);
                wallet.setCreateAt(rs.getString("CreateAt"));
                wallet.setUserId(rs.getInt("UserId"));
                wallet.setWalletId(rs.getInt("Id"));
                return wallet;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public float getTotalWalletBalance() {
        float totalBalance = 0.0f;
        try {
            String sql = "SELECT SUM(Ammount) AS TotalBalance FROM UserWallet";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                totalBalance = rs.getFloat("TotalBalance");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalBalance;
    }

    public List<UserWalletOrder> getMonthlyWalletOrders(int month, int year) {
        List<UserWalletOrder> orders = new ArrayList<>();
        try {
            String sql = "SELECT * FROM UserWalletOrder WHERE MONTH(CreateAt) = ? AND YEAR(CreateAt) = ? AND Status = 1";
            ps = con.prepareStatement(sql);
            ps.setInt(1, month);
            ps.setInt(2, year);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserWalletOrder order = new UserWalletOrder();
                order.setId(rs.getInt("Id"));
                order.setUserWalletId(rs.getInt("UserWalletId"));
                order.setAmmount(rs.getFloat("Ammount"));
                order.setCreateAt(rs.getString("CreateAt"));
                order.setStatus(rs.getInt("Status"));
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    public static void main(String[] args) {
        UserWalletDAO userwallet = new UserWalletDAO();
        System.out.println("ammouint" + userwallet.getUserWalletById(1).getAmmount());
    }
}
