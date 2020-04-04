package com.automate.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.automate.classes.Machine;
import com.automate.utl.HibernateUtil;


public class MachineDao {

    public void saveMachine(Machine mach) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(mach);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    
    public void updateMachine(Machine mach) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.update(mach);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public void deleteMachine(String numeroSerie) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            Machine mach = session.get(Machine.class, numeroSerie);
            if (mach != null) {
                session.delete(mach);
                System.out.println("machine supprimée");
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public Machine getMachine(String numeroSerie) {
        Transaction transaction = null;
        Machine mach = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            mach = session.get(Machine.class, numeroSerie);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return mach;
    }

    @SuppressWarnings("unchecked")
    public List<Machine> getAllMachines() {
        Transaction transaction = null;
        List<Machine> listMachines = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            listMachines = session.createQuery("from Machine").getResultList();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return listMachines;
    }  
}