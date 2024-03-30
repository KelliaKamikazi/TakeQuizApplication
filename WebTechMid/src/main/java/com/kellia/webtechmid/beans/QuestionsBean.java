package com.kellia.webtechmid.beans;

import com.kellia.webtechmid.model.Quiz;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

import java.util.UUID;

@Entity
public class QuestionsBean {
    @Id
    private UUID id;
    private String txtQuestion;
    private String answer;
    private float score;

    @ManyToOne
    private Quiz quiz;

    public QuestionsBean() {
    }

    public QuestionsBean(UUID id, String txtQuestion, String answer, float score, Quiz quiz) {
        this.id = id;
        this.txtQuestion = txtQuestion;
        this.answer = answer;
        this.score = score;
        this.quiz = quiz;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getTxtQuestion() {
        return txtQuestion;
    }

    public void setTxtQuestion(String txtQuestion) {
        this.txtQuestion = txtQuestion;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    public Quiz getQuiz() {
        return quiz;
    }

    public void setQuiz(Quiz quiz) {
        this.quiz = quiz;
    }
}