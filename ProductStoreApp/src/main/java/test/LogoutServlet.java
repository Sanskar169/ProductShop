package test;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		HttpSession hs=req.getSession(false);
		if(hs==null) {
			req.setAttribute("msg", "Session expired.. <br>");
		}
		else {
			hs.removeAttribute("abean");
			hs.invalidate();
			req.setAttribute("msg", "Logged Out Successfully<br>");
		}
		req.getRequestDispatcher("Msg.jsp").forward(req, res);
		
	}
}
