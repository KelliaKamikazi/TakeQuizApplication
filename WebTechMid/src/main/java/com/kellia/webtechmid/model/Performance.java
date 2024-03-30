package com.kellia.webtechmid.model;

import jakarta.persistence.*;

import java.util.UUID;

@Entity
public class Performance {
    @Id
    UUID id;
    @OneToOne
    Users user;
    @OneToOne
    Quiz quiz;
    Float score;

    public Performance() {
    }

    public Performance(UUID id, Users user, Quiz quiz, Float score) {
        this.id = id;
        this.user = user;
        this.quiz = quiz;
        this.score = score;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public Quiz getQuiz() {
        return quiz;
    }

    public void setQuiz(Quiz quiz) {
        this.quiz = quiz;
    }

    public Float getScore() {
        return score;
    }

    public void setScore(Float score) {
        this.score = score;
    }
}
