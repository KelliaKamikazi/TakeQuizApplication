package com.kellia.webtechmid.dao;

import com.kellia.webtechmid.model.Performance;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class PerformanceDao {

    public boolean createPerformance(Performance Performance) {
        //session //transaction //save //commit //close session
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.save(Performance);
        tx.commit();
        session.close();
        return Boolean.TRUE;
    }
    public boolean updatePerformance(Performance Performance) {
        //session //transaction //save //commit //close session
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.update(Performance);
        tx.commit();
        session.close();
        return Boolean.TRUE;
    }
    public boolean deletePerformance(Performance Performance) {
        //session //transaction //save //commit //close session
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.delete(Performance);
        tx.commit();
        session.close();
        return Boolean.TRUE;
    }

    public List<Performance> getAllPerformance() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "FROM Performance";
            Query<Performance> query = session.createQuery(hql, Performance.class);
            return query.list();
        } finally {
            session.close();
        }
    }
}
