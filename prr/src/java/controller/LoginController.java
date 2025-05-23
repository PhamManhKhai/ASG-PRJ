
package controller;


import dal.AcountDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;


@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String user = request.getParameter("Username");
        String pass = request.getParameter("Password");
        String remem = request.getParameter("remem");
         Cookie cu = new Cookie("cuser", user);
        Cookie cp = new Cookie("cpass", pass);
        Cookie cr = new Cookie("crem", remem);
        AcountDBContext adb = new AcountDBContext();
        Account a = adb.login(user, pass);
        if (a==null) {
            request.setAttribute("mess", "Wrong user or pass");
            request.getRequestDispatcher("login.jsp").forward(request, response);           
        }else if (a.isActive()== false) {
            request.setAttribute("mess", "Account has been banned");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }else{
             if (remem != null) {
                //chon remember
                cu.setMaxAge(60 * 60 * 7 * 24);
                cp.setMaxAge(60 * 60 * 7 * 24);
                cr.setMaxAge(60 * 60 * 7 * 24);
            } else {
                // khong muon luu
                cu.setMaxAge(0);
                cp.setMaxAge(0);
                cr.setMaxAge(0);

            }
            //luu cookie va browser
            response.addCookie(cu);
            response.addCookie(cp);
            response.addCookie(cr);
            HttpSession session = request.getSession();
            session.setAttribute("acc", a);
            response.sendRedirect("home");
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
