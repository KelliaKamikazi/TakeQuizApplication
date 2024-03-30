package com.kellia.webtechmid.dao;

import com.kellia.webtechmid.model.Users;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class UsersDao {
    public boolean createUser(Users user) {
        //session //transaction //save //commit //close session
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.save(user);
        tx.commit();
        session.close();
        return Boolean.TRUE;
    }
    public boolean updateUser(Users user) {
        //session //transaction //save //commit //close session
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.update(user);
        tx.commit();
        session.close();
        return Boolean.TRUE;
    }
    public boolean deleteUser(Users user) {
        //session //transaction //save //commit //close session
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.delete(user);
        tx.commit();
        session.close();
        return Boolean.TRUE;
    }

    public List<Users> getAllusers() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "FROM Users";
            Query<Users> query = session.createQuery(hql, Users.class);
            return query.list();
        } finally {
            session.close();
        }
    }



}
