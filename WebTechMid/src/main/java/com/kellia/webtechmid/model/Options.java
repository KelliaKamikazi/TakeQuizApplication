package com.kellia.webtechmid.model;

import jakarta.persistence.*;

import java.util.UUID;

@Entity
public class Options {
    @Id
    UUID OptionId;
    String OptionText;
    @ManyToOne
    Questions questionId;

    public Options() {
    }

    public Options(UUID optionId, String optionText, Questions questionId) {
        OptionId = optionId;
        OptionText = optionText;
        this.questionId = questionId;
    }

    public UUID getOptionId() {
        return OptionId;
    }

    public void setOptionId(UUID optionId) {
        OptionId = optionId;
    }

    public String getOptionText() {
        return OptionText;
    }

    public void setOptionText(String optionText) {
        OptionText = optionText;
    }

    public Questions getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Questions questionId) {
        this.questionId = questionId;
    }
}
