package com.kellia.webtechmid.dao;

import com.kellia.webtechmid.model.Options;
import com.kellia.webtechmid.model.Questions;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class OptionsDao {

    public boolean createOptions(Options options) {
        //session //transaction //save //commit //close session
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.save(options);
        tx.commit();
        session.close();
        return Boolean.TRUE;
    }
    public boolean updateOptions(Options options) {
        //session //transaction //save //commit //close session
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.update(options);
        tx.commit();
        session.close();
        return Boolean.TRUE;
    }
    public boolean deleteOptions(Options options) {
        //session //transaction //save //commit //close session
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.delete(options);
        tx.commit();
        session.close();
        return Boolean.TRUE;
    }

    public List<Options> getAlloptions() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "FROM Options";
            Query<Options> query = session.createQuery(hql, Options.class);
            return query.list();
        } finally {
            session.close();
        }
    }
}
