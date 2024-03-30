package com.kellia.webtechmid.beans;

import com.kellia.webtechmid.model.Questions;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

import java.util.UUID;

public class OptionsBean {
    @Id
    UUID OptionId;
    String OptionText;
    @ManyToOne
    Questions questionId;

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
