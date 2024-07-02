package test;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
@SuppressWarnings("serial")
@WebServlet("/cus")
public class CustomerServlet extends HttpServlet{
	protected void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException{
		String uName=req.getParameter("uname");
		long pWord=Long.parseLong(req.getParameter("pword"));
		
		CustomerBean cb=new CustomerDAO().login(uName, pWord);
		
		//System.out.println("CustomerServlet "+ uName +"  "+ pWord);
		if(cb==null) {
			
			//System.out.println("CustomerServlet if()->"+ uName +"  "+ pWord);
			req.setAttribute("msg", "Invalid Username/Password");
			req.getRequestDispatcher("CustomerLogin.html").forward(req, res);
		}
		else {
			//System.out.println("CustomerServlet else->"+ uName +"  "+ pWord);
			HttpSession hs=req.getSession();
			hs.setAttribute("cbean", cb);
			req.setAttribute("msg","Login Successful...");
			req.getRequestDispatcher("CustomerLogin.jsp").forward(req, res);
		}
		
	}
}
