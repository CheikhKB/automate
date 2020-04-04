package com.automate.web;

import java.io.IOException;
import java.sql.SQLException;
import java.text.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.automate.dao.*;
import com.automate.classes.*;


@WebServlet("/")
public class Controleur extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private MachineDao machineDao;
    private NoteDao noteDao;

    public void init() {
    	machineDao = new MachineDao();
    	noteDao = new NoteDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/newMachine":
                    formMachine(request, response);
                    break;
                case "/insertMachine":
                	insererMachine(request, response);
                    break;
                case "/deleteMachine":
                	supMachine(request, response);
                    break;
                case "/editMachine":
                    formModif(request, response);
                    break;
                case "/updateMachine":
                	majMachine(request, response);
                    break;
                case "/newNote":
                    formNote(request, response);
                    break;
                case "/insertNote":
                	insererNote(request, response);
                    break;
                case "/deleteNote":
                	supNote(request, response);
                    break;
                case "/editNote":
                    formModifNote(request, response);
                    break;
                case "/updateNote":
                	majNote(request, response);
                    break;
                case "/list":
                    listMachine(request, response);
                    break;
                case "/detail":
                	detailMachine(request, response);
                    break;
                default:
                	dashboard(request, response);
                    break;
            }
        }catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listMachine(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<Machine> listMachine = machineDao.getAllMachines();
        request.setAttribute("listMachine", listMachine);
        RequestDispatcher dispatcher = request.getRequestDispatcher("listMachine.jsp");
        dispatcher.forward(request, response);
    }

    private void dashboard(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<Machine> machines = machineDao.getAllMachines();
        
        List<Machine> ventes=new ArrayList<Machine>();
        List<Machine> machineHS=new ArrayList<Machine>();
        List<Machine> machineAR=new ArrayList<Machine>();
        List<Machine> machineAtt=new ArrayList<Machine>();
        List<Rapport> lastRapports=new ArrayList<Rapport>();
        double caTotal=0; //chiffre d'affaires total
        for(Machine m :machines){
        	int indLast=m.getRapports().size()-1; //indice dernier rapport
        	
        	if(indLast>-1){
        		ventes.add(m);
        		Rapport rap=m.getRapports().get(indLast); //dernier rapport
        		
        		//hors service
        		if(rap.getEnService()==false) 
            		machineHS.add(m);
            	
        		//a surveiller
            	if(rap.getEnService()==true) { 
            		String ea=rap.getDetails().getEtatActuel(); //etat dernier rapport
            		if(ea.equals("erreur") || ea.equals("attention") || ea.equals("alarme"))
            			machineAtt.add(m);	
            	}
            		
            	//A réapprovisionner
            	List<Article> la = rap.getArticles();
            	for(Article a:la)
            		if(a.getQstock()<10){ //au moins un produit <10
            			machineAR.add(m);
            			break;
            		}
            	
            	//ajout dernier rapport à une liste pour diagrammes
            	lastRapports.add(rap);
            	caTotal+=rap.getChiffreAffaires();
        	}
        }
        
        caTotal=(double) Math.round(caTotal * 100) / 100;
        
        //ventes ordre decroissant
        Collections.sort(ventes, new Comparator<Machine>(){
        	@Override
            public int compare(Machine m1, Machine m2) {
                return Double.compare(m1.getRapports().get(m1.getRapports().size()-1).getChiffreAffaires(), m2.getRapports().get(m2.getRapports().size()-1).getChiffreAffaires());
        	}
        });
        Collections.reverse(ventes);
        
        request.setAttribute("ventes", ventes);
        request.setAttribute("machineHS", machineHS);
        request.setAttribute("machineAR", machineAR);
        request.setAttribute("machineAtt", machineAtt);
        request.setAttribute("rapports", lastRapports);
        request.setAttribute("montant", caTotal);
        RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
        dispatcher.forward(request, response);
    }
    
    private void formMachine(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("formMachine.jsp");
        dispatcher.forward(request, response);
    }

    private void formModif(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String ns = request.getParameter("id");
        Machine machine = machineDao.getMachine(ns);
        RequestDispatcher dispatcher = request.getRequestDispatcher("formMachine.jsp");
        request.setAttribute("machine", machine);
        dispatcher.forward(request, response);
    }

    private void detailMachine(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String ns = request.getParameter("id");
        Machine machine = machineDao.getMachine(ns);
        List<Note> notes=machine.getNotes();
        int indlast=machine.getRapports().size()-1;
        Rapport lastRapport;
        if(indlast>-1)
        	lastRapport = machine.getRapports().get(machine.getRapports().size()-1);
        else
        	lastRapport=null;
        RequestDispatcher dispatcher = request.getRequestDispatcher("detailsMachine.jsp");
        request.setAttribute("machine", machine);
        request.setAttribute("notes", notes);
        request.setAttribute("rapport", lastRapport);
        dispatcher.forward(request, response);
    }
    
    private void insererMachine(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int type = Integer.parseInt(request.getParameter("type"));
        String numeroSerie = request.getParameter("numeroSerie");
        String adresseInstallation = request.getParameter("adresseInstallation");
        String emplacement = request.getParameter("emplacement");
        String latitude = request.getParameter("latitude");
        String longitude = request.getParameter("longitude");
        String module = request.getParameter("module");
        Machine machine = new Machine(numeroSerie, type, adresseInstallation, emplacement, latitude, longitude, module);
        machineDao.saveMachine(machine);
        response.sendRedirect("list");
    }

    private void majMachine(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
    	int type = Integer.parseInt(request.getParameter("type"));
    	String numeroSerie = request.getParameter("numeroSerie");
        String adresseInstallation = request.getParameter("adresseInstallation");
        String emplacement = request.getParameter("emplacement");
        String latitude = request.getParameter("latitude");
        String longitude = request.getParameter("longitude");
        String module = request.getParameter("module");
        Machine machine = new Machine(numeroSerie, type, adresseInstallation, emplacement, latitude, longitude, module);
        machineDao.updateMachine(machine);
        response.sendRedirect("list");
    }

    private void supMachine(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
    	String ns = request.getParameter("id");
        machineDao.deleteMachine(ns);
        response.sendRedirect("list");
    }
    
    private void formNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String ns = request.getParameter("id");
        RequestDispatcher dispatcher = request.getRequestDispatcher("formNote.jsp");
        request.setAttribute("numeroSerie", ns);
        dispatcher.forward(request, response);
    }

    private void formModifNote(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int ns = Integer.parseInt(request.getParameter("id"));
        Note note = noteDao.getNote(ns);
        RequestDispatcher dispatcher = request.getRequestDispatcher("formNote.jsp");
        request.setAttribute("note", note);
        dispatcher.forward(request, response);
    }
    private void supNote(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
    	int ns = Integer.parseInt(request.getParameter("id"));
    	String numSer  = noteDao.getNote(ns).getMachine().getNumeroSerie();
        noteDao.deleteNote(ns);
        response.sendRedirect("detail?id="+numSer);
    }
    private void majNote(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
    	int ns = Integer.parseInt(request.getParameter("id"));
        Note oldNote = noteDao.getNote(ns);
    	String contenu = request.getParameter("contenu");
        String auteur = request.getParameter("auteur");
        String di = request.getParameter("dateIntervention");
        Date dateIntervention=null;
        try {
        	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        	dateIntervention = sdf.parse(di);
        }catch(ParseException e) {
        	e.printStackTrace();
        }
        Note note = new Note(dateIntervention, contenu, auteur);
        note.setMachine(oldNote.getMachine());
        noteDao.updateNote(note);
        response.sendRedirect("detail?id="+oldNote.getMachine().getNumeroSerie());
    }
    private void insererNote(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
    	String ns = request.getParameter("id");
        Machine machine = machineDao.getMachine(ns);
    	String contenu = request.getParameter("contenu");
        String auteur = request.getParameter("auteur");
        String di = request.getParameter("dateIntervention");
        Date dateIntervention=null;
        try {
        	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        	dateIntervention = sdf.parse(di);
        }catch(ParseException e) {
        	e.printStackTrace();
        }
        Note note = new Note(dateIntervention, contenu, auteur);
        note.setMachine(machine);
        noteDao.saveNote(note);
        response.sendRedirect("detail?id="+ns);
    }

}
