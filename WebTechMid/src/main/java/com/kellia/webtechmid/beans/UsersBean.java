package com.kellia.webtechmid.beans;

import com.kellia.webtechmid.model.Role;
import jakarta.persistence.Id;

import java.util.UUID;

public class UsersBean {
    @Id
    UUID id;
    String userName ;
    String email;
    String password;
    Role role ;

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}
