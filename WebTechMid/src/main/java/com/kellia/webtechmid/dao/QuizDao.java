package com.kellia.webtechmid.dao;

import com.kellia.webtechmid.model.Quiz;
import com.kellia.webtechmid.model.Users;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;
import java.util.UUID;

public class QuizDao {

    public boolean createQuiz(Quiz quiz) {
        //session //transaction //save //commit //close session
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.save(quiz);
        tx.commit();
        session.close();
        return Boolean.TRUE;
    }
    public boolean updateQuiz(Quiz quiz) {
        //session //transaction //save //commit //close session
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.update(quiz);
        tx.commit();
        session.close();
        return Boolean.TRUE;
    }
    public boolean deleteQuiz(Quiz quiz) {
        //session //transaction //save //commit //close session
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.delete(quiz);
        tx.commit();
        session.close();
        return Boolean.TRUE;
    }

    public static List<Quiz> getAllquiz() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "FROM Quiz";
            Query<Quiz> query = session.createQuery(hql, Quiz.class);
            return query.list();

        } finally {
            session.close();
        }
    }
    public Quiz getQuizById(UUID quizId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Quiz.class, quizId);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }
}
