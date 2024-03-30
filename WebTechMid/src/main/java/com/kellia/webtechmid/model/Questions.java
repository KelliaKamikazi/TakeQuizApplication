package com.kellia.webtechmid.model;

import jakarta.persistence.*;

import java.util.UUID;

@Entity
public class Questions {
    //this is the class for questions
    @Id
    UUID id;
    String txtQuestion;
    String answer;
    float score ;
    @ManyToOne
    @JoinColumn(name = "quiz_id")
    private Quiz quiz;
    public Questions() {
    }

    public Questions(UUID id, String txtQuestion, String answer, float score, Quiz quiz) {
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
