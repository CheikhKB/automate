package com.automate.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.automate.classes.Rapport;
import com.automate.utl.HibernateUtil;


public class RapportDao {

    public void saveRapport(Rapport rapp) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(rapp);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public void deleteRapport(int id) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            Rapport rap = session.get(Rapport.class, id);
            if (rap != null) {
                session.delete(rap);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
    
}