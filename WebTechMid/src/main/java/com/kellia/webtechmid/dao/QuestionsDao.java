package com.kellia.webtechmid.dao;

import com.kellia.webtechmid.model.Questions;
import com.kellia.webtechmid.model.Quiz;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class QuestionsDao {
    public boolean createQuestions(Questions question) {
        //session //transaction //save //commit //close session
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.save(question);
        tx.commit();
        session.close();
        return Boolean.TRUE;
    }
    public boolean updateQuestion(Questions  question) {
        //session //transaction //save //commit //close session
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.update(question);
        tx.commit();
        session.close();
        return Boolean.TRUE;
    }
    public boolean deleteQuestion(Questions question) {
        //session //transaction //save //commit //close session
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.delete(question);
        tx.commit();
        session.close();
        return Boolean.TRUE;
    }

    public static List<Questions> getAllquestion() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "FROM Questions";
            Query<Questions> query = session.createQuery(hql, Questions.class);
            return query.list();
        } finally {
            session.close();
        }
    }

}
