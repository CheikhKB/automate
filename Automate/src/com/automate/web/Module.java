package com.automate.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.List;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import com.fasterxml.jackson.databind.*;
import com.automate.dao.MachineDao;
import com.automate.classes.*;


@WebServlet("/Module")
public class Module extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		MachineDao machineDao = new MachineDao();
		Machine mach = machineDao.getMachine(id);
		
		if(mach==null)
			System.out.println("cette machine n'existe pas");
		else {
			//creation exemple objet rapport 
			String erreurs="carte a puce, carte sans contact";
			Detail dr = new Detail("alarme", 12, "normal", "erreur", "erreur", erreurs);
			List<Article> art=new ArrayList<Article>();
			art.add(new Article("cafe", 1.50, 5));
			art.add(new Article("lait chaud", 1.50, 1));
			art.add(new Article("the", 2.99, 2));
			art.add(new Article("mate", 1.50, 1));
			art.add(new Article("cafe touba", 2.99, 2));
			Date today = new Date();
			Rapport rap=new Rapport(today, true, dr, art, 313.21);
			
			if(mach.getModule().equals("T2")) { //format json
				ObjectMapper mapper = new ObjectMapper();
			    String jsonString = mapper.writeValueAsString(rap);
			    PrintWriter out = response.getWriter();
			    response.setContentType("application/json");
			    response.setCharacterEncoding("UTF-8");
			    out.print(jsonString);
			    out.flush();	
			}
			else {//format xml
				try {
					JAXBContext contextObj = JAXBContext.newInstance(Rapport.class);  
					Marshaller marshallerObj = contextObj.createMarshaller();  
				    marshallerObj.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
				    StringWriter sw = new StringWriter();
				    marshallerObj.marshal(rap, sw);
				    PrintWriter out = response.getWriter();
				    response.setContentType("application/xml");
				    response.setCharacterEncoding("UTF-8");
				    out.print(sw.toString());
				    out.flush();
				}catch(JAXBException e){
					e.printStackTrace();
				}
			}	
		}		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
