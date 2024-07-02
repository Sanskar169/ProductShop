package test;

import java.io.*;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
@WebServlet("/update")

public class UpdateProductServlet extends HttpServlet{
	
	protected void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException{
		HttpSession hs=req.getSession(false);
		if(hs==null) {
			req.setAttribute("msg", "Session expired..<br>");
			req.getRequestDispatcher("Msg.jsp");
		}
		else {
			ArrayList<ProductBean> al=(ArrayList<ProductBean>)hs.getAttribute("alist");
			String pCode=req.getParameter("pcode");
			Double pPrice = Double.parseDouble(req.getParameter("price"));
			int pQty = Integer.parseInt(req.getParameter("qty"));
			
			Iterator<ProductBean> it = al.iterator();
			while(it.hasNext()) {
				ProductBean pb = (ProductBean)it.next();
				if(pCode.equals(pb.getCode())) {
					pb.setPrice(pPrice);//Updating ProductBean
					pb.setQty(pQty);//Updating ProductBean
					int k = new UpdateProductDAO().update(pb);
					if(k>0){
						req.setAttribute("msg", pb.getName()+" Updated..");
						req.getRequestDispatcher("UpdateProduct.jsp").forward(req, res);
					}
					break;
				}
				else {
					req.setAttribute("msg", "Product  not Updated..");
					req.getRequestDispatcher("UpdateProduct.jsp").forward(req, res);
				}
				
			}
			
		}
	}
	
	
}
