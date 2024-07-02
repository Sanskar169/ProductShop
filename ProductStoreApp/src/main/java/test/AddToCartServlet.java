package test;

import java.io.*;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
@WebServlet("/addC")
public class AddToCartServlet extends HttpServlet {
	
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
					int k=new AddToCartDAO().add(pb);
					if(k>0) {
						req.setAttribute("msg", "Product Added Successfully");
						req.getRequestDispatcher("AddToCart.jsp").forward(req, res);
						
					}else {
						req.setAttribute("msg", "Product Not Added");
						req.getRequestDispatcher("AddToCart.jsp").forward(req, res);
					}
					
					break;
				}
			}
		}
	}

}
