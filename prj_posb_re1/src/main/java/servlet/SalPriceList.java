package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import dbcon.OrderMenuDAO;
import dbcon.OrderMenuDTO;


@WebServlet("/SalPriceList.do")
public class SalPriceList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		OrderMenuDAO dao = new OrderMenuDAO();
		PrintWriter out = response.getWriter();
		JSONObject obj1 = new JSONObject();
		JSONArray jlist = new JSONArray();
		
		List<OrderMenuDTO> totalList = dao.totalpriceList();
		
		for(int i =0;i<totalList.size();i++) {
			
			JSONObject obj2 = new JSONObject();
			obj2.put("pay_date",totalList.get(i).getPay_date());
			obj2.put("totalprice",totalList.get(i).getTotalprice());
			jlist.put(obj2);
			
		}
		obj1.put("totalList",jlist);
		String jsonInfo = obj1.toString();
		System.out.println(jsonInfo);
		out.print(jsonInfo);
		
		
		
		
		
		
	}

}
