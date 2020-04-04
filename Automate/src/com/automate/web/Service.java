package com.automate.web;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.net.URL;
import java.net.HttpURLConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

import com.automate.classes.*;
import com.automate.dao.*;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/Service")
public class Service extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private RapportDao rapportDao;

    public void init() {
    	rapportDao = new RapportDao();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String numSerie = request.getParameter("id");
		
		String u="http://localhost:8081/Automate/Module?id="+numSerie; 
		URL url=new URL(u);
		HttpURLConnection urlConn=(HttpURLConnection) url.openConnection();
		urlConn.setRequestMethod("GET");
		int responseCode = urlConn.getResponseCode();
		if(responseCode!=200)
			throw new RuntimeException("Réponse Http : "+responseCode);
		else {
			MachineDao machineDao = new MachineDao();
			Machine mach = machineDao.getMachine(numSerie);
			
				if(mach.getModule().equals("T2")) { //format json
					JSONObject json=null;
					try {
						json=new JSONObject(new JSONTokener(urlConn.getInputStream()));
						ObjectMapper mapper = new ObjectMapper();
						Rapport rap = mapper.readValue(json.toString(), Rapport.class);
						//enregistrer dans bd
						for(Article a:rap.getArticles())
							a.setRapport(rap);
						rap.setMachine(mach);
						mach.addRapports(rap);
						machineDao.updateMachine(mach);
						rapportDao.saveRapport(rap);	
					 }
					 catch(JSONException e) {
						e.getCause();
					}
				}
				else { //format xml
					InputStream inputStream = urlConn.getInputStream();
					byte[] res = new byte[2048];
					int i = 0;
					StringBuilder xml = new StringBuilder();
					while ((i = inputStream.read(res)) != -1) {
						xml.append(new String(res, 0, i));
					}
					inputStream.close();
					JAXBContext jaxbContext;
					try{
			            jaxbContext = JAXBContext.newInstance(Rapport.class);
			            Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
			            Rapport rap = (Rapport)jaxbUnmarshaller.unmarshal(new StringReader(xml.toString()));
			            //enregistrer dans bd
			            for(Article a:rap.getArticles())
							a.setRapport(rap);
						rap.setMachine(mach);
						mach.addRapports(rap);
						machineDao.updateMachine(mach);
						rapportDao.saveRapport(rap);
			        }
			        catch (JAXBException e){
			            e.printStackTrace();
			        }	
				}
				
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
