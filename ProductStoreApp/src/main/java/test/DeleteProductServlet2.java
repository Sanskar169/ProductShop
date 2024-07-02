package test;

import java.io.*;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
@WebServlet("/deleteProduct")

public class DeleteProductServlet2 extends HttpServlet{
	
	protected void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException{
		HttpSession hs=req.getSession(false);
		if(hs==null) {
			req.setAttribute("msg", "Session expired..<br>");
			req.getRequestDispatcher("Msg.jsp");
		}
		else {
			ArrayList<ProductBean> al=(ArrayList<ProductBean>)hs.getAttribute("alist");
			String pCode=req.getParameter("pcode");
			
			
			Iterator<ProductBean> it = al.iterator();
			while(it.hasNext()) {
				ProductBean pb = (ProductBean)it.next();
				if(pCode.equals(pb.getCode())) {
					
					int k = new DeleteProductDAO().delete(pb);
					if(k>0){
						req.setAttribute("msg","Product Deleted..");
						req.getRequestDispatcher("DeleteProduct2.jsp").forward(req, res);
					}
					break;
				}
				
			}
			
		}
	}
	
	
}
