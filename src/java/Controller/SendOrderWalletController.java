/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.NotificationDAO;
import DAO.UserWalletDAO;
import Model.User;
import Model.UserWallet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class SendOrderWalletController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("USER");
            String ammount = request.getParameter("ammount");
            UserWalletDAO userWalletDAO = new UserWalletDAO();
            UserWallet userWallet = userWalletDAO.getUserWalletByUserId(user.getId());
            if (userWallet != null) {
                float ammountPrice = Float.parseFloat(ammount);
                boolean result = userWalletDAO.addWalletOrder(userWallet.getWalletId(), user.getId(), ammountPrice);
                if (result) {
                    String content = "Gửi yêu cầu nạp " + ammount + " vào ví";
                    result = userWalletDAO.addTransitionHistory(content, userWallet.getWalletId());
                    if (result) {
                        System.out.println("Vào đây rồi");
                        NotificationDAO notiDAO = new NotificationDAO();
                        String title = "NẠP TIỀN VÀO VÍ";
                        String _content = "Yêu cầu nạp tiền của bạn đã được gửi, vui lòng đợi admin phê duyệt!";
                        notiDAO.createNotification(user.getId(), title, _content);

                        request.setAttribute("MESSAGE", "Gửi yêu cầu thành công vui lòng đợi admin duyệt");
                    }

                }
            }
            request.getRequestDispatcher("profile?action=view").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("ERROR", "Error while sending order");
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
