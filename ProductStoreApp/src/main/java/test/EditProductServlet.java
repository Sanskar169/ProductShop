package test;

import java.io.*;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
@WebServlet("/edit")
public class EditProductServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException{
		HttpSession hs=req.getSession(false);
		if(hs==null) {
			req.setAttribute("msg", "Session expired..<br>");
			req.getRequestDispatcher("MSg.jsp");
		}
		else {
			String pCode=req.getParameter("pcode");
			ArrayList<ProductBean> al=(ArrayList)hs.getAttribute("alist");
			Iterator<ProductBean> it=al.iterator();
			while(it.hasNext()) {
				ProductBean pb=(ProductBean)it.next();
				if(pCode.equals(pb.getCode())){
					req.setAttribute("pbean", pb);
					req.getRequestDispatcher("EditProduct.jsp").forward(req, res);
					break;
				}
			}
		}
	}

}
