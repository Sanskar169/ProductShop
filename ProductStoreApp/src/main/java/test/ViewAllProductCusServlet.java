package test;


import java.io.*;
import java.util.ArrayList;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
@SuppressWarnings("serial")
@WebServlet("/viewCus")

public class ViewAllProductCusServlet  extends HttpServlet {
	protected void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
	
		HttpSession hs=req.getSession(false);
		if(hs==null) {
			req.setAttribute("msg", "Session Expired...<br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		}else {
			ArrayList<ProductBean> al=new ViewProductDAO().retrieve();
			hs.setAttribute("alist", al);
			req.getRequestDispatcher("ViewCusProduct.jsp").forward(req, res);
			
		}	
	}
}