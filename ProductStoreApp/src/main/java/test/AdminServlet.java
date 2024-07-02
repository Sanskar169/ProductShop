package test;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
@SuppressWarnings("serial")
@WebServlet("/admin")

public class AdminServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		String uName=req.getParameter("uname");
		String pWord=req.getParameter("pword");
		
		AdminBean ab=new AdminDAO().login(uName, pWord);
		
		if(ab==null) {
			req.setAttribute("msg", "Invalid Login Username/Password<br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		}
		else {
			HttpSession hs=req.getSession();
			hs.setAttribute("abean", ab);
			req.getRequestDispatcher("AdminLogin.jsp").forward(req, res);
			
		}
		
		
	}

}
