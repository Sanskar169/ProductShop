package test;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
@SuppressWarnings("serial")
@WebServlet("/add")


public class AddProductServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
		ProductBean pb=new ProductBean();
		pb.setCode(req.getParameter("code"));
		pb.setName(req.getParameter("name"));
		pb.setPrice(Double.parseDouble(req.getParameter("price")));
		pb.setQty(Integer.parseInt(req.getParameter("qty")));
		
		int k=new AddProductDAO().insert(pb);
		if(k>0) {
			req.setAttribute("msg", "Product Added Succesfully<br>");
			req.getRequestDispatcher("AddProduct.jsp").forward(req, res);
		}
	}
}
