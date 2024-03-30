package com.kellia.webtechmid.beans;

import com.kellia.webtechmid.model.Quiz;
import com.kellia.webtechmid.model.Users;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;

import java.util.UUID;

public class PerformanceBean {
    @Id
    UUID id;
    @OneToOne
    Users user;
    @OneToOne
    Quiz quiz;
    Float score;

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
