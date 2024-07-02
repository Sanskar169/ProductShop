package test;

import java.io.*;
import java.util.ArrayList;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
@SuppressWarnings("serial")
@WebServlet("/ViewCart")

public class ViewCartServlet  extends HttpServlet {
	protected void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
	
		HttpSession hs=req.getSession(false);
		if(hs==null) {
			req.setAttribute("msg", "Session Expired...<br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		}else {
			ArrayList<ProductBean> al=new ViewCartDAO().retrieve();
			hs.setAttribute("al", al);
			req.getRequestDispatcher("ViewCart.jsp").forward(req, res);
			
		}	
	}
}